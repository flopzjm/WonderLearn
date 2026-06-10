# 🎙️ Guía de Assets de Audio con ElevenLabs

## Información General

| Detalle | Valor |
|---------|-------|
| **Herramienta** | ElevenLabs (elevenlabs.io) |
| **Costo estimado** | $5-22/mes |
| **Formato salida** | MP3, 44.1kHz, 128kbps |
| **Uso** | Narración cuentos, fonética, sight words, instrucciones |

---

## 🎯 Configuración Recomendada

### Voice Selection
| Uso | Voz Recomendada | Género | Idioma |
|-----|-----------------|--------|--------|
| Narrador principal | "Rachel" o "Bella" | Femenino | Español |
| Personajes masculinos | "Adam" o "Antoni" | Masculino | Español |
| Personajes femeninos | "Elli" o "Josh" | Femenino | Español |
| Niños | "Grace" o "Charlie" | Neutro | Español |

### Audio Settings
```
Model: Eleven Multilingual v2
Stability: 0.6 (para variedad emocional)
Similarity Boost: 0.8 (para consistencia)
Style: 0.3 (para expresividad)
```

### Export Settings
```
Format: MP3
Sample Rate: 44100 Hz
Bit Rate: 128 kbps
Channel: Mono
```

---

## 🔤 FONÉTICA (26 letras)

**Carpeta:** `wonderlearn_app/assets/audio/phonics/`

### Audio por letra
Para cada letra, generar 4 clips:

| Archivo | Script | Notas |
|---------|--------|-------|
| `letter_A.mp3` | "La letra A" | Tono educativo, claro |
| `letter_A_words.mp3` | "Árbol. Avión. Ardilla." | Pausa 0.5s entre palabras |
| `letter_A_sound.mp3` | "Aaaa" | Sonido de la letra, 2 segundos |
| `letter_A_complete.mp3` | "La letra A. Árbol. Avión. Ardilla." | Clip completo |

### Scripts completos

