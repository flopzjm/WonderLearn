const { PrismaClient } = require('@prisma/client');
const bcrypt = require('bcryptjs');

const prisma = new PrismaClient();

async function main() {
  console.log('🌱 Seeding database...');

  // Create demo parent
  const passwordHash = await bcrypt.hash('password123', 10);
  
  const parent = await prisma.user.create({
    data: {
      email: 'demo@wonderlearn.app',
      passwordHash,
      authProvider: 'email',
      emailVerified: true,
    },
  });

  console.log('👨 Created demo parent:', parent.email);

  // Create demo child
  const child = await prisma.childProfile.create({
    data: {
      parentId: parent.id,
      name: 'Lucas',
      age: 5,
      avatarType: 'dragon',
      levelGlobal: 3,
      dailyTimeLimit: 30,
    },
  });

  console.log('👶 Created demo child:', child.name, '(age', child.age, ')');

  // Create badges
  const badges = [
    { name: 'first_lesson', title: 'Primera Lección', description: 'Completa tu primera lección', iconUrl: '/badges/first_lesson.png', criteria: '{"type":"lessons_completed","count":1}' },
    { name: 'streak_3', title: '3 Días Seguidos', description: 'Usa la app 3 días seguidos', iconUrl: '/badges/streak_3.png', criteria: '{"type":"streak","days":3}' },
    { name: 'phonics_master', title: 'Maestro de Fonética', description: 'Domina todas las letras A-E', iconUrl: '/badges/phonics_master.png', criteria: '{"type":"skill_mastered","skill":"phonics_all"}' },
    { name: 'math_wizard', title: 'Mago de Matemáticas', description: 'Completa 10 lecciones de matemáticas', iconUrl: '/badges/math_wizard.png', criteria: '{"type":"module_completed","module":"wondermath","count":10}' },
    { name: 'sel_champion', title: 'Campeón SEL', description: 'Completa todas las lecciones de emociones', iconUrl: '/badges/sel_champion.png', criteria: '{"type":"module_completed","module":"wondergrow","count":5}' },
    { name: 'story_reader', title: 'Lector de Cuentos', description: 'Lee 5 cuentos interactivos', iconUrl: '/badges/story_reader.png', criteria: '{"type":"stories_read","count":5}' },
    { name: 'pattern_pro', title: 'Experto en Patrones', description: 'Domina los patrones ABAB y AAB', iconUrl: '/badges/pattern_pro.png', criteria: '{"type":"skill_mastered","skill":"pattern_all"}' },
    { name: 'breathing_pro', title: 'Maestro de la Respiración', description: 'Completa 5 ejercicios de mindfulness', iconUrl: '/badges/breathing_pro.png', criteria: '{"type":"breathing_completed","count":5}' },
  ];

  for (const badge of badges) {
    await prisma.badge.create({ data: badge });
  }

  console.log('🏅 Created', badges.length, 'badges');

  // Create sample lessons (phonics A-E)
  const phonicsLessons = ['A', 'B', 'C', 'D', 'E'];
  for (let i = 0; i < phonicsLessons.length; i++) {
    await prisma.lesson.create({
      data: {
        id: `phonics-${phonicsLessons[i].toLowerCase()}`,
        moduleId: 'wonderbooks',
        lessonType: 'phonics',
        title: `Fonética: Letra ${phonicsLessons[i]}`,
        description: `Aprende la letra ${phonicsLessons[i]} con palabras y animaciones`,
        difficulty: 1,
        durationMin: 5,
        orderIndex: i,
        contentJson: JSON.stringify({
          letter: phonicsLessons[i],
          words: [`${phonicsLessons[i]}rbol`, `${phonicsLessons[i]}nana`, `${phonicsLessons[i]}guila`],
          audio: `/audio/phonics/${phonicsLessons[i].toLowerCase()}.mp3`,
        }),
        assetsJson: JSON.stringify({
          image: `/images/letters/${phonicsLessons[i].toLowerCase()}.png`,
          audio: `/audio/phonics/${phonicsLessons[i].toLowerCase()}.mp3`,
        }),
      },
    });
  }

  console.log('📚 Created 5 phonics lessons (A-E)');

  // Create sample math lessons
  const mathLessons = [
    { id: 'math-counting-1', title: 'Contar 1-5', type: 'counting' },
    { id: 'math-addition-1', title: 'Sumas 1-3', type: 'addition' },
    { id: 'math-shape-1', title: 'Círculo', type: 'shape' },
    { id: 'math-pattern-1', title: 'Patrón ABAB', type: 'pattern' },
  ];

  for (let i = 0; i < mathLessons.length; i++) {
    await prisma.lesson.create({
      data: {
        id: mathLessons[i].id,
        moduleId: 'wondermath',
        lessonType: mathLessons[i].type,
        title: mathLessons[i].title,
        description: `Lección de ${mathLessons[i].type}: ${mathLessons[i].title}`,
        difficulty: 1,
        durationMin: 5,
        orderIndex: i,
        contentJson: JSON.stringify({ type: mathLessons[i].type }),
        assetsJson: JSON.stringify({
          image: `/images/math/${mathLessons[i].type}.png`,
          audio: `/audio/math/${mathLessons[i].type}.mp3`,
        }),
      },
    });
  }

  console.log('🔢 Created 4 math lessons');

  // Create sample SEL lessons
  const selLessons = [
    { id: 'sel-happy', title: 'Feliz', type: 'emotion' },
    { id: 'sel-sad', title: 'Triste', type: 'emotion' },
    { id: 'sel-empathy-1', title: 'Ayuda al amigo', type: 'empathy' },
    { id: 'sel-breathing-1', title: 'Respiración con globo', type: 'mindfulness' },
  ];

  for (let i = 0; i < selLessons.length; i++) {
    await prisma.lesson.create({
      data: {
        id: selLessons[i].id,
        moduleId: 'wondergrow',
        lessonType: selLessons[i].type,
        title: selLessons[i].title,
        description: `Lección de SEL: ${selLessons[i].title}`,
        difficulty: 1,
        durationMin: selLessons[i].type === 'mindfulness' ? 1 : 5,
        orderIndex: i,
        contentJson: JSON.stringify({ type: selLessons[i].type }),
        assetsJson: JSON.stringify({
          image: `/images/sel/${selLessons[i].type}.png`,
          audio: `/audio/sel/${selLessons[i].type}.mp3`,
        }),
      },
    });
  }

  console.log('💚 Created 4 SEL lessons');

  console.log('');
  console.log('✅ Database seeded successfully!');
  console.log('');
  console.log('📧 Demo account:');
  console.log('   Email: demo@wonderlearn.app');
  console.log('   Password: password123');
}

main()
  .catch((e) => {
    console.error('❌ Error seeding database:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
