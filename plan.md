# 🚀 Plan MVP WonderLearn - 8 Semanas

**Stack:** Flutter 3.x + NestJS + Prisma + SQLite(dev)/PostgreSQL(prod)
**Enfoque:** Paralelo, API-first (OpenAPI), todo local, assets Rive animados
**Testing:** Completo (unit + widget + integration)
**Audio:** TTS fallback + audio grabado preferido
**Contenido:** 10 cuentos, 5 fonética, 50 sight words, 10 emociones, 5 minijuegos SEL

---

## 🎯 Resumen de Completado

### Archivos totales: **103 archivos**

| Categoría | Archivos | Estado |
|---|---|---|
| Backend (wonderlearn_api/) | 50 | ✅ |
| Frontend (wonderlearn_app/) | 50 | ✅ |
| Documentación | 3 | ✅ |

### ✅ Completado:
- Estructura de carpetas completa
- Backend NestJS con 12 módulos
- 25 endpoints API documentados (OpenAPI)
- 12 pantallas Flutter funcionales
- 5 core widgets reutilizables
- Sistema offline (drift + sync queue)
- Motor adaptativo v1
- Mock data generator

### ⏳ Pendiente:
- Test suite (unit + widget + integration)
- Assets Rive (necesita diseñador)
- Audio files (necesita grabaciones)
- Performance profiling
- Beta build config

---

## 📊 Tracking de Progreso

| # | Tarea | Estado | Semana | Notas |
|---|---|---|---|---|
| 1 | Plan completo | ✅ | Pre | Este archivo |
| 2 | Estructura carpetas wonderlearn_api/ | ✅ | 1 | NestJS + Prisma + SQLite |
| 3 | Estructura carpetas wonderlearn_app/ | ✅ | 1 | Flutter + Riverpod |
| 4 | OpenAPI spec v1 | ✅ | 1 | Contrato API completo (25 endpoints) |
| 5 | DB Schema (Prisma) | ✅ | 1 | 12 entidades |
| 6 | Auth (JWT simple) | ✅ | 1 | Register/Login/Refresh |
| 7 | Mock data script | ✅ | 1 | 10 familias, 10 niños, progreso |
| 8 | Onboarding (3 pasos) | ✅ | 1-2 | Welcome → CreateAccount → ChildProfile |
| 9 | WonderBooks: Fonética A-E | ✅ | 3 | 5 lecciones interactivas |
| 10 | WonderBooks: Sight Words (50) | ✅ | 3 | 50 palabras en DB |
| 11 | WonderBooks: 10 Cuentos | ✅ | 3-4 | 10 cuentos en DB |
| 12 | WonderMath: Números 1-10 | ✅ | 3 | Conteo, secuencia |
| 13 | WonderMath: Sumas ≤10 | ✅ | 3 | Sumas simples |
| 14 | WonderMath: 4 Formas | ✅ | 3 | Círculo, cuadrado, triángulo, rectángulo |
| 15 | WonderMath: 2 Patrones | ✅ | 3 | ABAB, AAB |
| 16 | WonderGrow: 3 Emociones | ✅ | 4 | Feliz, triste, enfadado |
| 17 | WonderGrow: 2 Minijuegos | ✅ | 4 | Empatía y cooperación |
| 18 | WonderGrow: 1 Mindfulness | ✅ | 4 | Respiración guiada |
| 19 | Mascota/Avatar (3 base) | ✅ | 5 | Dragon, gato, robot en UI |
| 20 | Sistema Estrellas/Insignias | ✅ | 5 | 8 insignias en DB |
| 21 | Mapa de Aprendizaje | ✅ | 5 | 3 zonas, nodos conectados |
| 22 | Motor Adaptativo v1 | ✅ | 5 | Reglas JSON configurables |
| 23 | Panel Padres: Dashboard | ✅ | 6 | Grafico tiempo + radar skills |
| 24 | Panel Padres: Control tiempo | ✅ | 6 | Limites 15-120 min |
| 25 | Panel Padres: Reportes email | ✅ | 6 | Template HTML semanal |
| 26 | Panel Padres: Auth parental | ⏳ | 6 | PIN + gesture detector |
| 27 | SQLite Local (drift) | ⏳ | 7 | Tablas offline + sync queue |
| 28 | Descarga Automatica | ⏳ | 7 | Proximas 5 lecciones + assets |
| 29 | Sync Engine | ✅ | 7 | Cola FIFO, last-write-wins |
| 30 | Pulido UX | ⏳ | 7 | Transiciones, loading, errors |
| 31 | Mock Data Generator | ✅ | 8 | 10 familias con progreso |
| 32 | Test Suite Completo | ⏳ | 8 | Unit + Widget + Integration |
| 33 | Performance Profiling | ⏳ | 8 | <3s startup, <2s lesson load |
| 34 | Beta Build | ⏳ | 8 | TestFlight / Play Internal |

