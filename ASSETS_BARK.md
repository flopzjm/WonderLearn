# 🔊 Guía de Assets de Audio con Bark (TTS Gratuito)

## Información General

| Detalle | Valor |
|---------|-------|
| **Herramienta** | Bark by Suno (huggingface.co/suno-ai/bark) |
| **Costo estimado** | Gratis (100% local o Colab) |
| **Formato salida** | WAV o MP3 |
| **Uso** | TTS gratuito, efectos de sonido, alternativa a ElevenLabs |

---

## 🎯 ¿Cuándo usar Bark vs ElevenLabs?

| Característica | Bark | ElevenLabs |
|----------------|------|------------|
| **Costo** | Gratis | $5-22/mes |
| **Calidad** | Media-Alta | Alta |
| **Velocidad** | Lenta (GPU) | Rápida |
| **Español** | Limitado | Excelente |
| **Emociones** | Básico | Avanzado |
| **Instalación** | Local/Colab | Web |
| **Ideal para** | MVP, pruebas | Producción |

**Recomendación:** Usar Bark para MVP/pruebas, migrar a ElevenLabs para producción.

---

## 🛠️ Instalación

### Opción 1: Google Colab (Recomendado para empezar)

1. Ir a colab.research.google.com
2. Crear nuevo notebook
3. Pegar este código:

```python
# Instalar Bark
!pip install git+https://github.com/suno-ai/bark.git

# Descargar modelos
from bark import SAMPLE_RATE, generate_audio, preload_models
preload_models()

# Importar librerías
import numpy as np
from scipy.io.wavfile import write
import os
```

### Opción 2: Instalación Local (requiere GPU)

```bash
# Crear entorno virtual
python -m venv bark_env
source bark_env/bin/activate  # Linux/Mac
bark_env\Scripts\activate     # Windows

# Instalar Bark
pip install git+https://github.com/suno-ai/bark.git

# Instalar dependencias
pip install scipy numpy torch
```

### Opción 3: Docker

```bash
docker pull ghcr.io/suno-ai/bark:latest
docker run -it --gpus all -p 5000:5000 ghcr.io/suno-ai/bark:latest
```

---

## 🎨 Vozes Disponibles

### Vozes en Español
```python
# Español
"v2/es_speaker_0"  # Masculino joven
"v2/es_speaker_1"  # Femenino joven
"v2/es_speaker_2"  # Masculino adulto
"v2/es_speaker_3"  # Femenino adulta
"v2/es_speaker_4"  # Masculino mayor
"v2/es_speaker_5"  # Femenino mayor
"v2/es_speaker_6"  # Masculino grave
"v2/es_speaker_7"  # Femenino agudo
```

### Vozes en Inglés (para sight words)
```python
# Inglés
"v2/en_speaker_0"  # Masculino americano
"v2/en_speaker_1"  # Femenino americano
"v2/en_speaker_2"  # Masculino británico
"v2/en_speaker_3"  # Femenino británico
```

---

## 🔤 FONÉTICA (26 letras)

**Carpeta:** `wonderlearn_app/assets/audio/phonics_bark/`

### Script de generación

```python
from bark import SAMPLE_RATE, generate_audio, preload_models
from scipy.io.wavfile import write
import os

preload_models()

# Configuración
OUTPUT_DIR = "wonderlearn_app/assets/audio/phonics_bark"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Voz
VOICE = "v2/es_speaker_1"  # Femenino joven

# Datos de fonética
phonics_data = {
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

# Generar audio
for letter, data in phonics_data.items():
    # Audio de letra
    audio = generate_audio(data["letter"], history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/letter_{letter}.wav", SAMPLE_RATE, audio)
    
    # Audio de palabras
    audio = generate_audio(data["words"], history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/letter_{letter}_words.wav", SAMPLE_RATE, audio)
    
    # Audio de sonido
    audio = generate_audio(data["sound"], history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/letter_{letter}_sound.wav", SAMPLE_RATE, audio)
    
    # Audio completo
    audio = generate_audio(data["complete"], history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/letter_{letter}_complete.wav", SAMPLE_RATE, audio)
    
    print(f"✅ Generated: {letter}")

print("✅ All phonics audio generated!")
```

