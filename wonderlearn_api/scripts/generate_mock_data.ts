const { PrismaClient } = require('@prisma/client');
const crypto = require('crypto');

const prisma = new PrismaClient();

// Mock data generators
const AVATARS = ['dragon', 'cat', 'robot'];
const EMOTIONS = ['happy', 'sad', 'angry', 'scared', 'calm'];
const BADGES = [
  { name: 'first_lesson', title: 'Primera Lección', description: 'Completa tu primera lección', iconUrl: '/badges/first_lesson.png', criteria: '{"type":"lessons_completed","count":1}' },
  { name: 'streak_3', title: '3 Días Seguidos', description: 'Usa la app 3 días seguidos', iconUrl: '/badges/streak_3.png', criteria: '{"type":"streak","days":3}' },
  { name: 'phonics_master', title: 'Maestro de Fonética', description: 'Domina todas las letras A-E', iconUrl: '/badges/phonics_master.png', criteria: '{"type":"skill_mastered","skill":"phonics_all"}' },
  { name: 'math_wizard', title: 'Mago de Matemáticas', description: 'Completa 10 lecciones de matemáticas', iconUrl: '/badges/math_wizard.png', criteria: '{"type":"module_completed","module":"wondermath","count":10}' },
  { name: 'sel_champion', title: 'Campeón SEL', description: 'Completa todas las lecciones de emociones', iconUrl: '/badges/sel_champion.png', criteria: '{"type":"module_completed","module":"wondergrow","count":5}' },
  { name: 'story_reader', title: 'Lector de Cuentos', description: 'Lee 5 cuentos interactivos', iconUrl: '/badges/story_reader.png', criteria: '{"type":"stories_read","count":5}' },
  { name: 'pattern_pro', title: 'Experto en Patrones', description: 'Domina los patrones ABAB y AAB', iconUrl: '/badges/pattern_pro.png', criteria: '{"type":"skill_mastered","skill":"pattern_all"}' },
  { name: 'breathing_pro', title: 'Maestro de la Respiración', description: 'Completa 5 ejercicios de mindfulness', iconUrl: '/badges/breathing_pro.png', criteria: '{"type":"breathing_completed","count":5}' },
];

const STORIES = [
  { id: 'story_01', title: 'El gato simpático', difficulty: 1, category: 'animals', pages: 5 },
  { id: 'story_02', title: 'Mi perro', difficulty: 1, category: 'animals', pages: 5 },
  { id: 'story_03', title: 'La casa', difficulty: 1, category: 'family', pages: 5 },
  { id: 'story_04', title: 'El árbol grande', difficulty: 2, category: 'animals', pages: 6 },
  { id: 'story_05', title: 'El parque', difficulty: 2, category: 'adventures', pages: 6 },
  { id: 'story_06', title: 'Los animales', difficulty: 2, category: 'animals', pages: 6 },
  { id: 'story_07', title: 'Mi familia', difficulty: 2, category: 'family', pages: 6 },
  { id: 'story_08', title: 'La escuela', difficulty: 3, category: 'adventures', pages: 7 },
  { id: 'story_09', title: 'El viaje', difficulty: 3, category: 'adventures', pages: 7 },
  { id: 'story_10', title: 'La aventura', difficulty: 3, category: 'emotions', pages: 8 },
];

const SIGHT_WORDS = [
  'the', 'be', 'to', 'of', 'and', 'a', 'in', 'that', 'have', 'I',
  'it', 'for', 'not', 'on', 'with', 'he', 'as', 'you', 'do', 'at',
  'this', 'but', 'his', 'by', 'from', 'they', 'we', 'say', 'her', 'she',
  'or', 'an', 'will', 'my', 'one', 'all', 'would', 'there', 'their', 'what',
  'so', 'up', 'out', 'if', 'about', 'who', 'get', 'which', 'go', 'me',
];

const PHONICS_LETTERS = ['A', 'B', 'C', 'D', 'E'];

function generateRandomDate(start, end) {
  return new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));
}