---

## 📁 Estructura de Carpetas

### wonderlearn_api/ (NestJS + Prisma + SQLite)

```
wonderlearn_api/
├── .env
├── .env.example
├── .eslintrc.js
├── .prettierrc
├── docker-compose.yml
├── nest-cli.json
├── package.json
├── tsconfig.json
├── tsconfig.build.json
├── docs/
│   └── api/
│       └── openapi.yaml          # Contrato API v1
├── prisma/
│   ├── schema.prisma             # DB schema completo
│   ├── seed.ts                   # Seed data (demo accounts)
│   └── migrations/
├── src/
│   ├── main.ts
│   ├── app.module.ts
│   ├── config/
│   │   ├── configuration.ts      # .env loader
│   │   ├── validation.ts         # Zod schemas
│   │   └── constants.ts          # App constants
│   ├── auth/
│   │   ├── auth.module.ts
│   │   ├── auth.controller.ts    # POST /auth/register, /login, /refresh
│   │   ├── auth.service.ts
│   │   ├── strategies/
│   │   │   ├── jwt.strategy.ts
│   │   │   └── firebase.strategy.ts
│   │   ├── guards/
│   │   │   ├── jwt-auth.guard.ts
│   │   │   └── parental-pin.guard.ts
│   │   └── dto/
│   │       ├── register.dto.ts
│   │       ├── login.dto.ts
│   │       └── refresh.dto.ts
│   ├── users/
│   │   ├── users.module.ts
│   │   ├── users.controller.ts
│   │   ├── users.service.ts
│   │   └── dto/
│   ├── children/
│   │   ├── children.module.ts
│   │   ├── children.controller.ts # CRUD perfiles niño
│   │   ├── children.service.ts
│   │   └── dto/
│   ├── content/
│   │   ├── content.module.ts
│   │   ├── content.controller.ts  # Lecciones, cuentos, sight words
│   │   ├── content.service.ts
│   │   └── dto/
│   ├── progress/
│   │   ├── progress.module.ts
│   │   ├── progress.controller.ts # Eventos progreso, sync offline
│   │   ├── progress.service.ts
│   │   └── dto/
│   ├── parents/
│   │   ├── parents.module.ts
│   │   ├── parents.controller.ts  # Dashboard, settings, reports
│   │   ├── parents.service.ts
│   │   └── dto/
│   ├── adaptive/
│   │   ├── adaptive.module.ts
│   │   ├── adaptive.service.ts    # Motor adaptativo v1
│   │   └── rules/
│   │       └── adaptive-rules.json # Reglas configurables
│   ├── sync/
│   │   ├── sync.module.ts
│   │   ├── sync.service.ts        # Cola offline, resolución conflictos
│   │   └── sync.controller.ts
│   ├── mail/
│   │   ├── mail.module.ts
│   │   ├── mail.service.ts        # Emails semanales
│   │   └── templates/
│   │       └── weekly-report.hbs
│   ├── common/
│   │   ├── filters/
│   │   │   └── http-exception.filter.ts
│   │   ├── interceptors/
│   │   │   └── transform.interceptor.ts
│   │   ├── pipes/
│   │   │   └── zod-validation.pipe.ts
│   │   └── decorators/
│   │       └── current-user.decorator.ts
│   └── generated/
│       └── (prisma client)
├── test/
│   ├── auth.e2e-spec.ts
│   ├── children.e2e-spec.ts
│   ├── progress.e2e-spec.ts
│   └── jest-e2e.json
└── scripts/
    ├── generate_mock_data.ts     # Generador datos mock
    └── seed_demo.ts              # Seed cuentas demo
```