```json
{
  "A": {
    "letter": "La letra A",
    "words": "Árbol. Avión. Ardilla.",
    "sound": "Aaaa",
    "complete": "La letra A. Árbol. Avión. Ardilla."
  },
  "B": {
    "letter": "La letra B",
    "words": "Bola. Casa. Barco.",
    "sound": "Beee",
    "complete": "La letra B. Bola. Casa. Barco."
  },
  "C": {
    "letter": "La letra C",
    "words": "Cama. Conejo. Corazón.",
    "sound": "Ce",
    "complete": "La letra C. Cama. Conejo. Corazón."
  },
  "D": {
    "letter": "La letra D",
    "words": "Dado. Dedo. Duende.",
    "sound": "De",
    "complete": "La letra D. Dado. Dedo. Duende."
  },
  "E": {
    "letter": "La letra E",
    "words": "Estrella. Espada. Escalera.",
    "sound": "Eeee",
    "complete": "La letra E. Estrella. Espada. Escalera."
  },
  "F": {
    "letter": "La letra F",
    "words": "Foca. Fresa. Flor.",
    "sound": "Efe",
    "complete": "La letra F. Foca. Fresa. Flor."
  },
  "G": {
    "letter": "La letra G",
    "words": "Gato. Globo. Guitarra.",
    "sound": "Ge",
    "complete": "La letra G. Gato. Globo. Guitarra."
  },
  "H": {
    "letter": "La letra H",
    "words": "Helado. Sombrero. Huevo.",
    "sound": "Hache",
    "complete": "La letra H. Helado. Sombrero. Huevo."
  },
  "I": {
    "letter": "La letra I",
    "words": "Iglesia. Isla. Jirafa.",
    "sound": "Iii",
    "complete": "La letra I. Iglesia. Isla. Jirafa."
  },
  "J": {
    "letter": "La letra J",
    "words": "Jirafa. Jugo. Juguete.",
    "sound": "Jota",
    "complete": "La letra J. Jirafa. Jugo. Juguete."
  },
  "K": {
    "letter": "La letra K",
    "words": "Koala. Kayak. Kiwi.",
    "sound": "Ka",
    "complete": "La letra K. Koala. Kayak. Kiwi."
  },
  "L": {
    "letter": "La letra L",
    "words": "León. Luna. Libro.",
    "sound": "Ele",
    "complete": "La letra L. León. Luna. Libro."
  },
  "M": {
    "letter": "La letra M",
    "words": "Mono. Mesa. Mariposa.",
    "sound": "Eme",
    "complete": "La letra M. Mono. Mesa. Mariposa."
  },
  "N": {
    "letter": "La letra N",
    "words": "Nube. Niño. Naranja.",
    "sound": "Ene",
    "complete": "La letra N. Nube. Niño. Naranja."
  },
  "Ñ": {
    "letter": "La letra Ñ",
    "words": "Ñoño. Ñu. España.",
    "sound": "Eñe",
    "complete": "La letra Ñ. Ñoño. Ñu. España."
  },
  "O": {
    "letter": "La letra O",
    "words": "Oso. Ojo. Oveja.",
    "sound": "Ooo",
    "complete": "La letra O. Oso. Ojo. Oveja."
  },
  "P": {
    "letter": "La letra P",
    "words": "Pato. Piedra. Pájaro.",
    "sound": "Pe",
    "complete": "La letra P. Pato. Piedra. Pájaro."
  },
  "Q": {
    "letter": "La letra Q",
    "words": "Queso. Quetzal.",
    "sound": "Cu",
    "complete": "La letra Q. Queso. Quetzal."
  },
  "R": {
    "letter": "La letra R",
    "words": "Rana. Rosa. Reloj.",
    "sound": "Erre",
    "complete": "La letra R. Rana. Rosa. Reloj."
  },
  "S": {
    "letter": "La letra S",
    "words": "Sol. Silla. Serpiente.",
    "sound": "Ese",
    "complete": "La letra S. Sol. Silla. Serpiente."
  },
  "T": {
    "letter": "La letra T",
    "words": "Tigre. Taza. Tortuga.",
    "sound": "Te",
    "complete": "La letra T. Tigre. Taza. Tortuga."
  },
  "U": {
    "letter": "La letra U",
    "words": "Uva. Paraguas.",
    "sound": "Uuu",
    "complete": "La letra U. Uva. Paraguas."
  },
  "V": {
    "letter": "La letra V",
    "words": "Vaca. Vaso. Vela.",
    "sound": "Uve",
    "complete": "La letra V. Vaca. Vaso. Vela."
  },
  "W": {
    "letter": "La letra W",
    "words": "Water. Ballena. Ventana.",
    "sound": "Doble u",
    "complete": "La letra W. Water. Ballena. Ventana."
  },
  "X": {
    "letter": "La letra X",
    "words": "Xilófono. Rayos X.",
    "sound": "Equis",
    "complete": "La letra X. Xilófono. Rayos X."
  },
  "Y": {
    "letter": "La letra Y",
    "words": "Yoga. Hilo. Yate.",
    "sound": "I griega",
    "complete": "La letra Y. Yoga. Hilo. Yate."
  },
  "Z": {
    "letter": "La letra Z",
    "words": "Zebra. Zapato. Zoológico.",
    "sound": "Zeta",
    "complete": "La letra Z. Zebra. Zapato. Zoológico."
  }
}
```

---

## 📚 CUENTOS (10)

**Carpeta:** `wonderlearn_app/assets/audio/stories/`

### Cuento 01: El gato simpático

```json
{
  "story_01": {
    "title": "El gato simpático",
    "pages": [
      {
        "page": 1,
        "text": "Había vez un gatito naranja que vivía en una casa bonita. Le gustaba mirar por la ventana.",
        "file": "story_01_page_1.mp3"
      },
      {
        "page": 2,
        "text": "Al día siguiente, el gatito encontró una bola de lana roja. ¡Empezó a jugar con ella!",
        "file": "story_01_page_2.mp3"
      },
      {
        "page": 3,
        "text": "Después, el gatito tuvo mucha hambre. Comió de su plato colorido.",
        "file": "story_01_page_3.mp3"
      },
      {
        "page": 4,
        "text": "Ya era tarde. El gatito estaba cansado y se durmió en su cama.",
        "file": "story_01_page_4.mp3"
      },
      {
        "page": 5,
        "text": "Al despertar, el gatito vio pájaros colorados por la ventana.",
        "file": "story_01_page_5.mp3"
      },
      {
        "page": 6,
        "text": "¡El gatito hizo nuevos amigos! Un ratoncito vino a jugar con él.",
        "file": "story_01_page_6.mp3"
      }
    ],
    "title_audio": "story_01_title.mp3"
  }
}
```

