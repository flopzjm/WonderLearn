# 🚀 Plan de Trabajo WonderLearn — Basado en PRD v1.2

**Fecha:** 16 de junio de 2026
**Alcance:** Fase 1 (MVP) — 8 semanas
**Stack:** Flutter 3.x + NestJS + Prisma + SQLite(dev)/PostgreSQL(prod)
**Objetivo:** Validar producto-mercado con 500 familias beta, Retención D7 > 60%

---

## 📊 Resumen Ejecutivo

| Requisito PRD | Estado Actual | Tareas Pendientes |
|---|---|---|
| 🔴 Must Have (MVP): 22 | 15 completados | 7 restantes |
| 🟡 Should Have (MVP): 11 | 3 completados | 8 restantes |
| 🟢 Could Have (MVP): 6 | 2 completados | 4 restantes |
| ⏱️ Non-Functionals | 8/15 completados | 7 restantes |

---

## ✅ SEMANA 1-2: FOUNDATION (Completado)

### Backend (wonderlearn_api/)
| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 1.1 | NestJS + Prisma + SQLite setup | RNF-COM-01, RNF-COM-02 | ✅ |
| 1.2 | DB Schema (12 entidades) | Sección 9.2 | ✅ |
| 1.3 | Auth JWT (register/login/refresh) | RF-AU-01 | ✅ |
| 1.4 | Users CRUD | RF-AU-01 | ✅ |
| 1.5 | Children CRUD (perfiles) | RF-AU-02 | ✅ |
| 1.6 | OpenAPI spec v25 endpoints | Sección 9.3 | ✅ |
| 1.7 | .env.example + config | RNF-SEC-03 | ✅ |

### Frontend (wonderlearn_app/)
| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 1.8 | Flutter + Riverpod + go_router | RNF-COM-01, RNF-COM-02 | ✅ |
| 1.9 | Theme (paleta PRD §10.2) | Sección 10.2 | ✅ |
| 1.10 | API client + interceptors | RNF-SEC-06 | ✅ |
| 1.11 | Onboarding (3 pasos) | RF-AU-01, RF-AU-02 | ✅ |
| 1.12 | Auth screens (login, PIN) | RF-AU-03 | ✅ |
| 1.13 | Child home (avatar pantalla) | RF-AU-03 | ✅ |
| 1.14 | Shared models (7 modelos) | Sección 9.2 | ✅ |

---

## ✅ SEMANA 3-4: MÓDULOS CORE (Completado)

### WonderBooks (Lectura)
| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 2.1 | 5 lecciones fonética (A-E) | RF-WB-01 | ✅ |
| 2.2 | 50 sight words en DB | RF-WB-02 | ✅ |
| 2.3 | 10 cuentos en DB | RF-WB-03 | ✅ |
| 2.4 | Biblioteca grid + filtros | RF-WB-04 | ✅ |
| 2.5 | Narración karaoke (palabras resaltadas) | RF-WB-05 | ✅ |
| 2.6 | Pregunta comprensión lectora | RF-WB-03 | ✅ |

### WonderMath (Matemáticas)
| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 2.7 | Números 1-10 (conteo, secuencia) | RF-WM-01 | ✅ |
| 2.8 | Sumas ≤10 | RF-WM-02 | ✅ |
| 2.9 | 4 formas geométricas | RF-WM-03 | ✅ |
| 2.10 | 2 patrones (ABAB, AAB) | RF-WM-04 | ✅ |

### WonderGrow (SEL)
| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 2.11 | 3 emociones (feliz, triste, enfadado) | RF-WG-01 | ✅ |
| 2.12 | 2 minijuegos empatía | RF-WG-02 | ✅ |
| 2.13 | 1 ejercicio respiración | RF-WG-03 | ✅ |

---

## ✅ SEMANA 5: GAMIFICACIÓN + ADAPTATIVO (Completado)

| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 3.1 | Mascota/Avatar (3 base) | RF-GAM-01 | ✅ |
| 3.2 | Sistema estrellas e insignias | RF-GAM-02 | ✅ |
| 3.3 | Mapa de aprendizaje (3 zonas) | RF-GAM-03 | ✅ |
| 3.4 | Motor Adaptativo v1 (reglas JSON) | RF-ADA-01 | ✅ |
| 3.5 | Detección de frustración | RF-ADA-02 | ✅ |