---

## 👁️ SIGHT WORDS (50)

**Carpeta:** `wonderlearn_app/assets/audio/sight_words_bark/`

### Script de generación

```python
from bark import SAMPLE_RATE, generate_audio, preload_models
from scipy.io.wavfile import write
import os

preload_models()

OUTPUT_DIR = "wonderlearn_app/assets/audio/sight_words_bark"
os.makedirs(OUTPUT_DIR, exist_ok=True)

# Voz en inglés
VOICE = "v2/en_speaker_1"  # Femenino americano

# Sight words
sight_words = [
    "the", "be", "to", "of", "and", "a", "in", "that", "have", "I",
    "it", "for", "not", "on", "with", "he", "as", "you", "do", "at",
    "this", "but", "his", "by", "from", "they", "we", "say", "her", "she",
    "or", "an", "will", "my", "one", "all", "would", "there", "their", "what",
    "so", "up", "out", "if", "about", "who", "get", "which", "go", "me"
]

# Generar audio
for word in sight_words:
    audio = generate_audio(word, history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/sight_{word}.wav", SAMPLE_RATE, audio)
    print(f"✅ Generated: {word}")

print("✅ All sight words generated!")
```

---

## 📚 CUENTOS (10)

**Carpeta:** `wonderlearn_app/assets/audio/stories_bark/`

### Script de generación

```python
from bark import SAMPLE_RATE, generate_audio, preload_models
from scipy.io.wavfile import write
import os

preload_models()

OUTPUT_DIR = "wonderlearn_app/assets/audio/stories_bark"
os.makedirs(OUTPUT_DIR, exist_ok=True)

VOICE = "v2/es_speaker_1"

# Textos de cuentos
stories = {
    "story_01": {
        "title": "El gato simpático",
        "pages": [
            "Había vez un gatito naranja que vivía en una casa bonita. Le gustaba mirar por la ventana.",
            "Al día siguiente, el gatito encontró una bola de lana roja. ¡Empezó a jugar con ella!",
            "Después, el gatito tuvo mucha hambre. Comió de su plato colorido.",
            "Ya era tarde. El gatito estaba cansado y se durmió en su cama.",
            "Al despertar, el gatito vio pájaros colorados por la ventana.",
            "¡El gatito hizo nuevos amigos! Un ratoncito vino a jugar con él."
        ]
    },
    "story_02": {
        "title": "Mi perro",
        "pages": [
            "Tengo un perrito marrón con orejas largas. Se llama Max.",
            "A Max le encanta mover la cola cuando estoy feliz.",
            "Max juega con su pelota todos los días.",
            "Cuando tiene hambre, come de su plato azul.",
            "Por la noche, Max duerme en su cama con su mantita."
        ]
    },
    "story_03": {
        "title": "La casa",
        "pages": [
            "Esta es mi casa. Es colorida y tiene un jardín bonito.",
            "En el salón hay un sofá y muchos juguetes.",
            "La cocina es donde mamá prepara la comida.",
            "Mi cuarto tiene mi cama y mis peluches favoritos.",
            "El jardín tiene flores de muchos colores y mariposas."
        ]
    },
    "story_04": {
        "title": "El árbol grande",
        "pages": [
            "En el campo hay un árbol muy grande y bonito.",
            "En las ramas viven pajaritos de muchos colores.",
            "Una ardillita sube y baja por el tronco.",
            "Los niños juegan debajo del árbol cuando hace calor.",
            "En otoño, las hojas se ponen amarillas y rojas.",
            "Todos los animalitos se reunieron alrededor del árbol."
        ]
    },
    "story_05": {
        "title": "El parque",
        "pages": [
            "El parque es un lugar divertido para jugar.",
            "En el parque hay columpios que se mecen suavemente.",
            "La casita de arena tiene cubetas y palitas.",
            "El tobogán es rápido y emocionante.",
            "La fuente del parque refresca el aire.",
            "Al atardecer, el parque se ve mágico."
        ]
    },
    "story_06": {
        "title": "Los animales",
        "pages": [
            "En la granja viven muchos animales.",
            "La vaca come hierba y da leche.",
            "La gallina pone huevos y cuida sus pollitos.",
            "El cerdo juega en el barro.",
            "El caballo corre por el campo.",
            "Todos los animales son amigos."
        ]
    },
    "story_07": {
        "title": "Mi familia",
        "pages": [
            "Mi familia es divertida y cariñosa.",
            "Desayunamos juntos en la mesa.",
            "Mamá y papá me leen cuentos.",
            "Vamos al parque los fines de semana.",
            "Jugamos juegos en familia.",
            "Por la noche, me acuestan con un beso."
        ]
    },
    "story_08": {
        "title": "La escuela",
        "pages": [
            "La escuela es un lugar para aprender.",
            "El salón tiene pupitres y pizarrón.",
            "La maestra explica las lecciones.",
            "Los niños levantan la mano para hablar.",
            "En el recreo jugamos en el patio.",
            "El camión escolar nos lleva a casa.",
            "Nos despedimos hasta mañana."
        ]
    },
    "story_09": {
        "title": "El viaje",
        "pages": [
            "El carro está listo para el viaje.",
            "La carretera tiene montañas bonitas.",
            "Paramos a comer snacks en el camino.",
            "Vistas increíbles desde la altura.",
            "Llegamos al destino emocionados.",
            "El hotel es cómodo y acogedor.",
            "Tomamos fotos para recordar."
        ]
    },
    "story_10": {
        "title": "La aventura",
        "pages": [
            "Los niños llegaron al borde del bosque.",
            "Un camino misterioso los esperaba.",
            "Encontraron un claro mágico.",
            "Había criaturas mágicas amigables.",
            "Exploraron una cueva colorida.",
            "¡Encontraron un tesoro brillante!",
            "Celebraron su descubrimiento.",
            "Caminaron de regreso a casa felices."
        ]
    }
}

# Generar audio
for story_id, story in stories.items():
    story_dir = f"{OUTPUT_DIR}/{story_id}"
    os.makedirs(story_dir, exist_ok=True)
    
    # Título
    audio = generate_audio(story["title"], history_prompt=VOICE)
    write(f"{story_dir}/title.wav", SAMPLE_RATE, audio)
    
    # Páginas
    for i, page in enumerate(story["pages"], 1):
        audio = generate_audio(page, history_prompt=VOICE)
        write(f"{story_dir}/page_{i}.wav", SAMPLE_RATE, audio)
    
    print(f"✅ Generated: {story_id}")

print("✅ All stories generated!")
```

