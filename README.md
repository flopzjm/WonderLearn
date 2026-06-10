# WonderLearn 🌟

Plataforma educativa para niños 2-10 años que integra lectura, matemáticas, idiomas, STEM y desarrollo socioemocional (SEL) en una experiencia gamificada y adaptativa.

## 🚀 Inicio Rápido

### Prerrequisitos
- Node.js 20+
- Flutter 3.2+
- Docker (opcional, para PostgreSQL)

### Backend (wonderlearn_api/)

```bash
cd wonderlearn_api

# Instalar dependencias
npm install

# Generar cliente Prisma
npx prisma generate

# Crear migración de base de datos
npx prisma migrate dev --name init

# Sembrar base de datos con datos demo
npx prisma db seed

# Iniciar servidor de desarrollo
npm run start:dev
```

El servidor estará disponible en `http://localhost:3000`
Documentación Swagger: `http://localhost:3000/docs`

### Frontend (wonderlearn_app/)

```bash
cd wonderlearn_app

# Instalar dependencias
flutter pub get

# Generar código (freezed, riverpod)
flutter pub run build_runner build --delete-conflicting-outputs

# Ejecutar en dispositivo/emulador
flutter run
```

### Cuentas Demo

```
Email: demo@wonderlearn.app
Contraseña: password123
```

## 📁 Estructura del Proyecto

```
wonderlearn/
├── wonderlearn_api/          # Backend NestJS
│   ├── src/
│   │   ├── auth/            # Autenticación JWT
│   │   ├── children/        # Perfiles de niños
│   │   ├── content/         # Lecciones y contenido
│   │   ├── progress/        # Tracking de progreso
│   │   ├── parents/         # Panel de padres
│   │   ├── adaptive/        # Motor adaptativo
│   │   ├── sync/            # Sincronización offline
│   │   └── mail/            # Emails (reportes semanales)
│   ├── prisma/              # Schema de base de datos
│   └── docs/api/            # OpenAPI specification
│
├── wonderlearn_app/          # Frontend Flutter
│   ├── lib/
│   │   ├── config/          # Theme, routes, constants
│   │   ├── core/            # Audio, API, offline, adaptive
│   │   ├── features/        # Módulos de la app
│   │   │   ├── onboarding/
│   │   │   ├── auth/
│   │   │   ├── child_home/
│   │   │   ├── wonder_books/
│   │   │   ├── wonder_math/
│   │   │   ├── wonder_grow/
│   │   │   ├── learning_map/
│   │   │   ├── gamification/
│   │   │   └── parent_panel/
│   │   └── shared/          # Models, utils, l10n
│   └── assets/              # Rive, audio, imágenes
│
└── plan.md                  # Plan de desarrollo
```

## 🎯 MVP - Funcionalidades

### Módulo WonderBooks (Lectura)
- ✅ Fonética interactiva (A-E)
- ✅ 50 Sight Words con juegos
- ✅ 10 cuentos interactivos con narración TTS
- ✅ Karaoke reading (palabras sincronizadas)
- ✅ Preguntas de comprensión lectora

### Módulo WonderMath (Matemáticas)
- ✅ Números 1-10: conteo, secuencia, trazado
- ✅ Sumas simples (hasta 10)
- ✅ 4 formas geométricas básicas
- ✅ 2 patrones (ABAB, AAB)

### Módulo WonderGrow (SEL)
- ✅ 3 emociones: feliz, triste, enfadado
- ✅ 2 minijuegos de empatía
- ✅ 1 ejercicio de respiración mindfulness

### Sistema Core
- ✅ Autenticación JWT + refresh tokens
- ✅ Perfiles de niño con avatares (dragón, gato, robot)
- ✅ Sistema de estrellas e insignias
- ✅ Motor adaptativo v1 (reglas JSON)
- ✅ Mapa de aprendizaje isométrico
- ✅ Modo offline con SQLite
- ✅ Sincronización de datos

### Panel de Padres
- ✅ Dashboard de progreso con gráficos
- ✅ Control de tiempo de pantalla (15-120 min)
- ✅ Gestión de módulos
- ✅ Reportes semanales por email

## 🛠️ Stack Tecnológico

### Backend
- **Framework:** NestJS 10
- **ORM:** Prisma 5
- **Base de datos:** SQLite (dev) / PostgreSQL (prod)
- **Auth:** JWT + bcryptjs
- **API:** REST + Swagger/OpenAPI
- **Email:** Handlebars templates + Nodemailer

### Frontend
- **Framework:** Flutter 3.2+
- **State Management:** Riverpod 2
- **Routing:** go_router
- **Animaciones:** Rive + Lottie
- **Audio:** just_audio + flutter_tts
- **Offline:** drift (SQLite)
- **Charts:** fl_chart
- **Models:** freezed + json_serializable

## 🎨 Paleta de Colores

| Rol | Color | Hex |
|---|---|---|
| Primario | Amarillo sol | #FFD93D |
| Secundario | Azul cielo | #6BCB77 |
| Acento | Coral | #FF6B6B |
| Neutro | Crema | #FFF8E1 |
| Texto | Gris oscuro | #4A4A4A |

## 📊 API Endpoints

### Auth
- `POST /api/v1/auth/register` - Registro
- `POST /api/v1/auth/login` - Login
- `POST /api/v1/auth/refresh` - Refresh token

### Children
- `GET /api/v1/children` - Listar perfiles
- `POST /api/v1/children` - Crear perfil
- `GET /api/v1/children/:id` - Detalle con progreso
- `PATCH /api/v1/children/:id` - Actualizar
- `DELETE /api/v1/children/:id` - Eliminar

### Content
- `GET /api/v1/content/lessons` - Listar lecciones
- `GET /api/v1/content/phonics` - Fonética (A-Z)
- `GET /api/v1/content/sight-words` - Sight words
- `GET /api/v1/content/stories` - Cuentos
- `GET /api/v1/content/math` - Matemáticas
- `GET /api/v1/content/sel` - Emociones

### Progress
- `POST /api/v1/progress/events` - Registrar evento
- `GET /api/v1/progress/:childId` - Progreso completo

### Parents
- `GET /api/v1/parents/dashboard/:childId` - Dashboard
- `PATCH /api/v1/parents/settings/:childId/time-limit` - Límite tiempo
- `POST /api/v1/parents/reports/:childId/weekly` - Reporte email

### Sync
- `POST /api/v1/sync/:childId` - Sincronizar eventos
- `GET /api/v1/sync/:childId/pending` - Eventos pendientes

## 🧪 Testing

```bash
# Backend
cd wonderlearn_api
npm run test           # Unit tests
npm run test:e2e       # Integration tests
npm run test:cov       # Coverage

# Frontend
cd wonderlearn_app
flutter test           # Unit tests
flutter test integration_test  # Integration tests
```

## 📝 Licencia

Propietario - WonderLearn 2026