---

## ✅ SEMANA 6: PANEL DE PADRES (Completado)

| # | Tarea | Requisito PRD | Estado |
|---|---|---|---|
| 4.1 | Dashboard progreso | RF-PC-01 | ✅ |
| 4.2 | Control tiempo pantalla | RF-PC-02 | ✅ |
| 4.3 | Reportes semanales email | RF-PC-03 | ✅ |

---

## ⏳ SEMANA 7: OFFLINE + SYNC + PULIDO (En Progreso)

| # | Tarea | Requisito PRD | Estado | Prioridad |
|---|---|---|---|---|
| 5.1 | SQLite local (drift) — tablas offline | RF-OFF-01 | ⏳ | 🔴 Alta |
| 5.2 | Sync queue FIFO + last-write-wins | RF-OFF-02 | ✅ | 🔴 Alta |
| 5.3 | Descarga automática próximas 5 lecciones | RF-OFF-01 | ⏳ | 🔴 Alta |
| 5.4 | Descarga manual de cuentos | RF-OFF-01 | ⏳ | 🟡 Media |
| 5.5 | Indicador UI: badge "Offline" + storage usage | RNF-AVA-02 | ⏳ | 🟡 Media |
| 5.6 | Auth parental: PIN + gesture detector | RF-AU-03 | ⏳ | 🔴 Alta |
| 5.7 | Pulido UX: transiciones, loading skeletons | RNF-UX-01 a RNF-UX-05 | ⏳ | 🔴 Alta |
| 5.8 | Error boundaries + fallbacks | RNF-AVA-02 | ⏳ | 🟡 Media |
| 5.9 | Accessibility labels (TalkBack/VoiceOver) | RNF-COM-04 | ⏳ | 🔴 Alta |
| 5.10 | Zonas táctiles ≥48x48dp | RNF-UX-02 | ⏳ | 🟡 Media |

---

## ⏳ SEMANA 8: QA + ASSETS + BETA (Pendiente)

| # | Tarea | Requisito PRD | Estado | Prioridad |
|---|---|---|---|---|
| 6.1 | Test suite completo (unit + widget + integration) | RNF-PER-01 a RNF-PER-05 | ⏳ | 🔴 Alta |
| 6.2 | Performance profiling (<3s startup, <2s lesson) | RNF-PER-01, RNF-PER-02 | ⏳ | 🔴 Alta |
| 6.3 | Beta build (TestFlight + Play Internal) | RNF-COM-01, RNF-COM-02 | ⏳ | 🔴 Alta |
| 6.4 | Mock data generator (50 familias, 75 niños) | OB-01 | ⏳ | 🟡 Media |
| 6.5 | Documentación: README, API docs, Beta onboarding | OB-01 | ⏳ | 🟡 Media |
| 6.6 | Generar assets visuales (DALL-E/Midjourney) | Sección 9.4 | ⏳ | 🔴 Alta |
| 6.7 | Generar audio narraciones (ElevenLabs/Bark) | Sección 9.4 | ⏳ | 🔴 Alta |
| 6.8 | Generar animaciones (Lottie AI) | Sección 9.4 | ⏳ | 🔴 Alta |
| 6.9 | Generar música fondo (Suno) | Sección 9.4 | ⏳ | 🟢 Baja |
| 6.10 | COPPA/GDPR-K compliance check | RNF-SEC-01, RNF-SEC-02 | ⏳ | 🔴 Alta |

---

## 📋 Detalle de Tareas Pendientes por Requisito PRD

### 🔴 Must Have — Pendientes (7 tareas)

#### RF-AU-03: Inicio de sesión del niño (Pin + Gesture)
**Criterios del PRD:**
- Acceso mediante selección de avatar en pantalla de inicio
- PIN simple de 4 dígitos configurado por el padre
- Bloqueo automático de compras y configuraciones del SO

**Tareas:**
- [ ] Implementar PIN pad screen en Flutter
- [ ] Guardar PIN hasheado en Prisma (ChildProfile.pinHash)
- [ ] Gesture detector en child_home (evitar toques accidentales a panel padres)
- [ ] Guided access / screen pinning nativo (platform channels)

