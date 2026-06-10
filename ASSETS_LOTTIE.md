# 🎬 Guía de Assets de Animación con Lottiefiles AI

## Información General

| Detalle | Valor |
|---------|-------|
| **Herramienta** | Lottiefiles AI (lottiefiles.com/ai) |
| **Costo estimado** | Gratis (plan básico) |
| **Formato salida** | JSON (Lottie) |
| **Uso** | Animaciones de mascota, UI, celebraciones |

---

## 🎯 Configuración Recomendada

### Parámetros de Generación
```
Style: Flat design
Colors: Pastel palette
Complexity: Simple
Frame Rate: 30fps
Loop: Yes/No según uso
```

### Paleta de Colores
```css
--primary: #FF6B6B (rojo pastel)
--secondary: #4ECDC4 (turquesa)
--accent: #FFE66D (amarillo)
--green: #95E1D3 (verde pastel)
--purple: #DDA0DD (lila)
--blue: #87CEEB (azul pastel)
--pink: #FFB6C1 (rosa)
--orange: #FFDAB9 (naranja pastel)
```

---

## 🐉 MASCOTA DRAGÓN (9 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/dragon/`

### Animaciones base

| Archivo | Animación | Loop | Descripción |
|---------|-----------|------|-------------|
| `dragon_idle.json` | Idle/Breathing | Sí | Dragón respirando suavemente, alas mueven |
| `dragon_happy.json` | Happy | No | Dragón saltando de alegría, alas arriba |
| `dragon_sad.json` | Sad | No | Dragón triste, alas caídas, lágrimas |
| `dragon_eating.json` | Eating | No | Dragón comiendo, movimiento de mandíbula |
| `dragon_walking.json` | Walking | Sí | Dragón caminando, patas en movimiento |
| `dragon_flying.json` | Flying | Sí | Dragón volando, alas extendidas |
| `dragon_sleeping.json` | Sleeping | Sí | Dragón durmiendo, pecho sube y baja |
| `dragon_surprised.json` | Surprised | No | Dragón sorprendido, ojos abiertos |
| `dragon_thinking.json` | Thinking | Sí | Dragón pensando, mano en mentón |

### Prompts para Lottiefiles AI

```
dragon_idle.json:
"Cute green kawaii dragon breathing animation, simple flat design, 
pastel green color, smooth looping motion, children's app style, 
30fps, clean lines"

dragon_happy.json:
"Cute green kawaii dragon jumping happily, simple flat design, 
pastel green color, celebration animation, children's app style, 
30fps, clean lines, 2 seconds"

dragon_sad.json:
"Cute green kawaii dragon looking sad with tears, simple flat design, 
pastel green color, gentle sadness animation, children's app style, 
30fps, clean lines"

dragon_eating.json:
"Cute green kawaii dragon eating food, simple flat design, 
pastel green color, chewing animation, children's app style, 
30fps, clean lines"

dragon_walking.json:
"Cute green kawaii dragon walking, simple flat design, 
pastel green color, walking cycle animation, children's app style, 
30fps, clean lines, looping"

dragon_flying.json:
"Cute green kawaii dragon flying with wings, simple flat design, 
pastel green color, flying animation, children's app style, 
30fps, clean lines, looping"

dragon_sleeping.json:
"Cute green kawaii dragon sleeping, simple flat design, 
pastel green color, breathing animation while sleeping, 
children's app style, 30fps, clean lines, looping"

dragon_surprised.json:
"Cute green kawaii dragon surprised with wide eyes, simple flat design, 
pastel green color, surprise animation, children's app style, 
30fps, clean lines"

dragon_thinking.json:
"Cute green kawaii dragon thinking with hand on chin, simple flat design, 
pastel green color, thinking animation, children's app style, 
30fps, clean lines, looping"
```

---

## 🐱 MASCOTA GATO (9 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/cat/`

### Animaciones base

| Archivo | Animación | Loop | Descripción |
|---------|-----------|------|-------------|
| `cat_idle.json` | Idle/Breathing | Sí | Gato respirando, colita se mueve |
| `cat_happy.json` | Happy | No | Gato feliz, saltando, ronroneando |
| `cat_sad.json` | Sad | No | Gato triste, orejas caídas |
| `cat_eating.json` | Eating | No | Gato comiendo pescado |
| `cat_walking.json` | Walking | Sí | Gato caminando elegante |
| `cat_sleeping.json` | Sleeping | Sí | Gato durmiendo enrollado |
| `cat_purring.json` | Purring | Sí | Gato ronroneando, vibración |
| `cat_playing.json` | Playing | No | Gato jugando con ovillo |
| `cat_grooming.json` | Grooming | No | Gato lavándose |