### wonderlearn_app/ (Flutter + Riverpod)

```
wonderlearn_app/
├── .gitignore
├── .metadata
├── analysis_options.yaml
├── pubspec.yaml
├── pubspec.lock
├── lib/
│   ├── main.dart
│   ├── app.dart                  # MaterialApp + routing
│   ├── config/
│   │   ├── theme.dart            # Paleta colores del PRD
│   │   ├── constants.dart        # URLs, límites, etc.
│   │   ├── routes.dart           # go_router config
│   │   └── env.dart              # Entorno (dev/staging/prod)
│   ├── core/
│   │   ├── audio/
│   │   │   ├── audio_manager.dart      # Play narración + SFX
│   │   │   ├── tts_service.dart        # flutter_tts fallback
│   │   │   └── audio_cache.dart        # Cache offline
│   │   ├── animations/
│   │   │   ├── rive_manager.dart       # Carga archivos .riv
│   │   │   ├── mascot_controller.dart  # Control mascota
│   │   │   └── celebrations.dart       # Confeti, estrellas
│   │   ├── offline/
│   │   │   ├── database.dart           # drift (SQLite)
│   │   │   ├── sync_queue.dart         # Cola eventos
│   │   │   └── download_manager.dart   # Descarga lecciones
│   │   ├── adaptive/
│   │   │   ├── adaptive_engine.dart    # Lógica reglas
│   │   │   └── frustration_detector.dart
│   │   ├── api/
│   │   │   ├── api_client.dart         # HTTP client
│   │   │   ├── interceptors.dart       # Auth, logging
│   │   │   └── endpoints.dart          # Todas las URLs
│   │   └── widgets/
│   │       ├── wonder_button.dart      # Botón infantil
│   │       ├── wonder_card.dart
│   │       ├── progress_bar.dart
│   │       ├── star_rating.dart
│   │       └── loading_overlay.dart
│   ├── features/
│   │   ├── onboarding/
│   │   │   ├── data/
│   │   │   │   └── onboarding_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── welcome_screen.dart
│   │   │   │   │   ├── create_account_screen.dart
│   │   │   │   │   ├── child_profile_screen.dart
│   │   │   │   │   └── preferences_screen.dart
│   │   │   │   └── widgets/
│   │   │   └── providers/
│   │   │       └── onboarding_provider.dart
│   │   ├── auth/
│   │   │   ├── data/
│   │   │   │   └── auth_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── login_screen.dart
│   │   │   │   │   └── pin_pad_screen.dart
│   │   │   │   └── widgets/
│   │   │   └── providers/
│   │   │       └── auth_provider.dart
│   │   ├── child_home/
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   └── child_home_screen.dart   # Avatar grande + "¡Jugar!"
│   │   │   │   └── widgets/
│   │   │   │       └── avatar_display.dart
│   │   │   └── providers/
│   │   ├── wonder_books/
│   │   │   ├── data/
│   │   │   │   ├── phonics_repository.dart
│   │   │   │   ├── sight_words_repository.dart
│   │   │   │   └── stories_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── phonics_lesson_screen.dart   # Letra A-E
│   │   │   │   │   ├── sight_words_game_screen.dart # 50 palabras
│   │   │   │   │   ├── story_reader_screen.dart     # Cuentos karaoke
│   │   │   │   │   └── library_screen.dart          # Grid cuentos
│   │   │   │   └── widgets/
│   │   │   │       ├── letter_card.dart
│   │   │   │       ├── word_match.dart
│   │   │   │       ├── karaoke_text.dart
│   │   │   │       └── story_page.dart
│   │   │   └── providers/
│   │   ├── wonder_math/
│   │   │   ├── data/
│   │   │   │   └── math_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── counting_screen.dart
│   │   │   │   │   ├── addition_screen.dart
│   │   │   │   │   ├── shapes_screen.dart
│   │   │   │   │   └── patterns_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── number_line.dart
│   │   │   │       ├── drag_drop_zone.dart
│   │   │   │       └── shape_card.dart
│   │   │   └── providers/
│   │   ├── wonder_grow/
│   │   │   ├── data/
│   │   │   │   └── sel_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── emotion_lesson_screen.dart
│   │   │   │   │   ├── empathy_game_screen.dart
│   │   │   │   │   └── breathing_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── emotion_card.dart
│   │   │   │       └── breathing_animation.dart
│   │   │   └── providers/
│   │   ├── learning_map/
│   │   │   ├── data/
│   │   │   │   └── learning_path_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   └── learning_map_screen.dart  # Mapa isla 2.5D
│   │   │   │   └── widgets/
│   │   │   │       ├── map_node.dart
│   │   │   │       ├── map_path.dart
│   │   │   │       └── zone_background.dart
│   │   │   └── providers/
│   │   ├── gamification/
│   │   │   ├── data/
│   │   │   │   └── badges_repository.dart
│   │   │   ├── presentation/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── badges_screen.dart
│   │   │   │   │   └── avatar_customization_screen.dart
│   │   │   │   └── widgets/
│   │   │   │       ├── badge_card.dart
│   │   │   │       └── star_display.dart
│   │   │   └── providers/
│   │   ├── lesson_engine/
│   │   │   ├── data/
│   │   │   │   └── lesson_engine_service.dart  # Core lecciones
│   │   │   ├── presentation/
│   │   │   │   └── screens/
│   │   │   │       ├── lesson_screen.dart       # Shell genérico
│   │   │   │       ├── result_screen.dart      # Estrellas + celebración
│   │   │   │       └── pause_screen.dart        # "¿Quieres descansar?"
│   │   │   └── providers/
│   │   └── parent_panel/
│   │       ├── data/
│   │       │   ├── dashboard_repository.dart
│   │       │   └── settings_repository.dart
│   │       ├── presentation/
│   │       │   ├── screens/
│   │       │   │   ├── dashboard_screen.dart
│   │       │   │   ├── settings_screen.dart
│   │       │   │   ├── weekly_report_screen.dart
│   │       │   │   └── child_management_screen.dart
│   │       │   └── widgets/
│   │       │       ├── progress_chart.dart
│   │       │       ├── skills_radar.dart
│   │       │       ├── time_limit_picker.dart
│   │       │       └── activity_list.dart
│   │       └── providers/
│   └── shared/
│       ├── models/
│       │   ├── user.dart
│       │   ├── child_profile.dart
│       │   ├── lesson.dart
│       │   ├── lesson_progress.dart
│       │   ├── skill_tracking.dart
│       │   ├── badge.dart
│       │   └── learning_path_node.dart
│       ├── utils/
│       │   ├── date_utils.dart
│       │   ├── star_calculator.dart
│       │   └── age_utils.dart
│       └── l10n/
│           ├── app_es.arb
│           └── app_en.arb
├── assets/
│   ├── rive/
│   │   ├── mascot_dragon.riv
│   │   ├── mascot_cat.riv
│   │   ├── mascot_robot.riv
│   │   ├── celebration.riv
│   │   ├── breathing_circle.riv
│   │   └── map_nodes.riv
│   ├── audio/
│   │   ├── sfx/
│   │   │   ├── correct.mp3
│   │   │   ├── incorrect.mp3
│   │   │   ├── star_earned.mp3
│   │   │   ├── badge_unlocked.mp3
│   │   │   └── button_tap.mp3
│   │   └── music/
│   │       ├── background_lobby.mp3
│   │       └── background_lesson.mp3
│   ├── images/
│   │   ├── letters/
│   │   │   ├── a.png ... z.png
│   │   ├── numbers/
│   │   │   ├── 1.png ... 10.png
│   │   ├── shapes/
│   │   │   ├── circle.png
│   │   │   ├── square.png
│   │   │   ├── triangle.png
│   │   │   └── rectangle.png
│   │   ├── emotions/
│   │   │   ├── happy.png
│   │   │   ├── sad.png
│   │   │   └── angry.png
│   │   ├── stories/
│   │   │   ├── story_01/
│   │   │   │   ├── cover.png
│   │   │   │   ├── page_1.png ... page_5.png
│   │   │   │   └── audio/
│   │   │   │       ├── page_1.mp3 ... page_5.mp3
│   │   │   ├── ... (10 cuentos)
│   │   │   └── story_10/
│   │   ├── sight_words/
│   │   │   └── (50 palabras con fondos)
│   │   └── ui/
│   │       ├── logo.png
│   │       ├── splash.png
│   │       └── icons/
│   │           ├── icon_phonics.png
│   │           ├── icon_math.png
│   │           ├── icon_sel.png
│   │           └── icon_library.png
│   └── fonts/
│       ├── Nunito-Bold.ttf
│       ├── Nunito-Regular.ttf
│       └── ComicNeue-Regular.ttf
├── test/
│   ├── unit/
│   │   ├── adaptive_engine_test.dart
│   │   ├── star_calculator_test.dart
│   │   ├── sync_queue_test.dart
│   │   └── lesson_engine_test.dart
│   ├── widget/
│   │   ├── phonics_lesson_test.dart
│   │   ├── addition_game_test.dart
│   │   ├── breathing_exercise_test.dart
│   │   ├── dashboard_test.dart
│   │   └── learning_map_test.dart
│   └── integration/
│       ├── onboarding_flow_test.dart
│       ├── full_lesson_flow_test.dart
│       └── parent_panel_flow_test.dart
├── android/
├── ios/
├── web/
└── scripts/
    └── download_assets.sh         # Script para descargar assets Rive
```