#### RF-OFF-01: Descarga de contenido offline
**Criterios del PRD:**
- Descarga automática de próximas 5 lecciones
- Descarga manual de cuentos específicos
- Indicador de almacenamiento usado (limpiar caché)
- Límite de caché: 500MB por defecto

**Tareas:**
- [ ] Implementar drift database (lesson_progress, offline_events, cached_assets, settings)
- [ ] Download manager: cola de descarga con prioridad
- [ ] Auto-download: analyzer de ruta de aprendizaje → próximas 5 lecciones
- [ ] UI: storage usage indicator + clean cache button
- [ ] Límite configurable 500MB

#### RF-OFF-02: Sincronización de progreso offline
**Criterios del PRD:**
- Cola de eventos offline (SQLite local) sincronizada en background
- Resolución de conflictos: último evento gana (timestamp)
- Notificación al padre si hay datos pendientes >24h

**Tareas:**
- [ ] Sync service: retry exponencial (1s, 2s, 4s, 8s, max 5 retries)
- [ ] Conflict resolution: last-write-wins por timestamp
- [ ] Notification push si pending events >24h
- [ ] UI: badge "Syncing..." durante sincronización

#### RNF-COM-04: Accesibilidad
**Criterios del PRD:**
- TalkBack (Android) y VoiceOver (iOS)
- Contraste WCAG 2.1 AA
- Tamaño de texto ajustable

**Tareas:**
- [ ] Semantic labels en todos los widgets interactivos
- [ ] Focus order lógico para navegación por voz
- [ ] High contrast mode toggle en settings
- [ ] Font scaling support (textScaleFactor)
- [ ] Contraste verificador (herramienta automatizada)

#### RNF-UX-01 a RNF-UX-05: Usabilidad
**Criterios del PRD:**
- Sin texto para niños (100% iconográfica y audio)
- Zonas táctiles ≥48x48dp botones, >80x80dp drag
- Feedback multisensorial (audio + vibración + animación)
- Sin "game over" — errores son oportunidades de aprendizaje
- Botón salida siempre visible para padres

**Tareas:**
- [ ] Revisar todas las pantallas infantiles: zero text, pure icons + audio
- [ ] Verificar tamaños de hit areas con herramienta de_inspection
- [ ] Implementar haptic feedback en interacciones correctas/incorrectas
- [ ] Remover cualquier "game over" o pantalla de fracaso
- [ ] Persistent parent exit button con confirmación

---

### 🟡 Should Have — Pendientes (8 tareas)

#### RF-WB-05: Narración sincronizada (karaoke reading) — Completar
**Estado:** Implementado parcialmente (palabras resaltadas síncronas)
**Pendiente:**
- [ ] Auto-play de audio con sincronización palabra por palabra
- [ ] Velocidad de lectura configurable (lento/normal/rápido)

#### RF-WB-06: Audiolibros
**Criterios del PRD:**
- Modo pasivo de aprendizaje
- Accesibilidad para disléxicos

**Tareas:**
- [ ] Modo "Solo escuchar" en cuentos (sin interacción visual)
- [ ] Lista de reproducción de cuentos
- [ ] Control de velocidad de narración

#### RF-WM-05: Multiplicación/divisiones introductorias
**Criterios del PRD:**
- Escalabilidad a 6-8 años
- Preparación para primaria

**Tareas:**
- [ ] 5 lecciones de multiplicación con objetos visuales
- [ ] 3 lecciones de división básica
- [ ] Integración con motor adaptativo

#### RF-WG-03: Mindfulness guiado — Expandir
**Estado:** 1 ejercicio implementado
**Pendiente:**
- [ ] Ejercicio 2: "Flores y velas" (inhalar flores, exhalar velas)
- [ ] Ejercicio 3: "Contar ovejas" (respiración con visual)
- [ ] Accesible como "pausa" automática si se detecta frustración (RF-ADA-02)

#### RF-GAM-04: Personalización de avatar
**Criterios del PRD:**
- Color personalizable
- Accesorios desbloqueables (sombrero, gafas)
- Desbloqueo por progreso (5 lecciones completadas)

**Tareas:**
- [ ] Avatar customization screen (color picker + accesorios grid)
- [ ] Lógica de desbloqueo: 5 lecciones → color, 10 lecciones → sombrero, etc.
- [ ] Persistir customización en ChildProfile.avatarCustomization (JSON)