### Cuento 02: Mi perro

```json
{
  "story_02": {
    "title": "Mi perro",
    "pages": [
      {
        "page": 1,
        "text": "Tengo un perrito marrón con orejas largas. Se llama Max.",
        "file": "story_02_page_1.mp3"
      },
      {
        "page": 2,
        "text": "A Max le encanta mover la cola cuando estoy feliz.",
        "file": "story_02_page_2.mp3"
      },
      {
        "page": 3,
        "text": "Max juega con su pelota todos los días.",
        "file": "story_02_page_3.mp3"
      },
      {
        "page": 4,
        "text": "Cuando tiene hambre, come de su plato azul.",
        "file": "story_02_page_4.mp3"
      },
      {
        "page": 5,
        "text": "Por la noche, Max duerme en su cama con su mantita.",
        "file": "story_02_page_5.mp3"
      }
    ],
    "title_audio": "story_02_title.mp3"
  }
}
```

### Cuento 03: La casa

```json
{
  "story_03": {
    "title": "La casa",
    "pages": [
      {
        "page": 1,
        "text": "Esta es mi casa. Es colorida y tiene un jardín bonito.",
        "file": "story_03_page_1.mp3"
      },
      {
        "page": 2,
        "text": "En el salón hay un sofá y muchos juguetes.",
        "file": "story_03_page_2.mp3"
      },
      {
        "page": 3,
        "text": "La cocina es donde mamá prepara la comida.",
        "file": "story_03_page_3.mp3"
      },
      {
        "page": 4,
        "text": "Mi cuarto tiene mi cama y mis peluches favoritos.",
        "file": "story_03_page_4.mp3"
      },
      {
        "page": 5,
        "text": "El jardín tiene flores de muchos colores y mariposas.",
        "file": "story_03_page_5.mp3"
      }
    ],
    "title_audio": "story_03_title.mp3"
  }
}
```

### Cuento 04: El árbol grande

```json
{
  "story_04": {
    "title": "El árbol grande",
    "pages": [
      {
        "page": 1,
        "text": "En el campo hay un árbol muy grande y bonito.",
        "file": "story_04_page_1.mp3"
      },
      {
        "page": 2,
        "text": "En las ramas viven pajaritos de muchos colores.",
        "file": "story_04_page_2.mp3"
      },
      {
        "page": 3,
        "text": "Una ardillita sube y baja por el tronco.",
        "file": "story_04_page_3.mp3"
      },
      {
        "page": 4,
        "text": "Los niños juegan debajo del árbol cuando hace calor.",
        "file": "story_04_page_4.mp3"
      },
      {
        "page": 5,
        "text": "En otoño, las hojas se ponen amarillas y rojas.",
        "file": "story_04_page_5.mp3"
      },
      {
        "page": 6,
        "text": "Todos los animalitos se reunieron alrededor del árbol.",
        "file": "story_04_page_6.mp3"
      }
    ],
    "title_audio": "story_04_title.mp3"
  }
}
```

### Cuentos 05-10 (patrón similar)
Para los cuentos 05-10, usar el mismo patrón con los textos del guion.

---

## 👁️ SIGHT WORDS (50)

**Carpeta:** `wonderlearn_app/assets/audio/sight_words/`

### Scripts por palabra