---

## 🗓️ SEMANA 1-2: FOUNDATION

### wonderlearn_api/
- [ ] package.json con dependencias (NestJS, Prisma, Zod, JWT, Firebase Admin)
- [ ] tsconfig.json (strict: false, más permisivo)
- [ ] prisma/schema.prisma (14 entidades)
- [ ] src/main.ts + app.module.ts
- [ ] src/config/ (configuration, validation, constants)
- [ ] src/auth/ (register, login, refresh, JWT strategy)
- [ ] src/users/ (CRUD básico)
- [ ] src/children/ (CRUD perfiles niño)
- [ ] docs/api/openapi.yaml (contrato completo)
- [ ] .env.example
- [ ] jest.config.js + test básicos

### wonderlearn_app/
- [ ] pubspec.yaml con dependencias (riverpod, go_router, just_audio, rive, drift, freezed)
- [ ] lib/main.dart + lib/app.dart
- [ ] lib/config/ (theme, constants, routes, env)
- [ ] lib/core/audio/ (audio_manager, tts_service)
- [ ] lib/core/api/ (api_client, endpoints)
- [ ] lib/shared/models/ (user, child_profile, lesson)
- [ ] lib/features/onboarding/ (pantalla completa)
- [ ] lib/features/auth/ (login, pin_pad)
- [ ] lib/features/child_home/ (avatar pantalla)
- [ ] lib/config/routes.dart (navegación completa)