### Prompts para Lottiefiles AI

```
cat_idle.json:
"Cute yellow kawaii cat breathing animation, simple flat design, 
pastel yellow color, smooth looping motion, children's app style, 
30fps, clean lines"

cat_happy.json:
"Cute yellow kawaii cat jumping happily, simple flat design, 
pastel yellow color, celebration animation, children's app style, 
30fps, clean lines, 2 seconds"

cat_sad.json:
"Cute yellow kawaii cat looking sad with droopy ears, simple flat design, 
pastel yellow color, gentle sadness animation, children's app style, 
30fps, clean lines"

cat_eating.json:
"Cute yellow kawaii cat eating fish, simple flat design, 
pastel yellow color, eating animation, children's app style, 
30fps, clean lines"

cat_walking.json:
"Cute yellow kawaii cat walking elegantly, simple flat design, 
pastel yellow color, walking cycle animation, children's app style, 
30fps, clean lines, looping"

cat_sleeping.json:
"Cute yellow kawaii cat sleeping curled up, simple flat design, 
pastel yellow color, breathing animation while sleeping, 
children's app style, 30fps, clean lines, looping"

cat_purring.json:
"Cute yellow kawaii cat purring with vibration, simple flat design, 
pastel yellow color, purring animation, children's app style, 
30fps, clean lines, looping"

cat_playing.json:
"Cute yellow kawaii cat playing with yarn ball, simple flat design, 
pastel yellow color, playing animation, children's app style, 
30fps, clean lines"

cat_grooming.json:
"Cute yellow kawaii cat grooming itself, simple flat design, 
pastel yellow color, grooming animation, children's app style, 
30fps, clean lines"
```

---

## 🤖 MASCOTA ROBOT (9 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/robot/`

### Animaciones base

| Archivo | Animación | Loop | Descripción |
|---------|-----------|------|-------------|
| `robot_idle.json` | Idle/Breathing | Sí | Robot parpadeando, luces pulsando |
| `robot_happy.json` | Happy | No | Robot bailando, luces brillando |
| `robot_sad.json` | Sad | No | Robot triste, luces apagándose |
| `robot_working.json` | Working | No | Robot trabajando, brazos moviendo |
| `robot_thinking.json` | Thinking | Sí | Robot pensando, luces parpadeando |
| `robot_celebrating.json` | Celebrating | No | Robot celebrando, fireworks |
| `robot_singing.json` | Singing | Sí | Robot cantando, notas musicales |
| `robot_dancing.json` | Dancing | Sí | Robot bailando, movimiento rítmico |
| `robot_waving.json` | Waving | No | Robot saludando con mano |

### Prompts para Lottiefiles AI

```
robot_idle.json:
"Cute gray and blue kawaii robot blinking animation, simple flat design, 
gray robot with blue accents, smooth looping motion, children's app style, 
30fps, clean lines"

robot_happy.json:
"Cute gray and blue kawaii robot dancing happily, simple flat design, 
gray robot with blue accents, celebration animation, children's app style, 
30fps, clean lines, 2 seconds"

robot_sad.json:
"Cute gray and blue kawaii robot looking sad with dimmed lights, simple flat design, 
gray robot with blue accents, gentle sadness animation, children's app style, 
30fps, clean lines"

robot_working.json:
"Cute gray and blue kawaii robot working with arms, simple flat design, 
gray robot with blue accents, working animation, children's app style, 
30fps, clean lines"

robot_thinking.json:
"Cute gray and blue kawaii robot thinking with blinking lights, simple flat design, 
gray robot with blue accents, thinking animation, children's app style, 
30fps, clean lines, looping"

robot_celebrating.json:
"Cute gray and blue kawaii robot celebrating with fireworks, simple flat design, 
gray robot with blue accents, celebration animation, children's app style, 
30fps, clean lines"

robot_singing.json:
"Cute gray and blue kawaii robot singing with music notes, simple flat design, 
gray robot with blue accents, singing animation, children's app style, 
30fps, clean lines, looping"

robot_dancing.json:
"Cute gray and blue kawaii robot dancing with rhythm, simple flat design, 
gray robot with blue accents, dancing animation, children's app style, 
30fps, clean lines, looping"

robot_waving.json:
"Cute gray and blue kawaii robot waving hand, simple flat design, 
gray robot with blue accents, waving animation, children's app style, 
30fps, clean lines"
```