```json
{
  "the": {"audio": "the", "file": "sight_the.mp3"},
  "be": {"audio": "be", "file": "sight_be.mp3"},
  "to": {"audio": "to", "file": "sight_to.mp3"},
  "of": {"audio": "of", "file": "sight_of.mp3"},
  "and": {"audio": "and", "file": "sight_and.mp3"},
  "a": {"audio": "a", "file": "sight_a.mp3"},
  "in": {"audio": "in", "file": "sight_in.mp3"},
  "that": {"audio": "that", "file": "sight_that.mp3"},
  "have": {"audio": "have", "file": "sight_have.mp3"},
  "I": {"audio": "I", "file": "sight_I.mp3"},
  "it": {"audio": "it", "file": "sight_it.mp3"},
  "for": {"audio": "for", "file": "sight_for.mp3"},
  "not": {"audio": "not", "file": "sight_not.mp3"},
  "on": {"audio": "on", "file": "sight_on.mp3"},
  "with": {"audio": "with", "file": "sight_with.mp3"},
  "he": {"audio": "he", "file": "sight_he.mp3"},
  "as": {"audio": "as", "file": "sight_as.mp3"},
  "you": {"audio": "you", "file": "sight_you.mp3"},
  "do": {"audio": "do", "file": "sight_do.mp3"},
  "at": {"audio": "at", "file": "sight_at.mp3"},
  "this": {"audio": "this", "file": "sight_this.mp3"},
  "but": {"audio": "but", "file": "sight_but.mp3"},
  "his": {"audio": "his", "file": "sight_his.mp3"},
  "by": {"audio": "by", "file": "sight_by.mp3"},
  "from": {"audio": "from", "file": "sight_from.mp3"},
  "they": {"audio": "they", "file": "sight_they.mp3"},
  "we": {"audio": "we", "file": "sight_we.mp3"},
  "say": {"audio": "say", "file": "sight_say.mp3"},
  "her": {"audio": "her", "file": "sight_her.mp3"},
  "she": {"audio": "she", "file": "sight_she.mp3"},
  "or": {"audio": "or", "file": "sight_or.mp3"},
  "an": {"audio": "an", "file": "sight_an.mp3"},
  "will": {"audio": "will", "file": "sight_will.mp3"},
  "my": {"audio": "my", "file": "sight_my.mp3"},
  "one": {"audio": "one", "file": "sight_one.mp3"},
  "all": {"audio": "all", "file": "sight_all.mp3"},
  "would": {"audio": "would", "file": "sight_would.mp3"},
  "there": {"audio": "there", "file": "sight_there.mp3"},
  "their": {"audio": "their", "file": "sight_their.mp3"},
  "what": {"audio": "what", "file": "sight_what.mp3"},
  "so": {"audio": "so", "file": "sight_so.mp3"},
  "up": {"audio": "up", "file": "sight_up.mp3"},
  "out": {"audio": "out", "file": "sight_out.mp3"},
  "if": {"audio": "if", "file": "sight_if.mp3"},
  "about": {"audio": "about", "file": "sight_about.mp3"},
  "who": {"audio": "who", "file": "sight_who.mp3"},
  "get": {"audio": "get", "file": "sight_get.mp3"},
  "which": {"audio": "which", "file": "sight_which.mp3"},
  "go": {"audio": "go", "file": "sight_go.mp3"},
  "me": {"audio": "me", "file": "sight_me.mp3"}
}
```

---

## 🎮 INSTRUCCIONES DEL JUEGO

**Carpeta:** `wonderlearn_app/assets/audio/instructions/`

### Scripts de instrucciones

