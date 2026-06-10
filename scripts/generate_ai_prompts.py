#!/usr/bin/env python3
"""
WonderLearn AI Asset Generator
Genera prompts y estructura para crear assets con IA
"""

import json
import os
from pathlib import Path
from typing import Dict, List

# Configuración
PROJECT_ROOT = Path(__file__).parent.parent
ASSETS_DIR = PROJECT_ROOT / "wonderlearn_app" / "assets"

# Estilo visual consistente
BASE_STYLE = "kawaii, flat design, pastel colors, white background, children's book illustration, simple shapes, no text, vector style"

# Datos de contenido
STORIES = {
    "story_01": {
        "title": "El gato simpático",
        "pages": [
            "Cute orange cat sitting on windowsill",
            "Happy orange cat playing with yarn",
            "Orange cat eating from bowl",
            "Orange cat sleeping on bed",
            "Orange cat looking at birds",
            "Orange cat and mouse friends"
        ]
    },
    "story_02": {
        "title": "Mi perro",
        "pages": [
            "Brown puppy with floppy ears",
            "Happy puppy wagging tail",
            "Puppy playing with ball",
            "Puppy eating from bowl",
            "Puppy sleeping in bed"
        ]
    },
    "story_03": {
        "title": "La casa",
        "pages": [
            "Colorful toy house exterior",
            "Cozy living room",
            "Kitchen with table",
            "Bedroom with toys",
            "Garden with flowers"
        ]
    },
    "story_04": {
        "title": "El árbol grande",
        "pages": [
            "Tall green tree in meadow",
            "Birds in tree branches",
            "Squirrel climbing tree",
            "Children under tree",
            "Tree with autumn leaves",
            "Animals around tree"
        ]
    },
    "story_05": {
        "title": "El parque",
        "pages": [
            "Colorful playground entrance",
            "Children on swings",
            "Sandbox with toys",
            "Slide with child",
            "Fountain in park",
            "Sunset over park"
        ]
    },
    "story_06": {
        "title": "Los animales",
        "pages": [
            "Barnyard with fence",
            "Cow eating grass",
            "Chicken with chicks",
            "Pig in mud",
            "Horse running",
            "All animals together"
        ]
    },
    "story_07": {
        "title": "Mi familia",
        "pages": [
            "Happy family at home",
            "Family eating breakfast",
            "Parents reading to child",
            "Family in park",
            "Family playing game",
            "Bedtime story"
        ]
    },
    "story_08": {
        "title": "La escuela",
        "pages": [
            "School building exterior",
            "Classroom with desks",
            "Teacher at whiteboard",
            "Children raising hands",
            "Playground at recess",
            "School bus",
            "Saying goodbye"
        ]
    },
    "story_09": {
        "title": "El viaje",
        "pages": [
            "Car packed for trip",
            "Road with mountains",
            "Rest stop snacks",
            "Scenic overlook",
            "Arriving at destination",
            "Happy at hotel",
            "Photo memories"
        ]
    },
    "story_10": {
        "title": "La aventura",
        "pages": [
            "Children at forest edge",
            "Mysterious path",
            "Hidden clearing",
            "Magical creatures",
            "Exploring cave",
            "Treasure chest",
            "Celebration",
            "Walking home"
        ]
    }
}

LETTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
LETTER_WORDS = {
    "A": ["Árbol", "Avión", "Ardilla"],
    "B": ["Bola", "Casa", "Barco"],
    "C": ["Cama", "Conejo", "Corazón"],
    "D": ["Dado", "Dedo", "Duende"],
    "E": ["Estrella", "Espada", "Escalera"],
    "F": ["Foca", "Fresa", "Flor"],
    "G": ["Gato", "Globo", "Guitarra"],
    "H": ["Helado", "Hat", "Huevo"],
    "I": ["Iglesia", "Isla", "Jirafa"],
    "J": ["Jirafa", "Jugo", "Juguete"],
    "K": ["Koala", "Kayak", "Kiwi"],
    "L": ["León", "Luna", "Libro"],
    "M": ["Mono", "Mesa", "Mariposa"],
    "N": ["Nube", "Niño", "Naranja"],
    "Ñ": ["Ñoño", "Ñu", "España"],
    "O": ["Oso", "Ojo", "Oveja"],
    "P": ["Pato", "Piedra", "Pájaro"],
    "Q": ["Queso", "Queso", "Quetzal"],
    "R": ["Rana", "Rosa", "Reloj"],
    "S": ["Sol", "Silla", "Serpiente"],
    "T": ["Tigre", "Taza", "Tortuga"],
    "U": ["Uva", "Umbrella", "Uso"],
    "V": ["Vaca", "Vaso", "Vela"],
    "W": ["Water", "Whale", "Window"],
    "X": ["Xylophone", "X-ray", "Box"],
    "Y": ["Yoga", "Yoyo", "Yate"],
    "Z": ["Zebra", "Zapato", "Zoo"]
}

EMOTIONS = {
    "happy": ["Smiling child", "Jumping with joy", "Celebrating"],
    "sad": ["Crying child", "Looking down", "Hugging teddy bear"],
    "angry": ["Crossed arms", "Stomping foot", "Red face"],
    "scared": ["Hiding", "Wide eyes", "Holding blanket"],
    "calm": ["Breathing deeply", "Sitting peacefully", "Soft smile"]
}

SHAPES = {
    "circle": ["Red circle with face", "Circle as sun", "Circle as ball"],
    "square": ["Blue square with face", "Square as window", "Square as box"],
    "triangle": ["Green triangle with face", "Triangle as mountain", "Triangle as tree"],
    "rectangle": ["Yellow rectangle with face", "Rectangle as door", "Rectangle as book"]
}

SIGHT_WORDS = [
    "the", "be", "to", "of", "and", "a", "in", "that", "have", "I",
    "it", "for", "not", "on", "with", "he", "as", "you", "do", "at",
    "this", "but", "his", "by", "from", "they", "we", "say", "her", "she",
    "or", "an", "will", "my", "one", "all", "would", "there", "their", "what",
    "so", "up", "out", "if", "about", "who", "get", "which", "go", "me"
]

def generate_story_prompts() -> Dict:
    """Generar prompts para cuentos"""
    prompts = {}
    
    for story_id, story in STORIES.items():
        prompts[story_id] = {
            "title": story["title"],
            "pages": []
        }
        
        for i, page_desc in enumerate(story["pages"], 1):
            prompts[story_id]["pages"].append({
                "page": i,
                "prompt": f"{page_desc}, {BASE_STYLE}"
            })
    
    return prompts

def generate_phonics_prompts() -> List[Dict]:
    """Generar prompts para fonética"""
    prompts = []
    
    for letter in LETTERS:
        if letter in LETTER_WORDS:
            words = LETTER_WORDS[letter]
            prompts.append({
                "letter": letter,
                "main_prompt": f"Large letter {letter} with {words[0].lower()}, {BASE_STYLE}",
                "words": [
                    {"word": word, "prompt": f"{word.lower()} illustration, {BASE_STYLE}"}
                    for word in words
                ]
            })
    
    return prompts

def generate_emotion_prompts() -> List[Dict]:
    """Generar prompts para emociones"""
    prompts = []
    
    for emotion, descriptions in EMOTIONS.items():
        prompts.append({
            "emotion": emotion,
            "expressions": [
                {"description": desc, "prompt": f"{desc}, {BASE_STYLE}"}
                for desc in descriptions
            ]
        })
    
    return prompts

def generate_shape_prompts() -> List[Dict]:
    """Generar prompts para formas"""
    prompts = []
    
    for shape, descriptions in SHAPES.items():
        prompts.append({
            "shape": shape,
            "variations": [
                {"description": desc, "prompt": f"{desc}, {BASE_STYLE}"}
                for desc in descriptions
            ]
        })
    
    return prompts

def generate_sight_word_prompts() -> List[Dict]:
    """Generar prompts para sight words"""
    return [
        {
            "word": word,
            "prompt": f"The word '{word}' in colorful letters, kawaii style, educational, pastel background, children's learning"
        }
        for word in SIGHT_WORDS
    ]