---

## 🎮 INSTRUCCIONES (20)

**Carpeta:** `wonderlearn_app/assets/audio/instructions_bark/`

### Script de generación

```python
from bark import SAMPLE_RATE, generate_audio, preload_models
from scipy.io.wavfile import write
import os

preload_models()

OUTPUT_DIR = "wonderlearn_app/assets/audio/instructions_bark"
os.makedirs(OUTPUT_DIR, exist_ok=True)

VOICE = "v2/es_speaker_1"

# Instrucciones
instructions = {
    "welcome": "¡Bienvenido a WonderLearn! Vamos a aprender jugando.",
    "phonics_intro": "Toca la letra para escuchar su sonido.",
    "sight_words_intro": "¿Cuál es la palabra que ves? Toca la correcta.",
    "stories_intro": "Lee el cuento conmigo. Toca la pantalla para pasar la página.",
    "counting_intro": "Toca los objetos para contar. ¿Cuántos ves?",
    "addition_intro": "Suma los números. ¿Cuánto es el total?",
    "shapes_intro": "¿Qué forma es? Toca la respuesta correcta.",
    "patterns_intro": "Observa el patrón. ¿Qué sigue?",
    "emotions_intro": "¿Cómo se siente el personaje? Elige la emoción.",
    "empathy_intro": "¿Qué harías en esta situación? Elige la mejor opción.",
    "breathing_intro": "Respira profundo conmigo. Sigue el círculo.",
    "correct": "¡Muy bien! Esa es la respuesta correcta.",
    "incorrect": "¡Casi! Intenta otra vez.",
    "star": "¡Estrella ganada! Excelente trabajo.",
    "badge": "¡Insignia desbloqueada! Eres increíble.",
    "level_up": "¡Subiste de nivel! Sigue así.",
    "try_again": "Inténtalo otra vez. Tú puedes.",
    "good_job": "¡Buen trabajo! Sigue así.",
    "awesome": "¡Increíble! Eres genial.",
    "keep_going": "¡Sigue adelante! Estás做得 muy bien."
}

# Generar audio
for name, text in instructions.items():
    audio = generate_audio(text, history_prompt=VOICE)
    write(f"{OUTPUT_DIR}/instr_{name}.wav", SAMPLE_RATE, audio)
    print(f"✅ Generated: {name}")

print("✅ All instructions generated!")
```