---

## ⭐ EFECTOS DE UI (6 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/ui/`

| Archivo | Animación | Loop | Descripción |
|---------|-----------|------|-------------|
| `celebration.json` | Confetti | No | Confeti cayendo, colores pastel |
| `breathing_circle.json` | Breathing | Sí | Círculo expandiendo/contrayendo |
| `star_earned.json` | Star appear | No | Estrella apareciendo con brillo |
| `badge_unlocked.json` | Badge unlock | No | Insignia desbloqueándose |
| `correct_answer.json` | Checkmark | No | Palomita apareciendo con bounce |
| `loading_dots.json` | Loading | Sí | Tres puntos pulsando |

### Prompts para Lottiefiles AI

```
celebration.json:
"Colorful confetti falling animation, flat design, pastel colors, 
celebration effect, party, smooth motion, 30fps, 3 seconds"

breathing_circle.json:
"Circle expanding and contracting slowly, breathing exercise, 
calm colors, pastel blue and green, smooth motion, zen, 
looping, 30fps"

star_earned.json:
"Golden star appearing with sparkle effect, achievement animation, 
flat design, gold color, smooth motion, 30fps, 2 seconds"

badge_unlocked.json:
"Badge icon appearing with glow effect, unlock animation, 
flat design, pastel colors, smooth motion, 30fps, 2 seconds"

correct_answer.json:
"Green checkmark appearing with bounce effect, correct answer, 
flat design, green color, smooth motion, 30fps, 1 second"

loading_dots.json:
"Three dots pulsing animation, loading indicator, 
flat design, pastel colors, smooth motion, looping, 30fps"
```

---

## 🎭 EMOCIONES (10 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/emotions/`

| Archivo | Emoción | Loop | Descripción |
|---------|---------|------|-------------|
| `happy_face.json` | Feliz | Sí | Cara sonriendo, ojos brillando |
| `sad_face.json` | Triste | Sí | Cara triste, lágrimas |
| `angry_face.json` | Enojado | Sí | Cara enojada, cejas fruncidas |
| `scared_face.json` | Asustado | Sí | Cara asustada, ojos abiertos |
| `calm_face.json` | Calmado | Sí | Cara tranquila, sonrisa suave |
| `surprised_face.json` | Sorprendido | Sí | Cara sorprendida, boca abierta |
| `love_face.json` | Enamorado | Sí | Cara con corazones |
| `silly_face.json` | Travieso | Sí | Cara sacando lengua |
| `sleepy_face.json` | Soñoliento | Sí | Cara con ojos cerrados |
| `excited_face.json` | Emocionado | Sí | Cara emocionada, saltando |

### Prompts para Lottiefiles AI

```
happy_face.json:
"Cute kawaii happy face expression, simple flat design, 
pastel yellow, smiling eyes, smooth animation, children's app, 
looping, 30fps"

sad_face.json:
"Cute kawaii sad face expression with tears, simple flat design, 
pastel blue, crying animation, children's app, looping, 30fps"

angry_face.json:
"Cute kawaii angry face expression, simple flat design, 
pastel red, frowning animation, children's app, looping, 30fps"

scared_face.json:
"Cute kawaii scared face expression, simple flat design, 
pastel purple, wide eyes animation, children's app, looping, 30fps"

calm_face.json:
"Cute kawaii calm face expression, simple flat design, 
pastel green, peaceful smile animation, children's app, looping, 30fps"

surprised_face.json:
"Cute kawaii surprised face expression, simple flat design, 
pastel orange, open mouth animation, children's app, looping, 30fps"

love_face.json:
"Cute kawaii face with hearts, simple flat design, 
pastel pink, love animation, children's app, looping, 30fps"

silly_face.json:
"Cute kawaii silly face with tongue out, simple flat design, 
pastel colors, playful animation, children's app, looping, 30fps"

sleepy_face.json:
"Cute kawaii sleepy face with closed eyes, simple flat design, 
pastel purple, yawning animation, children's app, looping, 30fps"

excited_face.json:
"Cute kawaii excited face jumping, simple flat design, 
pastel colors, excited animation, children's app, looping, 30fps"
```