def generate_audio_scripts() -> Dict:
    """Generar scripts de audio para TTS"""
    scripts = {
        "phonics": {},
        "stories": {},
        "sight_words": {},
        "instructions": {
            "phonics": "Toca la letra para escuchar su sonido.",
            "sight_words": "¿Cuál es la palabra correcta?",
            "story": "Lee el cuento conmigo.",
            "counting": "Toca para contar los objetos.",
            "addition": "¿Cuánto es la suma?",
            "shapes": "¿Qué forma es?",
            "patterns": "¿Qué sigue en el patrón?",
            "emotion": "¿Cómo se siente el personaje?",
            "empathy": "¿Qué harías en esta situación?",
            "breathing": "Respira profundo conmigo.",
            "correct": "¡Correcto! Excelente trabajo.",
            "incorrect": "¡Casi! Intenta de nuevo.",
            "star_earned": "¡Estrella ganada!",
            "badge_unlocked": "¡Insignia desbloqueada!"
        }
    }
    
    # Fonética
    for letter, words in LETTER_WORDS.items():
        word_list = ". ".join(words)
        scripts["phonics"][letter] = f"La letra {letter}. {word_list}."
    
    # Cuentos
    for story_id, story in STORIES.items():
        scripts["stories"][story_id] = [
            f"Página {i}: {page}"
            for i, page in enumerate(story["pages"], 1)
        ]
    
    # Sight words
    for word in SIGHT_WORDS:
        scripts["sight_words"][word] = word
    
    return scripts

def generate_lottie_prompts() -> List[Dict]:
    """Generar prompts para animaciones Lottie"""
    return [
        {
            "name": "mascot_dragon_idle",
            "prompt": "Simple cute dragon character breathing animation, looping, flat design, pastel green, children's app style, smooth motion"
        },
        {
            "name": "mascot_dragon_happy",
            "prompt": "Cute dragon celebrating with jumps, happy animation, flat design, pastel green, children's app, smooth motion"
        },
        {
            "name": "mascot_dragon_sad",
            "prompt": "Cute dragon looking sad with tears, gentle sadness animation, flat design, pastel green, children's app"
        },
        {
            "name": "mascot_cat_idle",
            "prompt": "Simple cute cat character breathing animation, looping, flat design, pastel yellow, children's app style, smooth motion"
        },
        {
            "name": "mascot_cat_happy",
            "prompt": "Cute cat purring and jumping happily, celebration animation, flat design, pastel yellow, children's app"
        },
        {
            "name": "mascot_cat_sad",
            "prompt": "Cute cat looking sad with droopy ears, gentle sadness animation, flat design, pastel yellow, children's app"
        },
        {
            "name": "mascot_robot_idle",
            "prompt": "Simple cute robot character with blinking lights animation, looping, flat design, gray and blue, children's app style"
        },
        {
            "name": "mascot_robot_happy",
            "prompt": "Cute robot dancing with flashing lights, happy celebration animation, flat design, gray and blue, children's app"
        },
        {
            "name": "mascot_robot_sad",
            "prompt": "Cute robot looking sad with dimmed lights, gentle sadness animation, flat design, gray and blue, children's app"
        },
        {
            "name": "celebration",
            "prompt": "Colorful confetti explosion animation, celebration, party, flat design, pastel colors, smooth motion, looping"
        },
        {
            "name": "breathing_circle",
            "prompt": "Circle expanding and contracting slowly, breathing exercise, calm, pastel colors, smooth motion, zen, looping"
        },
        {
            "name": "star_earned",
            "prompt": "Golden star appearing with sparkle effect, achievement animation, flat design, gold color, smooth motion"
        },
        {
            "name": "badge_unlocked",
            "prompt": "Badge icon appearing with glow effect, unlock animation, flat design, pastel colors, smooth motion"
        },
        {
            "name": "loading_dots",
            "prompt": "Three dots pulsing animation, loading indicator, flat design, pastel colors, smooth motion, looping"
        },
        {
            "name": "correct_check",
            "prompt": "Green checkmark appearing with bounce effect, correct answer animation, flat design, green color, smooth motion"
        }
    ]