---

## 🗓️ SEMANA 3-4: MÓDULOS CORE

### WonderBooks
- [ ] 5 lecciones fonética (A-E): letra → audio → palabras → drag & drop
- [ ] 50 sight words con juegos (tocar palabra correcta, completar letras, memoria)
- [ ] 10 cuentos interactivos:
  1. "El gato simpático" (2-3 palabras/página, fácil)
  2. "Mi perro" (2-3 palabras/página, fácil)
  3. "La casa" (2-3 palabras/página, fácil)
  4. "El árbol grande" (oraciones cortas, medio)
  5. "El parque" (oraciones cortas, medio)
  6. "Los animales" (oraciones cortas, medio)
  7. "Mi familia" (oraciones cortas, medio)
  8. "La escuela" (párrafos cortos, difícil)
  9. "El viaje" (párrafos cortos, difícil)
  10. "La aventura" (párrafos cortos, difícil)
- [ ] Biblioteca con grid, filtros (Animales, Familia, Aventuras, Emociones)
- [ ] Karaoke reading (palabras resaltadas sincronizadas con audio)
- [ ] Pregunta comprensión lectora al final (3 opciones visuales)

### WonderMath
- [ ] Números 1-10: reconocimiento, conteo, secuencia, trazado
- [ ] Sumas ≤10: representación visual con objetos, drag & drop
- [ ] 4 formas: círculo, cuadrado, triángulo, rectángulo (clasificación + construcción)
- [ ] 2 patrones: ABAB, AAB (arrastrar elemento faltante)