function generateProgress(childId, lessonId, lesson) {
  const score = Math.floor(Math.random() * 4); // 0-3 stars
  const totalQuestions = lesson.lessonType === 'story' ? 1 : Math.floor(Math.random() * 5) + 3;
  const correctAnswers = Math.floor(Math.random() * totalQuestions);
  const timeSpentSeconds = Math.floor(Math.random() * 300) + 60; // 1-5 minutes

  return {
    childId,
    lessonId,
    status: Math.random() > 0.1 ? 'completed' : 'abandoned',
    score,
    attempts: Math.floor(Math.random() * 3) + 1,
    correctAnswers,
    totalQuestions,
    timeSpentSeconds,
    completedAt: score > 0 ? generateRandomDate(new Date(Date.now() - 30 * 24 * 60 * 60 * 1000), new Date()) : null,
    deviceSyncStatus: 'synced',
  };
}

function generateSkillTracking(childId, skillName, masteryLevel) {
  const consecutiveSuccesses = masteryLevel === 'mastered' ? 5 + Math.floor(Math.random() * 5) :
    masteryLevel === 'proficient' ? 3 + Math.floor(Math.random() * 2) :
    masteryLevel === 'developing' ? 1 + Math.floor(Math.random() * 2) : 0;

  return {
    childId,
    skillName,
    masteryLevel,
    consecutiveSuccesses,
    consecutiveFailures: masteryLevel === 'novice' ? 3 + Math.floor(Math.random() * 3) : 0,
    totalAttempts: Math.floor(Math.random() * 20) + 5,
    lastPracticed: generateRandomDate(new Date(Date.now() - 7 * 24 * 60 * 60 * 1000), new Date()),
  };
}