def generate_all_prompts():
    """Generar todos los prompts"""
    all_prompts = {
        "stories": generate_story_prompts(),
        "phonics": generate_phonics_prompts(),
        "emotions": generate_emotion_prompts(),
        "shapes": generate_shape_prompts(),
        "sight_words": generate_sight_word_prompts(),
        "lottie": generate_lottie_prompts(),
        "audio_scripts": generate_audio_scripts()
    }
    
    return all_prompts

def save_prompts(prompts: Dict):
    """Guardar prompts en archivos"""
    output_dir = Path("wonderlearn_prompts")
    output_dir.mkdir(exist_ok=True)
    
    # Guardar cada sección
    for section, data in prompts.items():
        file_path = output_dir / f"{section}.json"
        with open(file_path, "w", encoding="utf-8") as f:
            json.dump(data, f, indent=2, ensure_ascii=False)
        print(f"✅ Saved: {file_path}")
    
    # Guardar archivo combinado
    combined_path = output_dir / "all_prompts.json"
    with open(combined_path, "w", encoding="utf-8") as f:
        json.dump(prompts, f, indent=2, ensure_ascii=False)
    print(f"✅ Saved combined: {combined_path}")

def generate_readme():
    """Generar README con instrucciones"""
    readme = """# 🎨 WonderLearn Prompts para Generación de Assets

## Instrucciones

### 1. Imágenes (DALL-E 3 / Midjourney)

1. Abre `all_prompts.json`
2. Usa los prompts de cada sección
3. Genera imágenes con tu herramienta preferida
4. Guarda en la carpeta correspondiente de `wonderlearn_app/assets/`

### 2. Audio (ElevenLabs / Bark)

1. Usa los scripts de `audio_scripts.json`
2. Genera clips de audio
3. Guarda en `wonderlearn_app/assets/audio/`

### 3. Animaciones (Lottiefiles AI)

1. Usa los prompts de `lottie.json`
2. Genera animaciones en Lottiefiles.com/ai
3. Guarda como JSON en `wonderlearn_app/assets/rive/`

## Estructura de Carpetas

```
wonderlearn_app/assets/
├── images/
│   ├── letters/          # 26 letras + 78 palabras
│   ├── stories/          # 10 cuentos x 5-8 páginas
│   ├── emotions/         # 5 emociones x 3 expresiones
│   ├── shapes/           # 4 formas x 3 variaciones
│   ├── sight_words/      # 50 palabras
│   └── ui/               # Iconos e interfaz
├── audio/
│   ├── sfx/              # Efectos de sonido
│   ├── music/            # Música de fondo
│   └── narration/        # Narración de cuentos
├── rive/                 # Animaciones Lottie
└── fonts/                # Fuentes
```

## Costo Estimado

| Herramienta | Uso | Costo |
|---|---|---|
| DALL-E 3 | ~150 imágenes | $20-30 |
| ElevenLabs | ~200 clips audio | $5-22 |
| Lottiefiles AI | ~15 animaciones | Gratis |
| **Total** | | **$25-52** |

## Generado por

WonderLearn AI Asset Generator
"""
    
    with open("wonderlearn_prompts/README.md", "w", encoding="utf-8") as f:
        f.write(readme)
    print("✅ Saved: wonderlearn_prompts/README.md")

if __name__ == "__main__":
    print("🎨 WonderLearn AI Asset Generator")
    print("=" * 50)
    
    # Generar prompts
    prompts = generate_all_prompts()
    
    # Guardar
    save_prompts(prompts)
    
    # Generar README
    generate_readme()
    
    print("=" * 50)
    print("✅ Done!")
    print("\nNext steps:")
    print("1. Check wonderlearn_prompts/ folder")
    print("2. Use prompts with DALL-E 3 / Midjourney")
    print("3. Generate audio with ElevenLabs / Bark")
    print("4. Create animations with Lottiefiles AI")