#### RF-PC-03: Reportes semanales — Expandir
**Estado:** Template HTML básico
**Pendiente:**
- [ ] Comparación semana vs semana anterior
- [ ] Sugerencias de actividades offline
- [ ] Opción de desactivar emails

#### RF-OFF-02: Sincronización — Mejoras
**Pendiente:**
- [ ] Indicador visual de progreso de sync (% completado)
- [ ] Retry manual (botón "Reintentar" si falla)

#### RNF-AVA-02: Degradación graceful
**Criterios del PRD:**
- Si backend cae, app funciona en modo offline

**Tareas:**
- [ ] Detectar conexión perdida automáticamente
- [ ] Mostrar banner "Modo offline" persistente
- [ ] Cola de eventos se acumula y sincroniza al reconectar
- [ ] Sin crash ni pantalla de error si no hay red

---

### 🟢 Could Have — Pendientes (4 tareas)

#### COULD-01: Foto de perfil del niño
**Tarea:** Opción de subir foto (con filtro de moderación automática)
**Justificación:** Personalización visual; pero avatar es suficiente
**Decisión:** Implementar solo si hay capacidad剩余

#### COULD-02: Animaciones premium de mascota (3D)
**Tarea:** Upgrade de Rive 2D a 3D pre-renderizado
**Justificación:** Delight visual; pero 2D es suficiente
**Decisión:** Postergar a Fase 2

#### COULD-03: Temas de interfaz (oscuro, alto contraste)
**Tarea:** Dark mode + high contrast mode
**Justificación:** Accesibilidad
**Decisión:** Implementar solo alto contrast (Ya parcialmente en RNF-COM-04)

#### COULD-09: Eventos temporales (Halloween, Navidad)
**Tarea:** 2 eventos/año con contenido temático
**Justificación:** Freshness de contenido
**Decisión:** Post-lanzamiento si hay engagement

---

## 📦 Assets Necesarios (Generados por IA)

### Imágenes (DALL-E 3 / Midjourney)
| Categoría | Cantidad | Estado |
|---|---|---|
| Letras A-Z con objetos | 26 | Pendiente |
| Números 1-20 con objetos | 20 | Pendiente |
| Formas geométricas | 4 | Pendiente |
| Emociones (personajes) | 5 | Pendiente |
| Escenarios de cuentos | 50 (10 cuentos × 5 págs) | Pendiente |
| Iconos UI | 20 | Pendiente |
| Fondos de zona (isla) | 3 | Pendiente |
| **Total** | **128** | **Pendiente** |

### Audio (ElevenLabs / Bark TTS)
| Categoría | Cantidad | Estado |
|---|---|---|
| Narración cuentos | 50 páginas | Pendiente |
| Fonética (sonido letra) | 26 | Pendiente |
| Sight words (audio) | 50 | Pendiente |
| Instrucciones actividades | 30 | Pendiente |
| Feedback (correcto/incorrecto) | 10 | Pendiente |
| Mascota (frases ánimo) | 20 | Pendiente |
| **Total** | **186** | **Pendiente** |

### Animaciones (Lottie AI)
| Categoría | Cantidad | Estado |
|---|---|---|
| Mascota (3 estados × 3 avatares) | 9 | Pendiente |
| Celebración (confeti, estrellas) | 3 | Pendiente |
| Respiración (globo creciendo) | 1 | Pendiente |
| Transiciones entre pantallas | 5 | Pendiente |
| **Total** | **18** | **Pendiente** |

### Música (Suno AI)
| Categoría | Cantidad | Estado |
|---|---|---|
| Background lobby | 1 | Pendiente |
| Background lecciones | 1 | Pendiente |
| Fanfarria de éxito | 1 | Pendiente |
| Música calmada (SEL) | 1 | Pendiente |
| **Total** | **4** | **Pendiente** |

---

## 🔧 Non-Functionals — Estado