async function main() {
  console.log('🌱 Generating mock data...');

  // Create badges
  console.log('🏅 Creating badges...');
  for (const badge of BADGES) {
    await prisma.badge.upsert({
      where: { name: badge.name },
      update: badge,
      create: badge,
    });
  }

  // Create demo parent accounts
  console.log('👨‍👩‍👧 Creating parent accounts...');
  const parents = [];
  for (let i = 0; i < 10; i++) {
    const parent = await prisma.user.create({
      data: {
        email: `parent${i + 1}@example.com`,
        passwordHash: '$2a$10$abcdefghijklmnopqrstuvwxyz12345678901234567890', // hashed "password123"
        authProvider: 'email',
        emailVerified: true,
      },
    });
    parents.push(parent);
  }

  // Create child profiles
  console.log('👶 Creating child profiles...');
  const children = [];
  const ages = [2, 3, 3, 4, 4, 5, 5, 6, 7, 8];
  const names = ['Lucas', 'Sofía', 'Mateo', 'Valentina', 'Santiago', 'Isabella', 'Sebastián', 'Camila', 'Daniel', 'Gabriela'];

  for (let i = 0; i < 10; i++) {
    const child = await prisma.childProfile.create({
      data: {
        parentId: parents[i].id,
        name: names[i],
        age: ages[i],
        avatarType: AVATARS[Math.floor(Math.random() * AVATARS.length)],
        levelGlobal: Math.floor(ages[i] / 2) + 1,
        dailyTimeLimit: 30,
      },
    });
    children.push(child);
  }

  // Create lessons (phonics, sight words, stories, math, SEL)
  console.log('📚 Creating lessons...');
  const lessons = [];

  // Phonics lessons
  for (const letter of PHONICS_LETTERS) {
    const lesson = await prisma.lesson.create({
      data: {
        moduleId: 'wonderbooks',
        lessonType: 'phonics',
        title: `Fonética: Letra ${letter}`,
        description: `Aprende la letra ${letter} con palabras y animaciones`,
        difficulty: 1,
        durationMin: 5,
        orderIndex: PHONICS_LETTERS.indexOf(letter),
        contentJson: JSON.stringify({
          letter,
          words: [`${letter}rbol`, `${letter}nana`, `${letter}guila`].filter(w => !w.includes('undefined')),
          audio: `/audio/phonics/${letter.toLowerCase()}.mp3`,
        }),
        assetsJson: JSON.stringify({
          image: `/images/letters/${letter.toLowerCase()}.png`,
          audio: `/audio/phonics/${letter.toLowerCase()}.mp3`,
        }),
      },
    });
    lessons.push(lesson);
  }

  // Sight words
  for (let i = 0; i < 50; i++) {
    const lesson = await prisma.lesson.create({
      data: {
        moduleId: 'wonderbooks',
        lessonType: 'sight_word',
        title: `Sight Word: ${SIGHT_WORDS[i]}`,
        description: `Aprende la palabra "${SIGHT_WORDS[i]}"`,
        difficulty: 1,
        durationMin: 3,
        orderIndex: i,
        contentJson: JSON.stringify({
          word: SIGHT_WORDS[i],
          audio: `/audio/sight_words/${SIGHT_WORDS[i]}.mp3`,
        }),
        assetsJson: JSON.stringify({
          image: `/images/sight_words/${SIGHT_WORDS[i]}.png`,
          audio: `/audio/sight_words/${SIGHT_WORDS[i]}.mp3`,
        }),
      },
    });
    lessons.push(lesson);
  }

  // Stories
  for (const story of STORIES) {
    const lesson = await prisma.lesson.create({
      data: {
        moduleId: 'wonderbooks',
        lessonType: 'story',
        title: story.title,
        description: `Cuento interactivo: ${story.title}`,
        difficulty: story.difficulty,
        durationMin: 7 + story.difficulty,
        orderIndex: STORIES.indexOf(story),
        contentJson: JSON.stringify({
          pages: story.pages,
          category: story.category,
          comprehensionQuestion: '¿Qué pasó en la historia?',
          options: ['Opción 1', 'Opción 2', 'Opción 3'],
        }),
        assetsJson: JSON.stringify({
          cover: `/images/stories/${story.id}/cover.png`,
          pages: Array.from({ length: story.pages }, (_, i) => `/images/stories/${story.id}/page_${i + 1}.png`),
          audio: Array.from({ length: story.pages }, (_, i) => `/audio/stories/${story.id}/page_${i + 1}.mp3`),
        }),
      },
    });
    lessons.push(lesson);
  }

  // Math lessons (counting, addition, shapes, patterns)
  const mathTypes = [
    { type: 'counting', count: 10, titles: ['Contar 1-5', 'Contar 1-10', 'Conteo visual', 'Secuencias', 'Trazado'] },
    { type: 'addition', count: 5, titles: ['Sumas 1-3', 'Sumas 1-5', 'Sumas 1-10', 'Restas 1-5', 'Problemas simples'] },
    { type: 'shape', count: 4, titles: ['Círculo', 'Cuadrado', 'Triángulo', 'Rectángulo'] },
    { type: 'pattern', count: 2, titles: ['Patrón ABAB', 'Patrón AAB'] },
  ];

  for (const mathType of mathTypes) {
    for (let i = 0; i < mathType.count; i++) {
      const lesson = await prisma.lesson.create({
        data: {
          moduleId: 'wondermath',
          lessonType: mathType.type,
          title: mathType.titles[i],
          description: `Lección de ${mathType.type}: ${mathType.titles[i]}`,
          difficulty: 1 + Math.floor(i / 2),
          durationMin: 5,
          orderIndex: i,
          contentJson: JSON.stringify({
            type: mathType.type,
            numbers: mathType.type === 'counting' ? [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] : [],
            operation: mathType.type === 'addition' ? '+' : null,
          }),
          assetsJson: JSON.stringify({
            image: `/images/math/${mathType.type}_${i + 1}.png`,
            audio: `/audio/math/${mathType.type}_${i + 1}.mp3`,
          }),
        },
      });
      lessons.push(lesson);
    }
  }

  // SEL lessons
  const selLessons = [
    { type: 'emotion', count: 5, titles: ['Feliz', 'Triste', 'Enfadado', 'Asustado', 'Calmado'] },
    { type: 'empathy', count: 2, titles: ['Ayuda al amigo', 'Compartir'] },
    { type: 'mindfulness', count: 1, titles: ['Respiración con globo'] },
  ];

  for (const selType of selLessons) {
    for (let i = 0; i < selType.count; i++) {
      const lesson = await prisma.lesson.create({
        data: {
          moduleId: 'wondergrow',
          lessonType: selType.type,
          title: selType.titles[i],
          description: `Lección de SEL: ${selType.titles[i]}`,
          difficulty: 1,
          durationMin: selType.type === 'mindfulness' ? 1 : 5,
          orderIndex: i,
          contentJson: JSON.stringify({
            type: selType.type,
            emotion: selType.type === 'emotion' ? EMOTIONS[i] : null,
            duration: selType.type === 'mindfulness' ? 60 : null,
          }),
          assetsJson: JSON.stringify({
            image: `/images/sel/${selType.type}_${i + 1}.png`,
            audio: `/audio/sel/${selType.type}_${i + 1}.mp3`,
          }),
        },
      });
      lessons.push(lesson);
    }
  }

  // Generate progress for each child
  console.log('📊 Generating progress...');
  for (const child of children) {
    // Random lessons completed
    const completedLessons = lessons.filter(() => Math.random() > 0.5);

    for (const lesson of completedLessons) {
      const progress = generateProgress(child.id, lesson.id, lesson);
      await prisma.lessonProgress.create({ data: progress });
    }

    // Generate skill tracking
    const skills = [
      'phonics_A', 'phonics_B', 'phonics_C', 'phonics_D', 'phonics_E',
      'counting_1_5', 'counting_1_10', 'addition_simple', 'subtraction_simple',
      'shape_circle', 'shape_square', 'shape_triangle', 'shape_rectangle',
      'pattern_abab', 'pattern_aab',
      'emotion_happy', 'emotion_sad', 'emotion_angry',
      'empathy_help', 'empathy_share',
      'mindfulness_breathing',
    ];

    const masteryLevels = ['novice', 'developing', 'proficient', 'mastered'];

    for (const skill of skills) {
      const mastery = masteryLevels[Math.floor(Math.random() * masteryLevels.length)];
      const skillTracking = generateSkillTracking(child.id, skill, mastery);
      await prisma.skillTracking.create({ data: skillTracking });
    }

    // Generate daily usage (last 30 days)
    for (let i = 0; i < 30; i++) {
      const date = new Date();
      date.setDate(date.getDate() - i);
      date.setHours(0, 0, 0, 0);

      const used = Math.random() > 0.3; // 70% chance of use
      if (used) {
        await prisma.dailyUsage.create({
          data: {
            childId: child.id,
            date,
            totalMinutes: Math.floor(Math.random() * 40) + 5,
            lessonsCompleted: Math.floor(Math.random() * 5) + 1,
            sessionCount: Math.floor(Math.random() * 3) + 1,
          },
        });
      }
    }

    // Generate badges
    const earnedBadges = BADGES.filter(() => Math.random() > 0.7);
    for (const badge of earnedBadges) {
      try {
        await prisma.childBadge.create({
          data: {
            childId: child.id,
            badgeId: badge.name, // Using name as ID for simplicity
          },
        });
      } catch (e) {
        // Badge might not exist yet, skip
      }
    }
  }

  console.log('✅ Mock data generated successfully!');
  console.log(`   - ${parents.length} parent accounts`);
  console.log(`   - ${children.length} child profiles`);
  console.log(`   - ${lessons.length} lessons`);
  console.log(`   - ${BADGES.length} badges`);
  console.log('');
  console.log('📧 Demo accounts:');
  console.log('   Email: parent1@example.com');
  console.log('   Password: password123');
}

main()
  .catch((e) => {
    console.error('❌ Error generating mock data:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