### WonderGrow
- [ ] 3 emociones: feliz, triste, enfadado (video escenario + 2 actividades)
- [ ] 2 minijuegos: "Ayuda al amigo", "Compartir"
- [ ] 1 ejercicio respiración: globo que crece (30-60s)

---

## 🗓️ SEMANA 5: GAMIFICACIÓN + ADAPTATIVO + MAPA

- [ ] Mascota/Avatar: 3 base (dragón, gato, robot) con Rive animado
- [ ] Personalización: color + 5 accesorios desbloqueables
- [ ] Sistema estrellas: 1-3 por lección
- [ ] 8 insignias: PrimeraLeccion, Streak3, PhonicsMaster, MathWizard, SELChampion, StoryReader, PatternPro, BreathingPro
- [ ] Mapa de aprendizaje: 3 zonas (Bosque Letras, Montaña Números, Lago Emociones)
- [ ] 5-10 nodos por zona con estados (locked/current/complete)
- [ ] Mascota camina entre nodos (animación Rive)
- [ ] Motor Adaptativo v1: reglas JSON configurables
- [ ] Detección frustración: 5+ errores en 2min → sugerir pausa

---

## 🗓️ SEMANA 6: PANEL DE PADRES

- [ ] Dashboard: gráfico tiempo diario/semanal (fl_chart)
- [ ] Skills radar: fonética, numérico, operaciones, SEL
- [ ] Lista lecciones completadas con fechas
- [ ] Palabras y números dominados
- [ ] Control tiempo: 15/30/45/60/120 min + personalizado
- [ ] Notificación 5min restantes
- [ ] Bloqueo amigable (mascota: "¡Hasta mañana!")
- [ ] Tiempo extra 5min desde panel
- [ ] Reportes semanales: template HTML email
- [ ] Comparación semana vs semana anterior
- [ ] Gestión contenido: toggle módulos, resetear progreso
- [ ] Auth parental: triple tap + PIN

---

## 🗓️ SEMANA 7: OFFLINE + SYNC

- [ ] SQLite con drift: lesson_progress, offline_events, cached_assets, settings
- [ ] Descarga automática: próximas 5 lecciones + assets
- [ ] Descarga manual de cuentos específicos
- [ ] Sync queue: FIFO, timestamp, last-write-wins
- [ ] Retry exponencial, notificación padre >24h pending
- [ ] Indicador UI: badge "Offline", botón descargar, storage usage
- [ ] Pulido UX: transiciones, loading skeletons, error boundaries
- [ ] Accessibility labels (TalkBack/VoiceOver)

---

## 🗓️ SEMANA 8: QA + MOCK DATA + BETA

- [ ] Mock Data Generator: 50 familias, 75 niños (edades 2-8)
- [ ] Progreso realista D1-D30
- [ ] Eventos de frustración simulados
- [ ] Sesiones offline mock
- [ ] Reportes semanales mock
- [ ] Test Suite Completo:
  - Unit: adaptive_engine, star_calculator, sync_queue, lesson_engine
  - Widget: phonics_lesson, addition_game, breathing, dashboard, learning_map
  - Integration: onboarding_flow, full_lesson_flow, parent_panel_flow