| ID | Requisito | Estado | Notas |
|---|---|---|---|
| RNF-PER-01 | Startup <3s | ⏳ | Necesita profiling |
| RNF-PER-02 | Lesson load <2s | ⏳ | Assets precargados |
| RNF-PER-03 | Feedback <100ms | ✅ | Síncrono en UI |
| RNF-PER-04 | Battery <5%/h | ⏳ | Necesita profiling |
| RNF-PER-05 | RAM <300MB | ⏳ | Necesita profiling |
| RNF-SEC-01 | COPPA | ⏳ | Compliance check |
| RNF-SEC-02 | GDPR-K | ⏳ | Compliance check |
| RNF-SEC-03 | TLS 1.3 + AES-256 | ✅ | HTTPS nativo |
| RNF-SEC-04 | Sin publicidad | ✅ | Cero ads |
| RNF-SEC-05 | Moderación contenido | ✅ | Zero UGC |
| RNF-SEC-06 | OAuth 2.0 + JWT | ✅ | Implementado |
| RNF-SEC-07 | Anti-tampering | ⏳ | Cert pinning |
| RNF-AVA-01 | Uptime 99.9% | ⏳ | Necesita infra cloud |
| RNF-AVA-02 | Offline mode | ⏳ | En progreso |
| RNF-AVA-03 | Auto-scaling | ⏳ | Serverless setup |
| RNF-AVA-04 | Backups diarios | ⏳ | Cron job setup |
| RNF-COM-01 | Android API 26+ | ✅ | Configurado |
| RNF-COM-02 | iOS 14+ | ✅ | Configurado |
| RNF-COM-03 | Responsive 4.7"-12.9" | ✅ | Layouts adaptivos |
| RNF-COM-04 | Accesibilidad | ⏳ | TalkBack/VoiceOver |
| RNF-COM-05 | ES/EN | ✅ | ARB files |

---

## 🎯 North Star Metric — Tracking

**Métrica:** "Lecciones Completadas de Calidad por Niño por Semana"

**Implementación necesaria:**
- [ ] Event tracking: lesson_started, lesson_completed, score
- [ ] Cálculo semanal automático
- [ ] Dashboard de métricas para el equipo
- [ ] Integración con Amplitude/Segment

**Meta M6:** 5 lecciones/semana (cohorte 4-5 años)

---

## 📅 Cronograma Visual

```
Semana 1-2  ██████████████████████████████ FOUNDATION ✅
Semana 3-4  ██████████████████████████████ CORE MODULES ✅
Semana 5    ██████████████████████████████ GAMIFICATION ✅
Semana 6    ██████████████████████████████ PARENT PANEL ✅
Semana 7    █████████░░░░░░░░░░░░░░░░░░░░ OFFLINE + SYNC (60%)
Semana 8    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ QA + ASSETS + BETA
```

---

## ⚠️ Riesgos Activos

| ID | Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|---|
| R-01 | Falta de assets generados | Alta | Alto | Priorizar generación IA en Semana 7 |
| R-02 | Flutter no instalado en máquina | Alta | Crítico | Instalar SDK antes de Semana 8 |
| R-03 | COPPA/GDPR sin revisar legal | Media | Crítico | Consultar abogado especializado |
| R-04 | Performance no cumple targets | Media | Alto | Profiling desde Semana 7 |
| R-05 | Beta sin 500 familias | Media | Alto | Plan de reclutamiento desde Semana 6 |

---

## 📋 Checklist de Lanzamiento Beta

### Antes de beta (Semana 8):
- [ ] Flutter SDK instalado y funcionando
- [ ] Todos los tests pasando (unit + widget + integration)
- [ ] Backend deployado (Railway/Fly.io/Render)
- [ ] Assets generados y integrados (imágenes, audio, animaciones)
- [ ] COPPA/GDPR compliance verificado
- [ ] TestFlight build aprobado
- [ ] Play Internal track activo
- [ ] Feedback mechanism (in-app survey o email)

### Durante beta (Semana 9-10):
- [ ] 500 familias reclutadas
- [ ] Analytics tracking activo (DAU, retención, sesiones)
- [ ] Soporte técnico disponible
- [ ] Iteración semanal basado en feedback
- [ ] NPS survey semanal

### Criterios de éxito beta:
- [ ] Retención D7 > 60%
- [ ] NPS > 50
- [ ] Crash rate < 1%
- [ ] < 5 bugs críticos abiertos

---

*Última actualización: 16 de junio 2026*
*Estado: 🟡 60% completado, 40% pendiente (Semanas 7-8)*