```json
{
  "general": {
    "welcome": "¡Bienvenido a WonderLearn! Vamos a aprender jugando.",
    "file": "instr_welcome.mp3"
  },
  "phonics": {
    "intro": "Toca la letra para escuchar su sonido.",
    "correct": "¡Muy bien! Esa es la respuesta correcta.",
    "incorrect": "¡Casi! Intenta otra vez.",
    "file_intro": "instr_phonics_intro.mp3",
    "file_correct": "instr_correct.mp3",
    "file_incorrect": "instr_incorrect.mp3"
  },
  "sight_words": {
    "intro": "¿Cuál es la palabra que ves? Toca la correcta.",
    "file": "instr_sight_words.mp3"
  },
  "stories": {
    "intro": "Lee el cuento conmigo. Toca la pantalla para pasar la página.",
    "file": "instr_stories.mp3"
  },
  "counting": {
    "intro": "Toca los objetos para contar. ¿Cuántos ves?",
    "file": "instr_counting.mp3"
  },
  "addition": {
    "intro": "Suma los números. ¿Cuánto es el total?",
    "file": "instr_addition.mp3"
  },
  "shapes": {
    "intro": "¿Qué forma es? Toca la respuesta correcta.",
    "file": "instr_shapes.mp3"
  },
  "patterns": {
    "intro": "Observa el patrón. ¿Qué sigue?",
    "file": "instr_patterns.mp3"
  },
  "emotions": {
    "intro": "¿Cómo se siente el personaje? Elige la emoción.",
    "file": "instr_emotions.mp3"
  },
  "empathy": {
    "intro": "¿Qué harías en esta situación? Elige la mejor opción.",
    "file": "instr_empathy.mp3"
  },
  "breathing": {
    "intro": "Respira profundo conmigo. Sigue el círculo.",
    "file": "instr_breathing.mp3"
  },
  "rewards": {
    "star": "¡Estrella ganada! Excelente trabajo.",
    "badge": "¡Insignia desbloqueada! Eres increíble.",
    "level_up": "¡Subiste de nivel! Sigue así.",
    "file_star": "instr_star.mp3",
    "file_badge": "instr_badge.mp3",
    "file_level": "instr_level.mp3"
  }
}
```

---

## 🎵 MÚSICA DE FONDO

**Carpeta:** `wonderlearn_app/assets/audio/music/`

| Archivo | Uso | BPM | Duración |
|---------|-----|-----|----------|
| `music_main_menu.mp3` | Menú principal | 100 | Loop 30s |
| `music_lesson.mp3` | Lecciones | 80 | Loop 60s |
| `music_game.mp3` | Minijuegos | 120 | Loop 45s |
| `music_story.mp3` | Cuentos | 70 | Loop 60s |
| `music_celebration.mp3` | Celebración | 140 | 15s |
| `music_calm.mp3` | Respiración/Calma | 60 | Loop 60s |
| `music_loading.mp3` | Carga | 90 | Loop 10s |

**Nota:** Estas pistas se generan con **Suno AI** (ver guía separada).

---

## 📊 Resumen de Audio

| Categoría | Cantidad | Duración aprox |
|-----------|----------|----------------|
| Fonética (letras) | 104 clips | 5 min |
| Fonética (sonidos) | 26 clips | 1 min |
| Cuentos (narración) | 55-60 clips | 30 min |
| Cuentos (títulos) | 10 clips | 30 seg |
| Sight words | 50 clips | 1 min |
| Instrucciones | 20 clips | 2 min |
| **TOTAL** | **~265 clips** | **~40 min** |

---

## 💰 Costo Estimado

| Plan | Créditos | Clips | Costo |
|------|----------|-------|-------|
| Free | 10,000 | ~100 | $0 |
| Starter | 10,000/mes | ~100 | $5/mes |
| Creator | 100,000/mes | ~1,000 | $22/mes |
| Pro | 500,000/mes | ~5,000 | $99/mes |

**Recomendación:** Plan Creator ($22/mes) para generar todos los clips.

---

## 📝 Instrucciones Paso a Paso

### Paso 1: Crear cuenta
1. Ir a elevenlabs.io
2. Click "Sign Up"
3. Plan Creator ($22/mes)

### Paso 2: Configurar voz
1. Ir a "Voices" > "VoiceLab"
2. Seleccionar voz "Rachel" (español)
3. Ajustar: Stability 0.6, Similarity 0.8

### Paso 3: Generar audio
1. Ir a "Text to Speech"
2. Pegar script
3. Seleccionar voz
4. Click "Generate"
5. Descargar MP3

### Paso 4: Organizar
1. Crear carpetas según estructura
2. Renombrar archivos con convención
3. Verificar calidad de audio

---

## 🎯 Tips de Calidad

1. **Consistencia:** Usar siempre la misma voz
2. **Pausas:** Usar "..." para pausas naturales
3. **Énfasis:** Usar mayúsculas para énfasis
4. **Velocidad:** Mantener ritmo constante
5. **Claridad:** Hablar claro, no muy rápido
6. **Emoción:** Variar tono según contexto