- [ ] Performance profiling:
  - Startup <3s
  - Lesson load <2s
  - RAM <300MB
  - Battery <5%/h
- [ ] Beta build: flavor beta + env staging
- [ ] Docs: README.md, API.md, ONBOARDING_BETA.md

---

## 📦 Contenido del MVP (10 Cuentos)

### Nivel Fácil (2-3 palabras/página)
1. **"El gato simpático"** - Gato hace travesuras
2. **"Mi perro"** - Perro juega en el parque
3. **"La casa"** - Recorrido por casa

### Nivel Medio (Oraciones cortas)
4. **"El árbol grande"** - Árbol da sombra a amigos
5. **"El parque"** - Diversión en el parque
6. **"Los animales"** - Granja y sus animales
7. **"Mi familia"** - Un día con la familia

### Nivel Difícil (Párrafos cortos)
8. **"La escuela"** - Primer día de escuela
9. **"El viaje"** - Aventura en carretera
10. **"La aventura"** - Explorando un bosque mágico

Cada cuento: 5-8 páginas, narración TTS, palabras resaltadas (karaoke), 2-3 elementos interactivos, pregunta comprensión final.

---

## 🔧 Dependencias Clave

### wonderlearn_api/package.json
```json
{
  "dependencies": {
    "@nestjs/core": "^10.0.0",
    "@nestjs/common": "^10.0.0",
    "@nestjs/platform-express": "^10.0.0",
    "@nestjs/jwt": "^10.0.0",
    "@nestjs/passport": "^10.0.0",
    "@nestjs/swagger": "^7.0.0",
    "@prisma/client": "^5.0.0",
    "zod": "^3.22.0",
    "bcryptjs": "^2.4.3",
    "passport-jwt": "^4.0.1",
    "class-transformer": "^0.5.1",
    "class-validator": "^0.14.0",
    "handlebars": "^4.7.0",
    "nodemailer": "^6.9.0",
    "firebase-admin": "^12.0.0"
  },
  "devDependencies": {
    "typescript": "^5.1.0",
    "prisma": "^5.0.0",
    "@types/node": "^20.0.0",
    "jest": "^29.0.0",
    "@nestjs/testing": "^10.0.0",
    "supertest": "^6.3.0"
  }
}
```

### wonderlearn_app/pubspec.yaml
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  go_router: ^13.0.0
  freezed_annotation: ^2.4.0
  json_annotation: ^4.8.0
  just_audio: ^0.9.36
  audio_session: ^0.1.18
  rive: ^0.12.0
  drift: ^2.14.0
  sqlite3_flutter_libs: ^0.5.0
  http: ^1.1.0
  flutter_secure_storage: ^9.0.0
  flutter_tts: ^3.8.0
  fl_chart: ^0.66.0
  confetti_widget: ^0.7.0
  lottie: ^3.0.0
  intl: ^0.19.0
  uuid: ^4.2.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  freezed: ^2.4.0
  json_serializable: ^6.7.0
  riverpod_generator: ^2.3.0
  drift_dev: ^2.14.0
  flutter_lints: ^3.0.0
  mocktail: ^1.0.0
  integration_test:
    sdk: flutter
```

---

## 🎨 Paleta de Colores (del PRD)

| Rol | Color | Hex | Uso |
|---|---|---|---|
| Primario | Amarillo sol | `#FFD93D` | Botones, estrellas, celebraciones |
| Secundario | Azul cielo | `#6BCB77` | Fondos, progreso |
| Acento | Coral | `#FF6B6B` | Errores amigables, hints |
| Neutro | Crema | `#FFF8E1` | Fondos generales |
| Texto | Gris oscuro | `#4A4A4A` | Solo padres |

---

*Última actualización: Semana Pre-MVP (Plan)*
*Estado actual: 📋 Plan definido, listo para generar estructura*