---

## 🎪 EFECTOS ESPECIALES (4 animaciones)

**Carpeta:** `wonderlearn_app/assets/rive/effects/`

| Archivo | Efecto | Loop | Descripción |
|---------|--------|------|-------------|
| `sparkle_trail.json` | Brillo | Sí | Estrellas brillantes cayendo |
| `rainbow_wave.json` | Arcoíris | Sí | Onda de colores arcoíris |
| `magic_dust.json` | Polvo mágico | Sí | Partículas mágicas flotando |
| `bubble_float.json` | Burbujas | Sí | Burbujas flotando arriba |

### Prompts para Lottiefiles AI

```
sparkle_trail.json:
"Sparkle stars falling animation, flat design, pastel colors, 
magical effect, twinkling stars, smooth motion, looping, 30fps"

rainbow_wave.json:
"Rainbow wave flowing animation, flat design, rainbow colors, 
smooth wave motion, magical effect, looping, 30fps"

magic_dust.json:
"Magic dust particles floating animation, flat design, 
pastel colors, sparkles, smooth motion, looping, 30fps"

bubble_float.json:
"Bubbles floating up animation, flat design, pastel colors, 
transparent bubbles, smooth motion, looping, 30fps"
```

---

## 📊 Resumen de Animaciones

| Categoría | Cantidad | Uso |
|-----------|----------|-----|
| Dragón | 9 | Mascota principal |
| Gato | 9 | Mascota alternativa |
| Robot | 9 | Mascota alternativa |
| UI Effects | 6 | Interfaz de usuario |
| Emociones | 10 | Expresiones faciales |
| Efectos especiales | 4 | Refuerzo visual |
| **TOTAL** | **47** | |

---

## 💰 Costo Estimado

| Plan | Animaciones | Costo |
|------|-------------|-------|
| Free | ~20 | $0 |
| Pro | Ilimitado | $15/mes |
| Business | Ilimitado + soporte | $49/mes |

**Recomendación:** Plan Free es suficiente para MVP (20 animaciones gratis).

---

## 📝 Instrucciones Paso a Paso

### Paso 1: Crear cuenta
1. Ir a lottiefiles.com
2. Click "Sign Up"
3. Plan Free (suficiente para empezar)

### Paso 2: Generar animaciones
1. Ir a "Lottiefiles AI" o "Create"
2. Seleccionar "Generate from prompt"
3. Pegar prompt de esta guía
4. Seleccionar estilo: Flat design
5. Click "Generate"
6. Esperar generación

### Paso 3: Personalizar
1. Abrir en editor de Lottiefiles
2. Ajustar colores si necesario
3. Modificar duración
4. Agregar loops si necesario

### Paso 4: Exportar
1. Click "Export"
2. Seleccionar "Lottie JSON"
3. Descargar archivo
4. Guardar en carpeta correspondiente

### Paso 5: Integrar en Flutter
1. Agregar dependencia `lottie: ^2.0.0`
2. Copiar JSON a `assets/rive/`
3. Actualizar `pubspec.yaml`
4. Usar widget `Lottie.asset()`

```dart
// Ejemplo de uso
Lottie.asset(
  'assets/rive/dragon/dragon_happy.json',
  width: 200,
  height: 200,
  fit: BoxFit.contain,
)
```

---

## 🎯 Tips de Calidad

1. **Consistencia:** Usar misma paleta de colores
2. **Simplicidad:** Mantener diseño simple
3. **Tamaño:** Archivos < 100KB ideales
4. **Frames:** 30fps para suavidad
5. **Loop:** Decidir si loop o no según uso
6. **Prueba:** Probar en dispositivo real

---

## 🔧 Solución de Problemas

### La animación no carga
- Verificar que el JSON sea válido
- Revisar tamaño del archivo (< 100KB)
- Probar en otro dispositivo

### La animación es lenta
- Reducir frames a 24fps
- Simplificar diseño
- Reducir tamaño de archivo

### Colores no se ven bien
- Ajustar paleta en editor
- Probar en diferentes screens
- Verificar contraste