---

## 📊 Resumen de Audio Bark

| Categoría | Cantidad | Duración aprox |
|-----------|----------|----------------|
| Fonética (letras) | 104 clips | 5 min |
| Sight words | 50 clips | 1 min |
| Cuentos | 55-60 clips | 30 min |
| Instrucciones | 20 clips | 2 min |
| **TOTAL** | **~235 clips** | **~38 min** |

---

## 💰 Costo Estimado

| Método | Costo | Requisitos |
|--------|-------|------------|
| Google Colab Free | $0 | GPU limitada |
| Google Colab Pro | $10/mes | GPU mejor |
| Local (GPU propia) | $0 | NVIDIA GPU |
| AWS/GCP GPU | $0.50-2/hora | Cuenta cloud |

**Recomendación:** Google Colab Free es suficiente para MVP.

---

## 📝 Instrucciones Paso a Paso

### Opción 1: Google Colab (Recomendado)

1. Ir a colab.research.google.com
2. Crear nuevo notebook
3. Cambiar runtime a GPU:
   - Runtime > Change runtime type
   - T4 GPU
4. Pegar código de instalación
5. Pegar código de generación
6. Ejecutar celda por celda
7. Descargar archivos generados
8. Subir a proyecto

### Opción 2: Local

1. Instalar CUDA (si tienes NVIDIA GPU)
2. Seguir instrucciones de instalación
3. Ejecutar scripts
4. Archivos se guardan automáticamente

---

## ⚠️ Limitaciones de Bark

1. **Velocidad:** Lento sin GPU (5-10x real-time)
2. **Español:** Calidad inferior a ElevenLabs
3. **Emociones:** Limitadas comparado con ElevenLabs
4. **Consistencia:** Puede variar entre generaciones
5. **Tamaño:** Modelos grandes (~5GB)

---

## 🎯 Tips para Mejor Calidad

1. **Pausas:** Usar "..." para pausas naturales
2. **Puntuación:** Incluir puntos y comas
3. **Énfasis:** Usar mayúsculas para énfasis
4. **Velocidad:** Generar片段 cortos
5. **Post-proceso:** Editar en Audacity

---

## 🔄 Conversión de WAV a MP3

```python
# Instalar pydub
!pip install pydub

# Convertir WAV a MP3
from pydub import AudioSegment
import os

INPUT_DIR = "wonderlearn_app/assets/audio/phonics_bark"
OUTPUT_DIR = "wonderlearn_app/assets/audio/phonics"

os.makedirs(OUTPUT_DIR, exist_ok=True)

for filename in os.listdir(INPUT_DIR):
    if filename.endswith(".wav"):
        wav = AudioSegment.from_wav(f"{INPUT_DIR}/{filename}")
        mp3_filename = filename.replace(".wav", ".mp3")
        wav.export(f"{OUTPUT_DIR}/{mp3_filename}", format="mp3", bitrate="128k")
        print(f"✅ Converted: {mp3_filename}")
```

---

## 🔗 Recursos Adicionales

- **Bark GitHub:** github.com/suno-ai/bark
- **Hugging Face:** huggingface.co/suno-ai/bark
- **Audacity:** audacityteam.org (editor de audio gratis)
- **Google Colab:** colab.research.google.com
