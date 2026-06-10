# 📋 Product Requirements Document (PRD)
# WonderLearn — App Educativa para Niños 2-10 años

**Versión:** 1.2  
**Fecha:** 8 de junio de 2026 (actualizado v1.2)  
**Autor:** Product Strategy Team  
**Estado:** Draft — Aprobación pendiente  
**Clasificación:** Interno / Confidencial

---

## 📑 Tabla de Contenidos

1. [Resumen Ejecutivo](#1-resumen-ejecutivo)
2. [Contexto y Antecedentes](#2-contexto-y-antecedentes)
3. [Objetivos del Producto](#3-objetivos-del-producto)
4. [Usuarios y Personas](#4-usuarios-y-personas)
5. [Alcance del MVP (Fase 1)](#5-alcance-del-mvp-fase-1)
6. [Requisitos Funcionales](#6-requisitos-funcionales)
7. [Requisitos No Funcionales](#7-requisitos-no-funcionales)
8. [Casos de Uso y Flujos](#8-casos-de-uso-y-flujos)
9. [Especificaciones Técnicas](#9-especificaciones-técnicas)
10. [Diseño y UX](#10-diseño-y-ux)
11. [Criterios de Aceptación](#11-criterios-de-aceptación)
12. [Métricas y KPIs](#12-métricas-y-kpis)
13. [Roadmap de Entregas](#13-roadmap-de-entregas)
14. [Riesgos y Mitigaciones](#14-riesgos-y-mitigaciones)
15. [Glosario](#15-glosario)
16. [Historial de Cambios](#16-historial-de-cambios)

---

## 1. Resumen Ejecutivo

WonderLearn es una plataforma educativa móvil para niños de 2 a 10 años que integra lectura, matemáticas, idiomas, STEM y desarrollo socioemocional (SEL) en una única experiencia gamificada y adaptativa. El MVP se centrará en los módulos de **Lectura**, **Matemáticas básicas** y **SEL**, junto con un **Panel de Padres** para seguimiento de progreso.

**Propuesta de valor:** La única app educativa que crece con el niño, ofreciendo un curriculum holístico, sin anuncios intrusivos, con IA adaptativa ética y narración personalizada con la voz de los padres.

---

## 2. Contexto y Antecedentes

### 2.1 Problema
- Las apps educativas actuales son fragmentadas: una para matemáticas, otra para lectura, otra para idiomas.
- Muchas apps infantiles usan dark patterns, compras in-app agresivas o publicidad inapropiada.
- Falta de personalización real: la mayoría se basa solo en edad cronológica, no en habilidad real.
- Los padres no tienen visibilidad clara del progreso educativo de sus hijos.

### 2.2 Oportunidad
- Mercado EdTech infantil valorado en >$10B con crecimiento del 16% anual.
- Demanda creciente de soluciones integrales post-pandemia.
- Tecnologías de IA/TTS/AR maduras y accesibles para startups.

### 2.3 Benchmarking
Análisis de 9 herramientas líderes (Khan Academy Kids, Duolingo ABC, Epic!, Prodigy, DragonBox, Scratch Jr, Lingokids, Osmo, Minecraft Education) identificando fortalezas a integrar y debilidades a evitar.

---

## 3. Objetivos del Producto

### 3.1 Objetivos de Negocio
| ID | Objetivo | Métrica | Plazo |
|---|---|---|---|
| OB-01 | Validar producto-mercado con 500 familias beta | Retención D7 > 60% | M6 |
| OB-02 | Generar ingresos recurrentes | MRR > $5,000 | M12 |
| OB-03 | Escalar a 100,000 MAU | MAU = 100,000 | M18 |
| OB-04 | Rentabilidad operativa | EBITDA positivo | M24 |

### 3.2 Objetivos de Producto
| ID | Objetivo | Prioridad |
|---|---|---|
| OP-01 | Crear experiencia de aprendizaje lúdica y sin fricción | Crítica |
| OP-02 | Garantizar seguridad y privacidad infantil (COPPA/GDPR-K) | Crítica |
| OP-03 | Construir motor de personalización adaptativa (v1) | Alta |
| OP-04 | Ofrecer panel de padres con insights accionables | Alta |
| OP-05 | Diseñar arquitectura escalable para futuros módulos | Alta |

### 3.3 Objetivos Educativos
| ID | Objetivo | Métrica |
|---|---|---|
| OE-01 | Mejorar habilidades de fonética | 70% de niños mejoran en evaluación pre/post |
| OE-02 | Desarrollar competencias socioemocionales | 65% de padres reportan mejoras en gestión emocional |
| OE-03 | Fomentar autonomía en el aprendizaje | >80% de sesiones iniciadas por el niño sin intervención |

---

### 3.4 North Star Metric

**Métrica Estrella del Norte:** **"Lecciones Completadas de Calidad por Niño por Semana"**

**Definición:** Número de lecciones que un niño completa con una puntuación ≥ 2 estrellas, medido semanalmente y promediado por cohorte de edad.

**Por qué esta métrica:**
- Refleja **engagement** (el niño vuelve regularmente).
- Refleja **eficacia educativa** (completa con buen rendimiento, no solo "pasa el tiempo").
- Es un **leading indicator** de retención a largo plazo y conversión a premium.
- Se descompone en métricas operativas accionables:
  - *Input:* Tasa de inicio de lección (engagement diario)
  - *Input:* Tasa de finalización de lección ( UX/flujo sin fricción)
  - *Input:* Distribución de puntuaciones (calidad del contenido y adaptación de dificultad)

**Fórmula:**
```
North Star = Σ (Lecciones completadas con ≥ 2 estrellas) / Σ (Niños activos semanales)
```

**Meta por cohorte:**
| Edad | Meta Semanal 1 (M6) | Meta Semanal 2 (M12) | Meta Semanal 3 (M18) |
|---|---|---|---|
| 2-3 años | 3 lecciones | 5 lecciones | 7 lecciones |
| 4-5 años | 5 lecciones | 8 lecciones | 10 lecciones |
| 6-8 años | 7 lecciones | 10 lecciones | 12 lecciones |

**Métricas de apoyo (guardianas):**
- *Guardiana de calidad:* NPS de padres > 50 (si los padres no están contentos, el niño no vuelve).
- *Guardiana de ética:* Tiempo de pantalla dentro de límites configurados en > 95% de sesiones (no queremos engagement a costa de la salud).
- *Guardiana de negocio:* Retención D30 > 25% (la North Star debe traducirse en lealtad).


## 4. Usuarios y Personas

### 4.1 Usuario Primario: Niño (2-8 años en MVP)
**Persona: "Lucas, 5 años"**
- Edad: 5 años, preescolar.
- Contexto: Usa tablet de la familia 30-45 min/día.
- Motivaciones: Jugar, ver personajes coloridos, recibir recompensas.
- Frustraciones: Apps que son "aburridas", demasiado difíciles, o con muchos botones de compra.
- Necesidades: Lecciones cortas (5-10 min), feedback inmediato, narración guiada, colores brillantes.

### 4.2 Usuario Secundario: Padre/Madre (25-40 años)
**Persona: "María, madre de Lucas"**
- Edad: 34 años, profesional, tiempo limitado.
- Contexto: Busca apps educativas de calidad, preocupada por el tiempo de pantalla.
- Motivaciones: Que su hijo aprenda de forma segura, seguimiento de progreso.
- Frustraciones: No saber qué hace su hijo en la app, compras in-app sorpresa, contenido inapropiado.
- Necesidades: Reportes claros, control de tiempo, contenido sin anuncios, precio justo.

### 4.3 Usuario Terciario: Educador (Fase 3+)
**Persona: "Profesora Ana, 42 años"**
- Contexto: Maestra de preescolar buscando herramientas para el aula.
- Necesidades: Dashboard de clase, asignación de tareas, alineación con estándares curriculares.

---

## 5. Alcance del MVP (Fase 1)

### 5.1 In-Scope (Incluido en MVP)

#### Módulo WonderBooks (Lectura)
- Alfabeto interactivo (A-Z) con fonética asociada.
- 50 sight words con juegos de reconocimiento.
- 20 cuentos interactivos con narración profesional.
- Sistema de seguimiento de palabras aprendidas.

#### Módulo WonderMath (Matemáticas)
- Números 1-20: reconocimiento, conteo, secuencias.
- Sumas y restas simples (hasta 10).
- Formas geométricas básicas (círculo, cuadrado, triángulo, rectángulo).
- Juegos de clasificación y patrones.

#### Módulo WonderGrow (SEL)
- 10 lecciones sobre emociones básicas (feliz, triste, enfadado, asustado, calmado).
- 5 minijuegos de empatía y cooperación.
- Ejercicios de respiración y mindfulness guiado (30-60 seg).

#### Sistema Core
- Registro de usuario (padre + perfil de niño).
- Avatar/Mascota personalizable (3 opciones base, desbloqueables con progreso).
- Sistema de niveles y recompensas (insignias, estrellas).
- Motor adaptativo básico (reglas basadas en aciertos/errores consecutivos).
- Modo offline (contenido descargado previamente).

#### Panel de Padres (WonderConnect)
- Dashboard de progreso por módulo (tiempo, lecciones completadas, habilidades dominadas).
- Control de tiempo de pantalla (límites diarios configurables).
- Reporte semanal por email.
- Gestión de perfil del niño (nombre, edad, avatar).

### 5.2 Out-of-Scope (Excluido del MVP)
- Módulos de idiomas (WonderLang), programación (WonderCode), creatividad (WonderCreate).
- IA avanzada (machine learning profundo), clonación de voz, AR.
- Cuentos personalizados con IA.
- Modo multi-jugador / colaborativo.
- Versión web, TV o hardware propio.
- Dashboard para educadores/escuelas.
- Suscripción premium (MVP será 100% gratuito para beta testers).
- Sistema de marketplace de contenido de terceros.

---

## 6. Requisitos Funcionales

### 6.1 Sistema de Autenticación y Onboarding

#### RF-AU-01: Registro de cuenta de padre
**Descripción:** El padre debe poder crear una cuenta usando email, Google Sign-In o Apple Sign-In.  
**Criterios:**
- Validación de email con código de verificación.
- No se requiere número de teléfono.
- Aceptación de Términos de Servicio y Política de Privacidad (adaptada a menores).
- Flujo de onboarding de 3 pasos: cuenta → perfil del niño → preferencias.

#### RF-AU-02: Creación de perfil de niño
**Descripción:** El padre crea al menos un perfil de niño con nombre, edad (2-8) y avatar inicial.  
**Criterios:**
- Máximo 1 perfil en MVP (2 perfiles en Fase 2).
- Edad usada para establecer nivel inicial de contenido.
- Opción de añadir foto de perfil (desde cámara o galería, con filtro de moderación automática).

#### RF-AU-03: Inicio de sesión del niño
**Descripción:** El niño accede a su perfil sin necesidad de contraseña.  
**Criterios:**
- Acceso mediante selección de avatar en pantalla de inicio.
- Opcional: PIN simple de 4 dígitos configurado por el padre para evitar acceso a panel de padres.
- Bloqueo automático de compras y configuraciones del sistema operativo (guided access / screen pinning nativo).

### 6.2 Módulo WonderBooks (Lectura)

#### RF-WB-01: Lección de fonética
**Descripción:** Lección interactiva para cada letra del alfabeto.  
**Criterios:**
- Presentación de letra mayúscula y minúscula.
- Sonido fonético con audio profesional (no sintético en MVP).
- 3 palabras de ejemplo con ilustración y animación.
- Actividad de arrastrar-y-soltar: asociar letra con objeto correcto.
- Retroalimentación auditiva y visual inmediata (correcto/incorrecto).

#### RF-WB-02: Sight Words
**Descripción:** Juegos de reconocimiento de 50 palabras de alta frecuencia.  
**Criterios:**
- Presentación de palabra con audio.
- Actividades: tocar la palabra correcta entre 3 opciones, completar la palabra con letras faltantes, memoria con palabras.
- Seguimiento de palabras "dominadas" (3 aciertos consecutivos).

#### RF-WB-03: Cuentos interactivos
**Descripción:** 20 cuentos con narración y elementos interactivos.  
**Criterios:**
- Narración página por página (auto-play o manual).
- Palabras resaltadas sincronizadas con audio (karaoke reading).
- 2-3 elementos interactivos por página (tocar personaje para animación, arrastrar objeto).
- Pregunta de comprensión lectora al final (1 pregunta tipo "¿Qué pasó después?" con 3 opciones visuales).
- Dificultad progresiva: cuentos 1-5 (2-3 palabras por página), 6-12 (oraciones cortas), 13-20 (párrafos cortos).

#### RF-WB-04: Biblioteca
**Descripción:** Catálogo de cuentos desbloqueados y próximos.  
**Criterios:**
- Visualización en grid con portadas coloridas.
- Indicador de progreso (estrellas 0-3) por cuento.
- Cuentos bloqueados muestran requisito de desbloqueo ("Completa 5 lecciones de fonética").
- Filtro por categoría: Animales, Familia, Aventuras, Emociones.

### 6.3 Módulo WonderMath (Matemáticas)

#### RF-WM-01: Números y conteo
**Descripción:** Actividades de reconocimiento numérico 1-20.  
**Criterios:**
- Números con representación visual (puntos, objetos).
- Actividad de conteo: tocar objetos mientras se cuenta en voz alta.
- Actividad de secuencia: ordenar números faltantes.
- Actividad de trazado: dibujar el número en pantalla (con guía visual).

#### RF-WM-02: Sumas y restas
**Descripción:** Operaciones simples hasta 10.  
**Criterios:**
- Representación visual con objetos (ej: 3 manzanas + 2 manzanas).
- Actividad de arrastrar objetos para sumar/restar.
- Modo de respuesta: selección múltiple (3 opciones) o entrada numérica (teclado numérico grande).
- Dificultad progresiva: primero sumas hasta 5, luego hasta 10, luego restas.

#### RF-WM-03: Formas y geometría
**Descripción:** Reconocimiento de formas básicas.  
**Criterios:**
- 4 formas: círculo, cuadrado, triángulo, rectángulo.
- Actividad de clasificación: arrastrar objetos reales a la forma correspondiente.
- Actividad de construcción: completar un dibujo usando formas.

#### RF-WM-04: Patrones y lógica
**Descripción:** Completar secuencias de patrones.  
**Criterios:**
- Patrones con formas, colores y números.
- Niveles: ABAB, AAB, ABC, AABB.
- Arrastrar elemento faltante al final de la secuencia.

### 6.4 Módulo WonderGrow (SEL)

#### RF-WG-01: Lecciones de emociones
**Descripción:** 10 lecciones interactivas sobre emociones básicas.  
**Criterios:**
- Cada lección: video corto (30-60s) de escenario + 2 actividades.
- Actividad 1: Identificar emoción en personajes ("¿Cómo se siente?").
- Actividad 2: Emparejar emoción con situación adecuada ("¿Qué te hace feliz?").
- Personajes diversos y situaciones cotidianas.

#### RF-WG-02: Minijuegos de empatía
**Descripción:** 5 juegos cortos de cooperación.  
**Criterios:**
- Juego 1: "Ayuda al amigo" — seleccionar acción correcta cuando un personaje está triste.
- Juego 2: "Compartir" — repartir objetos equitativamente entre personajes.
- Duración máxima: 3 minutos por juego.

#### RF-WG-03: Mindfulness guiado
**Descripción:** Ejercicios de respiración cortos.  
**Criterios:**
- 3 ejercicios de 30-60 segundos.
- Animación visual de inhalar/exhalar (globo que crece, flor que se abre).
- Audio calmado con instrucciones simples.
- Accesible desde menú principal o como "pausa" entre lecciones si el sistema detecta frustración.

### 6.5 Sistema de Gamificación y Progresión

#### RF-GAM-01: Sistema de mascota/avatar
**Descripción:** Avatar personalizable que crece con el progreso.  
**Criterios:**
- 3 opciones base en MVP (dragón, gato, robot).
- Personalización: color, accesorios (sombrero, gafas) desbloqueables.
- La mascota reacciona a aciertos/errores (animaciones de alegría/tristeza).
- Nivel de mascota = nivel global del niño (1-20 en MVP).

#### RF-GAM-02: Recompensas y logros
**Descripción:** Sistema de estrellas e insignias.  
**Criterios:**
- 1-3 estrellas por lección según rendimiento (aciertos, tiempo, intentos).
- Insignias especiales: "Primera lección", "5 días seguidos", "Maestro de sumas", "Lector experto".
- Colección de insignias visible en perfil del niño.
- Sin moneda virtual ni tienda de compras en MVP.

#### RF-GAM-03: Rutas de aprendizaje
**Descripción:** Mapa visual de progreso.  
**Criterios:**
- Mapa tipo "isla" con zonas temáticas (Bosque de Letras, Montaña de Números, Lago de Emociones).
- Cada zona tiene 5-10 niveles/nodos.
- Nodos bloqueados requieren completar anterior.
- Progreso persistente en backend (sincronización al reconectarse).

### 6.6 Motor Adaptativo (v1 — Reglas)

#### RF-ADA-01: Ajuste de dificultad
**Descripción:** Sistema basado en reglas que adapta contenido.  
**Criterios:**
- Si 3 aciertos consecutivos → aumentar dificultad (ej: números 1-10 → 1-20).
- Si 3 errores consecutivos → reducir dificultad y mostrar hint visual.
- Si tiempo por respuesta > 10s → ofrecer ayuda auditiva adicional.
- Si sesión > 15 min sin pausa → sugerir actividad de mindfulness.
- Reglas configurables desde backend (JSON) sin necesidad de deploy.

#### RF-ADA-02: Detección de frustración
**Descripción:** Indicadores básicos de frustración.  
**Criterios:**
- Patrones: 5+ errores en 2 minutos, toques aleatorios en pantalla, abandono de lección.
- Acción: mostrar mensaje de ánimo de la mascota, ofrecer pausa o cambiar a actividad más sencilla.
- Registro de eventos para análisis posterior (no bloqueante para el niño).

### 6.7 Panel de Padres (WonderConnect)

#### RF-PC-01: Dashboard de progreso
**Descripción:** Vista resumen del progreso del niño.  
**Criterios:**
- Gráfico de tiempo de uso diario/semanal.
- Skills radar: fonética, reconocimiento numérico, operaciones, SEL.
- Lecciones completadas por módulo (con fechas).
- Palabras y números dominados (listado específico).
- Última actividad realizada.

#### RF-PC-02: Control de tiempo
**Descripción:** Límites de uso diarios.  
**Criterios:**
- Configuración de límite diario (15, 30, 45, 60 min o personalizado).
- Notificación suave al niño cuando quedan 5 minutos.
- Bloqueo amigable al alcanzar límite (mensaje de la mascota: "¡Hasta mañana!").
- Opción de "tiempo extra" de emergencia (5 min) desde panel de padres.

#### RF-PC-03: Reportes semanales
**Descripción:** Email automático cada domingo.  
**Criterios:**
- Resumen de tiempo total, lecciones completadas, nuevas habilidades.
- Comparación semana vs. semana anterior.
- Sugerencias de actividades offline relacionadas (ej: "Practica contar objetos en casa").
- Opción de desactivar emails.

#### RF-PC-04: Gestión de contenido
**Descripción:** Control parental sobre contenido.  
**Criterios:**
- Activar/desactivar módulos individualmente.
- Forzar revisión de lecciones anteriores antes de nuevas.
- Resetear progreso de módulo específico (si el niño se "atascó").

### 6.8 Sistema Offline

#### RF-OFF-01: Descarga de contenido
**Descripción:** Contenido disponible sin conexión.  
**Criterios:**
- Descarga automática de próximas 5 lecciones basadas en ruta de aprendizaje.
- Descarga manual de cuentos específicos desde biblioteca.
- Indicador de almacenamiento usado (con opción de limpiar caché).
- Límite de caché: 500MB por defecto (configurable).

#### RF-OFF-02: Sincronización
**Descripción:** Sincronización de progreso al reconectar.  
**Criterios:**
- Cola de eventos offline (SQLite local) sincronizada en background.
- Resolución de conflictos: último evento gana (timestamp).
- Notificación al padre si hay datos pendientes de sincronización > 24h.

---


## 6.9 Priorización MoSCoW del Proyecto Completo (Fases 1-4)

Aplicación del método MoSCoW para clasificar **todos los requisitos, módulos y funcionalidades del proyecto WonderLearn a 24 meses**, no solo del MVP. Esto permite visualizar el alcance total, planificar recursos a largo plazo y tomar decisiones estratégicas de inversión por fase.

---

### 🔴 Must Have (Imprescindibles — Sin estos el proyecto no cumple su visión)

#### Fundamentos Técnicos y Legales (Todas las fases)
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-AU-01 | Registro de cuenta de padre | 1 | Sin auth no hay usuarios ni datos. Base de todo. |
| RF-AU-02 | Creación de perfil de niño | 1 | Sin perfil no hay personalización ni progreso. |
| RF-AU-03 | Inicio de sesión del niño | 1 | El niño debe acceder sin barreras de lectura/escritura. |
| RNF-SEC-01 | Cumplimiento COPPA | 1 | Requisito legal para menores de 13 años en EE.UU. |
| RNF-SEC-02 | Cumplimiento GDPR-K | 1 | Requisito legal para menores en UE/EEA. |
| RNF-SEC-04 | Sin publicidad de terceros | 1-4 | Promesa de valor ético; violarla destruye confianza. |
| RNF-COM-01 | Compatibilidad Android API 26+ | 1 | 60%+ del mercado objetivo (LATAM, España, Asia). |
| RNF-COM-02 | Compatibilidad iOS 14+ | 1 | Mercado premium (EE.UU., Europa del Norte). |
| RNF-AVA-01 | Uptime 99.9% | 1-4 | Disponibilidad crítica para confianza de padres y escuelas. |
| RNF-AVA-02 | Degradación graceful (offline mode) | 1 | Si backend cae, app funciona con contenido descargado. |

#### Core Educativo — Lectura (WonderBooks)
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-WB-01 | Lección de fonética (A-Z) | 1 | Pilar del aprendizaje lector; sin esto no hay producto. |
| RF-WB-02 | Sight Words (50-100 palabras) | 1-2 | Segundo pilar de lectura temprana; alta frecuencia. |
| RF-WB-03 | Cuentos interactivos (20-50) | 1-2 | Engagement y comprensión lectora; diferenciador vs. flashcards. |
| RF-WB-04 | Biblioteca con categorías | 2 | Descubrimiento de contenido; escala a 200+ libros. |
| RF-WB-05 | Narración sincronizada (karaoke reading) | 1 | Palabras resaltadas con audio; técnica probada de alfabetización. |
| RF-WB-06 | Audiolibros | 2 | Modo pasivo de aprendizaje; accesibilidad para disléxicos. |

#### Core Educativo — Matemáticas (WonderMath)
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-WM-01 | Números y conteo (1-20) | 1 | Base del razonamiento numérico; sin esto no hay matemáticas. |
| RF-WM-02 | Sumas y restas simples | 1 | Primera operación aritmética; objetivo claro para padres. |
| RF-WM-03 | Formas y geometría básica | 1-2 | Reconocimiento espacial; estándar curricular preescolar. |
| RF-WM-04 | Patrones y lógica | 1-2 | Pensamiento lógico-matemático; habilidad transferible. |
| RF-WM-05 | Multiplicación/divisiones introductorias | 2 | Escalabilidad a 6-8 años; preparación para primaria. |
| RF-WM-06 | Geometría 2D avanzada | 2-3 | Áreas, perímetros, simetría; alineación con estándares escolares. |
| RF-WM-07 | Álgebra implícita (estilo DragonBox) | 3 | Diferenciador STEM; prepara para pensamiento abstracto. |
| RF-WM-08 | Problemas de palabras (word problems) | 2-3 | Aplicación práctica; habilidad clave en evaluaciones estandarizadas. |

#### Core Educativo — Desarrollo Socioemocional (WonderGrow)
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-WG-01 | Lecciones de emociones básicas | 1 | Core de SEL; diferenciador frente a apps puramente académicas. |
| RF-WG-02 | Minijuegos de empatía y cooperación | 1 | Habilidades sociales; demanda creciente post-pandemia. |
| RF-WG-03 | Mindfulness y respiración guiada | 1-2 | Bienestar infantil; tendencia fuerte en educación. |
| RF-WG-04 | Resolución de conflictos | 2-3 | SEL avanzado; habilidad clave para edades 6-8. |
| RF-WG-05 | Inteligencia emocional integrada | 2-3 | Conectar emociones con acciones; programa estructurado. |

#### Sistema de Gamificación y Progresión
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-GAM-01 | Sistema de mascota/avatar | 1 | Motivación intrínseca; identidad del niño en la app. |
| RF-GAM-02 | Recompensas y logros (estrellas + insignias) | 1 | Feedback inmediato; loop de recompensa sin monetización. |
| RF-GAM-03 | Rutas de aprendizaje (mapa visual) | 1 | Navegación estructurada; sensación de progreso y viaje. |
| RF-GAM-04 | Personalización de avatar (colores, accesorios) | 1-2 | Engagement sostenido; desbloqueos por progreso. |
| RF-GAM-05 | Mundo virtual de la mascota | 2-3 | Meta-gamificación; el niño "cuida" de su mascota con el aprendizaje. |

#### Motor Adaptativo
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-ADA-01 | Ajuste de dificultad básico (reglas) | 1 | Sin adaptación, la app no es personalizada; riesgo de frustración. |
| RF-ADA-02 | Detección de frustración básica | 1-2 | Mejora UX; cambio de actividad o pausa automática. |
| RF-ADA-03 | Motor adaptativo con ML (IA v1) | 2-3 | Personalización real basada en patrones de miles de sesiones. |
| RF-ADA-04 | IA predictiva de abandono | 3-4 | Intervención proactiva antes de que el niño deje de usar la app. |
| RF-ADA-05 | Recomendación de contenido por IA | 3-4 | Similar a Epic! pero adaptado a perfil educativo, no solo gustos. |

#### Panel de Padres (WonderConnect)
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-PC-01 | Dashboard de progreso básico | 1 | Valor clave para padres; justificación de tiempo de pantalla. |
| RF-PC-02 | Control de tiempo de pantalla | 1 | Confianza parental; diferenciador ético vs. competencia. |
| RF-PC-03 | Reportes semanales por email | 1-2 | Automatización de valor; reduce necesidad de revisar app constantemente. |
| RF-PC-04 | Gestión de contenido (activar/desactivar módulos) | 2 | Control parental granular; especialmente para edades tempranas. |
| RF-PC-05 | Reportes comparativos (percentiles anónimos) | 3-4 | Contexto para padres: "tu hijo está en el percentil 75 de lectura". |
| RF-PC-06 | Comunidad de padres | 4 | Retención de adultos; soporte entre pares. |

#### Sistema Offline y Sincronización
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| RF-OFF-01 | Descarga de contenido para offline | 1 | Uso real en tablets de viaje/coche; sin esto la app pierde utilidad. |
| RF-OFF-02 | Sincronización de progreso offline | 1-2 | Continuidad de experiencia entre dispositivos y conexiones. |
| RF-OFF-03 | Sincronización multi-dispositivo | 2-3 | Familias con tablet y teléfono; progreso persistente en la nube. |

#### Monetización y Negocio
| ID | Requisito | Fase | Justificación |
|---|---|---|---|
| MON-01 | Suscripción Premium Familia | 2 | Modelo de ingreso recurrente; sostenibilidad del proyecto. |
| MON-02 | Tier gratuito generoso (2 lecciones/día) | 2 | Estrategia de adquisición; competencia directa con Khan Academy Kids. |
| MON-03 | Suscripción Premium Escuela | 3 | B2B; margen alto y contratos anuales. |
| MON-04 | Marketplace de contenido de terceros | 4 | Ecosistema; ingresos por comisión sin costo de producción. |

**Total Must Have:** 52 requisitos

---

### 🟡 Should Have (Importantes — Aportan valor significativo, pero el proyecto puede avanzar sin ellos temporalmente)

#### Idiomas (WonderLang)
| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| WL-01 | Inglés inmersivo (100+ actividades) | 2 | Demanda masiva; Lingokids y Duolingo ABC validan el mercado. | Reducir a 50 actividades en Fase 2. |
| WL-02 | Segundo idioma (español, mandarín, francés) | 3-4 | Mercado global; familias multilingües. | Postergar a Fase 4 si recursos limitados. |
| WL-03 | Práctica de conversación con IA | 3 | Diferenciador tecnológico; simulación de tutoría. | Usar TTS simple en lugar de IA conversacional. |
| WL-04 | Certificación de nivel idioma | 4 | Valor percibido por padres; alineación con estándares (CEFR). | Asociarse con institución externa en lugar de certificación propia. |

#### STEM y Programación (WonderCode)
| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| WC-01 | Programación por bloques (Scratch Jr style) | 3 | Pensamiento computacional; habilidad del siglo XXI. | Integrar SDK de Scratch Jr en lugar de desarrollo propio. |
| WC-02 | Robótica virtual | 3-4 | Aplicación práctica de código; conexión físico-digital. | Simulación 2D en lugar de 3D. |
| WC-03 | Simulaciones STEM (física, química) | 3-4 | Experimentos virtuales seguros; complemento escolar. | Videos interactivos en lugar de simulaciones. |
| WC-04 | Ciencias naturales interactivas | 3 | Biología, ecología; alineación con currículo escolar. | Reducir a 5 temas en lugar de 20. |

#### Creatividad (WonderCreate)
| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| WCR-01 | Dibujo y animación digital | 3 | Expresión artística; complemento del aprendizaje lógico. | Integrar SDK de dibujo existente. |
| WCR-02 | Música y ritmo | 3 | Desarrollo auditivo; integración con matemáticas (patrones). | Reducir a 5 instrumentos virtuales. |
| WCR-03 | Construcción 3D (Minecraft Education style) | 3-4 | Creatividad espacial; ingeniería temprana. | Versión 2D isométrica en lugar de 3D. |
| WCR-04 | Storytelling digital | 3-4 | El niño crea sus propios cuentos; integración lectura-escritura-creatividad. | Plantillas predefinidas en lugar de libertad total. |

#### Tecnologías Avanzadas
| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| TECH-01 | Clonación de voz de padres para narración | 3 | Diferenciador emocional; conexión padre-hijo a distancia. | Usar TTS estándar con selección de voz. |
| TECH-02 | Cuentos personalizados con IA generativa | 3-4 | Escalabilidad infinita de contenido; cada niño es protagonista. | Plantillas paramétricas (nombre, edad, color favorito) en lugar de IA generativa. |
| TECH-03 | Realidad Aumentada (AR) educativa | 3-4 | Aprendizaje inmersivo; conexión mundo físico-digital sin hardware. | FiltrAR de cámara simple en lugar de ARKit/ARCore completo. |
| TECH-04 | Modo multi-jugador colaborativo | 4 | Trabajo en equipo; habilidad social del siglo XXI. | Turnos asíncronos en lugar de tiempo real. |

#### Plataforma y Escalabilidad
| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| PLAT-01 | Versión Web (Chromebooks, PCs) | 4 | Mercado educativo institucional; estándar en escuelas. | PWA (Progressive Web App) en lugar de app web nativa. |
| PLAT-02 | Versión Smart TV | 4 | Modo pasivo; videos y audiolibros en sala familiar. | Chromecast/AirPlay en lugar de app nativa de TV. |
| PLAT-03 | API pública para desarrolladores | 4 | Ecosistema; integraciones con LMS escolares. | Webhooks simples en lugar de API REST completa. |

**Total Should Have:** 20 requisitos

---

### 🟢 Could Have (Deseables — Mejoran la experiencia, pero no afectan el éxito del proyecto)

| ID | Requisito | Fase | Justificación | Plan de contingencia |
|---|---|---|---|---|
| COULD-01 | Foto de perfil del niño (más allá de avatar) | 1-2 | Personalización visual; pero avatar es suficiente. | Eliminar completamente. |
| COULD-02 | Animaciones premium de mascota (3D) | 2-3 | Delight visual; pero 2D es suficiente y más ligero. | Mantener 2D con Rive. |
| COULD-03 | Temas de interfaz (oscuro, alto contraste) | 2-3 | Accesibilidad; pero no demandado por el segmento principal. | Implementar solo alto contraste si hay feedback. |
| COULD-04 | Widgets para pantalla de inicio del dispositivo | 3 | Engagement; pero complejidad de desarrollo por plataforma. | Notificaciones push en lugar de widgets. |
| COULD-05 | Integración con asistentes de voz (Alexa, Google Home) | 4 | Modo hands-free; pero niños pequeños no usan asistentes solos. | Descartar si no hay demanda validada. |
| COULD-06 | Gamificación social (rankings entre amigos) | 4 | Competencia sana; pero riesgo de presión negativa en menores. | Leaderboards anónimos por región. |
| COULD-07 | Recompensas físicas (merchandising, stickers) | 4 | Engagement offline; pero logística compleja. | Descartar o asociarse con partner de fulfillment. |
| COULD-08 | Modo "Hermano mayor" (perfiles de 9-10 años) | 3-4 | Expansión de edad; pero el foco es 2-8 y requiere contenido nuevo. | Postergar a Fase 4+ si hay demanda. |
| COULD-09 | Eventos temporales (Halloween, Navidad) | 2-4 | Freshness de contenido; pero requiere producción continua. | 2 eventos/año en lugar de mensuales. |
| COULD-10 | Idiomas adicionales de la app (alemán, japonés, árabe) | 4 | Mercados nicho; pero traducción y localización costosas. | Inglés y español cubren 80% del mercado objetivo. |

**Total Could Have:** 10 requisitos

---

### ⚫ Won't Have (No esta vez — Excluidos explícitamente del roadmap actual)

| ID | Requisito | Justificación | Cuándo se reconsidera |
|---|---|---|---|
| WONT-01 | Hardware propio (tablet WonderLearn) | Capital intensivo, logística, soporte. Margen bajo en hardware. | Solo si hay >1M usuarios y demanda explícita. |
| WONT-02 | Realidad Virtual (VR) inmersiva | Hardware costoso para niños; riesgo de mareo en menores de 8 años. | No en roadmap; evaluar en 2028+ si tecnología madura. |
| WONT-03 | Tutoría humana en vivo | No escalable; costo operativo masivo; competencia directa con Kumon, etc. | No en roadmap; evaluar marketplace de tutores en Fase 5+. |
| WONT-04 | Evaluaciones estandarizadas propias (tests de IQ, etc.) | Riesgo ético y legal; no somos institución acreditada. | Nunca; asociarse con evaluadores externos si aplica. |
| WONT-05 | Datos de localización GPS del niño | Riesgo de privacidad extremo; sin valor educativo claro. | Nunca; prohibido por política de privacidad. |
| WONT-06 | Red social para niños | COPPA y GDPR-K lo hacen prohibitivo; riesgo de ciberacoso. | Nunca; modo co-op solo con códigos de sala y sin chat libre. |
| WONT-07 | Publicidad de terceros (incluyo ad-tech) | Promesa de valor ético; contaminaría la experiencia. | Nunca; modelo freemium + suscripción es suficiente. |
| WONT-08 | Venta de datos a terceros | Ética y legalmente inaceptable para menores. | Nunca; política pública de "zero data selling". |
| WONT-09 | Criptomonedas / NFTs / blockchain | Irrelevante para educación infantil; riesgo regulatorio. | Nunca; no aplica al segmento. |
| WONT-10 | Gamificación con compras in-app agresivas | Dark patterns; destruye confianza parental. | Nunca; solo suscripción transparente y contenido desbloqueable por progreso. |
| WONT-11 | Contenido religioso o ideológico | Neutralidad educativa; riesgo de alienar segmentos. | Nunca; contenido secular y universal. |
| WONT-12 | Modo "babysitter" (dejar al niño solo sin supervisión) | No promovemos abandono parental; el panel de padres es obligatorio. | Nunca; diseñamos para co-uso padre-hijo. |

**Total Won't Have:** 12 requisitos / políticas

---

### 📊 Resumen MoSCoW del Proyecto Completo

```
┌────────────────────────────────────────────────────────────────────┐
│              PRIORIZACIÓN MoSCoW — PROYECTO COMPLETO              │
├────────────────────────────────────────────────────────────────────┤
│ 🔴 Must Have     │ 52 requisitos │ 55% del esfuerzo total (24 meses) │
│ 🟡 Should Have   │ 20 requisitos │ 30% del esfuerzo total            │
│ 🟢 Could Have    │ 10 requisitos │ 10% del esfuerzo total            │
│ ⚫ Won't Have    │ 12 requisitos │  0% del esfuerzo (excluido)       │
├────────────────────────────────────────────────────────────────────┤
│ TOTAL REQUISITOS │ 94 requisitos │ 100% del alcance del proyecto     │
└────────────────────────────────────────────────────────────────────┘
```

### 🗺️ Distribución por Fase

| Fase | Must Have | Should Have | Could Have | Won't Have | Total Fase |
|---|---|---|---|---|---|
| **Fase 1 (MVP)** | 22 | 11 | 6 | 15 | 54 |
| **Fase 2 (Plus)** | 15 | 8 | 2 | 0 | 25 |
| **Fase 3 (Pro)** | 12 | 10 | 2 | 0 | 24 |
| **Fase 4 (Universe)** | 3 | 2 | 0 | 0 | 5 |
| **Total Acumulado** | 52 | 20 | 10 | 12 | 94 |

### 🎯 Reglas de Oro para la Priorización

1. **Must Have nunca se negocia:** Si no se puede entregar un Must Have en su fase planificada, la fase se aplaza, no se reduce alcance.
2. **Should Have es el área de flexibilidad:** Si hay presión de recursos, se reduce cantidad (ej: 100 actividades de inglés → 50) o se posterga a la siguiente fase.
3. **Could Have es el "delight budget":** Se implementa solo si hay capacidad técnica y creativa sobrante en la fase.
4. **Won't Have es inmutable:** Estos límites definen la ética y la estrategia del producto. No se reconsideran sin revisión de consejo directivo.
5. **Revisión trimestral:** El MoSCoW se revisa cada 3 meses. Un Should Have puede ascender a Must Have si la competencia lo lanza primero. Un Could Have puede descender a Won't Have si no genera engagement.


## 7. Requisitos No Funcionales

### 7.1 Rendimiento

| ID | Requisito | Métrica |
|---|---|---|
| RNF-PER-01 | Tiempo de inicio de app | < 3 segundos en dispositivos de gama media (2024+) |
| RNF-PER-02 | Tiempo de carga de lección | < 2 segundos (assets precargados) |
| RNF-PER-03 | Latencia de respuesta a interacción | < 100ms para feedback táctil |
| RNF-PER-04 | Consumo de batería | < 5% por hora de uso continuo |
| RNF-PER-05 | Uso de memoria RAM | < 300MB en foreground |

### 7.2 Seguridad y Privacidad

| ID | Requisito | Detalle |
|---|---|---|
| RNF-SEC-01 | Cumplimiento COPPA | No recopilar datos personales más allá de nombre/avatar/edad. Consentimiento parental verificable. |
| RNF-SEC-02 | Cumplimiento GDPR-K | Para usuarios en UE/EEA. Derecho al olvido, portabilidad de datos. |
| RNF-SEC-03 | Encriptación | TLS 1.3 en tránsito. AES-256 para datos sensibles en reposo. |
| RNF-SEC-04 | No publicidad de terceros | Prohibido totalmente en MVP. |
| RNF-SEC-05 | Moderación de contenido | Todo contenido precargado y revisado. Sin UGC en MVP. |
| RNF-SEC-06 | Autenticación segura | OAuth 2.0 + JWT con expiración de 30 días. Refresh tokens. |
| RNF-SEC-07 | Protección anti-tampering | Cert pinning. Detección de root/jailbreak (advertencia, no bloqueo drástico). |

### 7.3 Disponibilidad y Escalabilidad

| ID | Requisito | Detalle |
|---|---|---|
| RNF-AVA-01 | Uptime objetivo | 99.9% (máximo 43 min de downtime mensual) |
| RNF-AVA-02 | Degradación graceful | Si backend cae, app funciona en modo offline con contenido ya descargado. |
| RNF-AVA-03 | Escalabilidad | Arquitectura serverless/auto-scaling para soportar 10x picos de tráfico. |
| RNF-AVA-04 | Backups | Backups diarios automatizados. Retención de 30 días. |

### 7.4 Compatibilidad

| ID | Requisito | Detalle |
|---|---|---|
| RNF-COM-01 | Android | API 26+ (Android 8.0). Soporte tablets y teléfonos. |
| RNF-COM-02 | iOS | iOS 14+. Soporte iPhone y iPad. |
| RNF-COM-03 | Tamaños de pantalla | Responsive desde 4.7" hasta 12.9". Optimizado para tablets (uso principal). |
| RNF-COM-04 | Accesibilidad | Soporte TalkBack (Android) y VoiceOver (iOS). Contraste WCAG 2.1 AA. Tamaño de texto ajustable. |
| RNF-COM-05 | Idiomas | App en español e inglés. Contenido educativo en español (MVP), inglés (Fase 2). |

### 7.5 Usabilidad

| ID | Requisito | Detalle |
|---|---|---|
| RNF-UX-01 | Sin texto para niños | Interfaz del niño 100% iconográfica y por audio. Sin lectura obligatoria. |
| RNF-UX-02 | Zonas táctiles | Mínimo 48x48dp para botones. Áreas de arrastrar > 80x80dp. |
| RNF-UX-03 | Feedback multisensorial | Audio + vibración suave + animación para cada interacción correcta. |
| RNF-UX-04 | Prevención de errores | No hay "game over". Los errores son oportunidad de aprendizaje con hint. |
| RNF-UX-05 | Salida segura | Botón de salida siempre visible para padres (esquina superior con gesto de confirmación). |

---

## 8. Casos de Uso y Flujos

### 8.1 Diagrama de Casos de Uso (Resumen)

```
                    ┌─────────────────────────────────────┐
                    │           SISTEMA WONDERLEARN       │
                    └─────────────────────────────────────┘
                                     │
        ┌────────────────────────────┼────────────────────────────┐
        │                            │                            │
   ┌────▼────┐                  ┌────▼────┐                  ┌────▼────┐
   │  PADRE  │                  │  NIÑO   │                  │ BACKEND │
   └────┬────┘                  └────┬────┘                  └────┬────┘
        │                            │                            │
   • Crear cuenta              • Seleccionar perfil          • Autenticar
   • Crear perfil niño         • Elegir lección              • Servir contenido
   • Ver progreso              • Completar actividad         • Registrar eventos
   • Configurar límites         • Recibir recompensa          • Adaptar dificultad
   • Recibir reportes          • Jugar con mascota           • Sincronizar offline
   • Gestionar contenido       • Explorar mapa               • Enviar emails
```

### 8.2 Flujo Principal: Primera sesión de aprendizaje

```
1. Padre abre app → Onboarding (3 pasos) → Crea perfil de Lucas (5 años, avatar dragón)
2. App presenta mapa de aprendizaje → Zona "Bosque de Letras" → Nivel 1 (Letra A)
3. Lucas toca Nivel 1 → Carga lección de fonética (< 2s)
4. App muestra letra "A" con animación y audio "¡Aaaa!"
5. Lucas toca la palabra "Árbol" → Audio "Árbol" + animación del árbol
6. Actividad: Arrastrar letra "A" a 3 objetos que empiezan con A
7. Lucas acierta 2/3 → Mascota celebra → 2 estrellas → Insignia "¡Primera lección!"
8. App sugiere siguiente nivel (Letra B) o volver al mapa
9. Lucas juega 12 minutos → Notificación "Quedan 5 minutos" (si límite configurado)
10. Lucas cierra app → Progreso sincronizado → Padre recibe notificación push
```

### 8.3 Flujo: Panel de Padres — Revisión de progreso

```
1. Padre toca ícono de padres (esquina superior) → Ingresa PIN
2. Dashboard muestra: Tiempo hoy: 18 min | Lecciones: 3 | Nuevas palabras: 5
3. Padre toca "WonderBooks" → Detalle: Letras A, B, C dominadas. D en progreso.
4. Padre toca "Configuración" → Cambia límite diario de 30 a 45 min
5. Padre activa "Reportes semanales" → Email confirmación
6. Padre cierra panel → Vuelve a pantalla de selección de perfil
```

### 8.4 Flujo: Modo Offline

```
1. Lucas está en coche sin Wi-Fi → Abre app
2. App detecta sin conexión → Muestra contenido pre-descargado
3. Lucas completa 2 lecciones de matemáticas → Progreso guardado localmente (SQLite)
4. Lucas llega a casa, Wi-Fi reconecta → App sincroniza en background
5. Padre recibe notificación: "¡Progreso de Lucas sincronizado! 2 lecciones nuevas."
```

---

## 9. Especificaciones Técnicas

### 9.1 Arquitectura General

```
┌─────────────────────────────────────────────────────────────────────┐
│                         CLIENTE MÓVIL                                │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐            │
│  │   Flutter    │  │  SQLite      │  │  SharedPref  │            │
│  │   (UI/UX)    │  │  (Offline)   │  │  (Settings)  │            │
│  └──────┬───────┘  └──────────────┘  └──────────────┘            │
│         │                                                           │
│  ┌──────▼───────┐                                                   │
│  │  State Mgmt  │  (Riverpod / Bloc)                                │
│  │  Audio Eng   │  (just_audio / audioplayers)                      │
│  │  Animations  │  (Rive / Lottie)                                  │
│  └──────┬───────┘                                                   │
└─────────┼───────────────────────────────────────────────────────────┘
          │ HTTPS / REST + WebSocket
┌─────────▼───────────────────────────────────────────────────────────┐
│                         API GATEWAY                                 │
│                    (AWS API Gateway / Cloudflare)                   │
└─────────┬───────────────────────────────────────────────────────────┘
          │
┌─────────▼───────────────────────────────────────────────────────────┐
│                         BACKEND                                     │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐              │
│  │  Node.js     │  │  PostgreSQL  │  │    Redis     │              │
│  │  (NestJS)    │  │  (Datos)     │  │   (Caché)    │              │
│  └──────┬───────┘  └──────────────┘  └──────────────┘              │
│         │                                                           │
│  ┌──────▼───────┐  ┌──────────────┐  ┌──────────────┐              │
│  │  Auth Svc    │  │  Content Svc │  │  Analytics   │              │
│  │  (Firebase   │  │  (CMS head- │  │  (Segment/   │              │
│  │   Auth)      │  │   less)      │  │   Amplitude) │              │
│  └──────────────┘  └──────────────┘  └──────────────┘              │
└─────────────────────────────────────────────────────────────────────┘
          │
┌─────────▼───────────────────────────────────────────────────────────┐
│                    INFRAESTRUCTURA / DEVOPS                         │
│  • AWS / GCP / DigitalOcean                                         │
│  • Docker + Kubernetes (EKS/GKE)                                    │
│  • CI/CD: GitHub Actions                                            │
│  • CDN: Cloudflare (assets estáticos)                               │
│  • Monitoring: Datadog / Sentry                                       │
└─────────────────────────────────────────────────────────────────────┘
```

### 9.2 Modelo de Datos (Simplificado)

#### Entidad: User (Padre)
```json
{
  "id": "uuid",
  "email": "string (encrypted)",
  "auth_provider": "email|google|apple",
  "created_at": "timestamp",
  "updated_at": "timestamp",
  "email_verified": "boolean",
  "marketing_consent": "boolean",
  "subscription_tier": "free|premium_family|premium_school"
}
```

#### Entidad: ChildProfile
```json
{
  "id": "uuid",
  "parent_id": "uuid (FK)",
  "name": "string (encrypted)",
  "age": "integer (2-8)",
  "avatar_type": "dragon|cat|robot",
  "avatar_customization": "json",
  "level_global": "integer (1-20)",
  "daily_time_limit": "integer (minutes)",
  "created_at": "timestamp",
  "learning_path": "json (current_node, completed_nodes)"
}
```

#### Entidad: LessonProgress
```json
{
  "id": "uuid",
  "child_id": "uuid (FK)",
  "module": "wonderbooks|wondermath|wondergrow",
  "lesson_id": "string",
  "status": "started|completed|abandoned",
  "score": "integer (0-3 stars)",
  "attempts": "integer",
  "time_spent_seconds": "integer",
  "completed_at": "timestamp|null",
  "device_sync_status": "synced|pending"
}
```

#### Entidad: SkillTracking
```json
{
  "id": "uuid",
  "child_id": "uuid (FK)",
  "skill_name": "phonics_A|counting_1_10|addition_simple|emotion_happy",
  "mastery_level": "novice|developing|proficient|mastered",
  "consecutive_successes": "integer",
  "consecutive_failures": "integer",
  "last_practiced": "timestamp"
}
```

### 9.3 API Endpoints (Core)

| Método | Endpoint | Descripción | Auth |
|---|---|---|---|
| POST | /api/v1/auth/register | Registro de padre | Público |
| POST | /api/v1/auth/login | Login | Público |
| POST | /api/v1/auth/refresh | Refresh token | Refresh Token |
| POST | /api/v1/children | Crear perfil de niño | Bearer |
| GET | /api/v1/children/:id/progress | Progreso completo | Bearer |
| GET | /api/v1/content/lessons | Listar lecciones disponibles | Bearer |
| GET | /api/v1/content/lessons/:id | Detalle de lección (assets URLs) | Bearer |
| POST | /api/v1/progress/events | Registrar evento de lección | Bearer |
| POST | /api/v1/progress/sync | Sincronización batch offline | Bearer |
| GET | /api/v1/parents/dashboard | Dashboard de padre | Bearer |
| PATCH | /api/v1/parents/settings | Actualizar configuraciones | Bearer |

### 9.4 Assets y Media

| Tipo | Formato | Especificaciones | Hosting |
|---|---|---|---|
| Ilustraciones | PNG/WebP | 1024x1024, optimizado para retina | CDN |
| Animaciones | Rive (.riv) | < 100KB por archivo | CDN |
| Audio narración | MP3 | 128kbps, mono, < 2MB por lección | CDN |
| Audio efectos | OGG/MP3 | 64kbps, < 50KB cada uno | Bundle local |
| Videos | MP4 (H.264) | 720p, < 5MB por video | CDN |
| Fuentes | TTF/OTF | Open-source (como Nunito, Comic Neue) | Bundle local |

---

## 10. Diseño y UX

### 10.1 Principios de Diseño
1. **Claridad sobre belleza:** Cada pantalla tiene un objetivo de aprendizaje claro.
2. **Feedback inmediato:** Cada acción del niño produce una respuesta en < 100ms.
3. **Progreso visible:** El niño siempre sabe cuánto le queda y qué ha logrado.
4. **Sin dead ends:** Siempre hay una siguiente acción clara.
5. **Accesibilidad primero:** Diseñado para niños con TDAH, dislexia, autismo (colores calmados opcionales, sin temporizadores obligatorios).

### 10.2 Paleta de Colores (MVP)

| Rol | Color | Hex | Uso |
|---|---|---|---|
| Primario | Amarillo sol | #FFD93D | Botones principales, estrellas, celebraciones |
| Secundario | Azul cielo | #6BCB77 | Fondos, áreas seguras, progreso |
| Acento | Coral | #FF6B6B | Errores amigables, hints, corazones |
| Neutro | Crema | #FFF8E1 | Fondos generales |
| Texto | Gris oscuro | #4A4A4A | Texto de padres (nunca para niños) |

### 10.3 Tipografía
- **Niños:** Nunito Bold (títulos), Nunito Regular (etiquetas). Tamaño mínimo 24sp.
- **Padres:** Inter Regular (cuerpo), Inter SemiBold (títulos). Tamaño 16sp.

### 10.4 Componentes UI Clave

#### Pantalla de Inicio (Niño)
- Fondo animado sutil (nubes moviéndose).
- Avatar del niño grande y central con su nombre.
- Botón "¡Jugar!" grande y pulsante.
- Acceso rápido a última lección ("Continuar").
- Ícono pequeño de padres (esquina superior derecha, requiere gesto de confirmación para evitar toques accidentales).

#### Mapa de Aprendizaje
- Vista isométrica/2.5D de isla.
- Nodos conectados por caminos.
- Nodos completos: color brillante con bandera.
- Nodo actual: pulsante con flecha.
- Nodos futuros: gris con candado.
- Mascota del niño camina/camina animada entre nodos.

#### Lección Interactiva
- Barra de progreso superior (segmentos, no porcentaje).
- Área principal de actividad (ocupa 70% de pantalla).
- Instrucción por audio automático (con botón de repetir).
- Sin texto de instrucción obligatorio para el niño.
- Botón de ayuda (mascota da pista).
- Botón de salida (confirmación: "¿Quieres descansar?").

#### Pantalla de Resultado
- Celebración grande (confeti animado, no real para rendimiento).
- Estrellas ganadas (1-3).
- Mascota con reacción emocional acorde.
- Botón "Siguiente" o "Volver al mapa".
- Insignia nueva si aplica (animación de desbloqueo).

---

## 11. Criterios de Aceptación

### 11.1 Épicas y Historias de Usuario

#### Épica 1: Onboarding y Registro
**US-01:** Como padre, quiero registrarme con mi email para crear una cuenta segura para mi hijo.
- **CA-01.1:** Puedo registrarme con email+contraseña o Google/Apple en < 2 minutos.
- **CA-01.2:** Recibo email de verificación en < 60 segundos.
- **CA-01.3:** Si no verifico email en 24h, la cuenta se marca como "pendiente" pero no se borra.

**US-02:** Como padre, quiero crear el perfil de mi hijo para personalizar su experiencia.
- **CA-02.1:** Puedo ingresar nombre, edad y seleccionar avatar en 3 pasos.
- **CA-02.2:** La edad determina el nivel inicial de contenido (2-3 años: nivel 1, 4-5: nivel 3, 6-8: nivel 6).
- **CA-02.3:** Puedo editar el perfil posteriormente desde el panel de padres.

#### Épica 2: Experiencia de Aprendizaje (Niño)
**US-03:** Como niño, quiero seleccionar mi perfil fácilmente para empezar a jugar.
- **CA-03.1:** Al abrir la app, veo mi avatar grande con mi nombre.
- **CA-03.2:** Al tocar mi avatar, entro directamente al mapa de aprendizaje en < 1 segundo.
- **CA-03.3:** No necesito leer ni escribir contraseñas.

**US-04:** Como niño, quiero completar una lección de fonética para aprender letras jugando.
- **CA-04.1:** Cada lección dura 3-7 minutos.
- **CA-04.2:** Recibo feedback inmediato (audio + animación) por cada interacción.
- **CA-04.3:** Si acierto 3 veces seguidas, la dificulta aumenta sutilmente.
- **CA-04.4:** Si fallo 3 veces, aparece una pista visual (mascota señala la respuesta correcta).
- **CA-04.5:** Al finalizar, veo 1-3 estrellas y mi mascota celebra.

**US-05:** Como niño, quiero leer cuentos interactivos para disfrutar la lectura.
- **CA-05.1:** La narración se sincroniza con palabras resaltadas.
- **CA-05.2:** Puedo tocar personajes/objetos para animaciones divertidas.
- **CA-05.3:** Al final hay 1 pregunta de comprensión con 3 opciones visuales.
- **CA-05.4:** Si respondo correctamente, desbloqueo la siguiente página del cuento o siguiente cuento.

**US-06:** Como niño, quiero jugar con mi mascota para sentirme motivado.
- **CA-06.1:** Mi mascota aparece en todas las pantallas.
- **CA-06.2:** La mascota reacciona a mis aciertos (saltos, sonrisa) y errores (tristeza breve, ánimo).
- **CA-06.3:** Puedo cambiar el color de mi mascota después de completar 5 lecciones.

#### Épica 3: Panel de Padres
**US-07:** Como padre, quiero ver el progreso de mi hijo para entender qué está aprendiendo.
- **CA-07.1:** Dashboard muestra tiempo de uso diario/semanal en gráfico simple.
- **CA-07.2:** Lista de habilidades dominadas con fechas.
- **CA-07.3:** Datos se actualizan en tiempo real (o al sincronizar si offline).
- **CA-07.4:** Puedo filtrar por módulo (lectura, matemáticas, SEL).

**US-08:** Como padre, quiero limitar el tiempo de pantalla para mantener hábitos saludables.
- **CA-08.1:** Puedo configurar límite diario en incrementos de 15 min (15-120 min).
- **CA-08.2:** El niño recibe aviso amigable a los 5 minutos restantes.
- **CA-08.3:** Al alcanzar el límite, aparece pantalla de "descanso" con sugerencia de actividad offline.
- **CA-08.4:** Puedo otorgar 5 min extra de emergencia desde panel sin que el niño lo solicite directamente.

**US-09:** Como padre, quiero recibir reportes semanales para no tener que revisar la app constantemente.
- **CA-09.1:** Recibo email cada domingo a las 9 AM (hora local).
- **CA-09.2:** Email incluye: tiempo total, lecciones completadas, nuevas habilidades, comparación vs. semana anterior.
- **CA-09.3:** Puedo desactivar emails desde configuración.

#### Épica 4: Sistema Adaptativo y Offline
**US-10:** Como niño, quiero que la app se ajuste a mi nivel para no frustrarme ni aburrirme.
- **CA-10.1:** Si acierto 3 seguidas, siguiente lección es 10% más difícil.
- **CA-10.2:** Si fallo 3 seguidas, siguiente lección es 20% más fácil y muestra hint.
- **CA-10.3:** Si toco aleatoriamente la pantalla 5+ veces en 10 segundos, app sugiere pausa o cambio de actividad.

**US-11:** Como niño, quiero usar la app sin internet en el coche o de viaje.
- **CA-11.1:** Contenido de próximas 5 lecciones se descarga automáticamente en Wi-Fi.
- **CA-11.2:** Puedo descargar manualmente cuentos específicos.
- **CA-11.3:** Progreso offline se guarda localmente y sincroniza al reconectar.
- **CA-11.4:** App funciona 100% sin conexión si el contenido está descargado.

---

## 12. Métricas y KPIs

### 12.1 Métricas de Producto (Product Analytics)

| Métrica | Definición | Herramienta | Frecuencia |
|---|---|---|---|
| DAU | Usuarios únicos activos por día | Amplitude | Diaria |
| MAU | Usuarios únicos activos por mes | Amplitude | Mensual |
| DAU/MAU | Ratio de engagement | Calculado | Semanal |
| Sesiones/usuario/día | Promedio de sesiones iniciadas | Amplitude | Diaria |
| Duración promedio de sesión | Tiempo desde inicio hasta cierre | Amplitude | Diaria |
| Retención D1 | % de usuarios que vuelven al día 1 | Amplitude | Diaria |
| Retención D7 | % de usuarios que vuelven al día 7 | Amplitude | Semanal |
| Retención D30 | % de usuarios que vuelven al día 30 | Amplitude | Mensual |
| Churn rate | % de usuarios que dejan de usar | Calculado | Mensual |
| NPS | Net Promoter Score (encuesta padres) | Typeform | Trimestral |

### 12.2 Métricas de Negocio

| Métrica | Definición | Frecuencia |
|---|---|---|
| Tasa de conversión | % free → premium | Mensual |
| ARPU | Ingreso promedio por usuario | Mensual |
| LTV | Valor de vida del cliente | Trimestral |
| CAC | Costo de adquisición de cliente | Mensual |
| MRR | Ingreso recurrente mensual | Mensual |
| Churn revenue | % de ingreso perdido por bajas | Mensual |

### 12.3 Métricas Educativas

| Métrica | Definición | Método | Frecuencia |
|---|---|---|---|
| Tasa de mejora fonética | % niños que mejoran en evaluación pre/post | Evaluación in-app | Por cohorte |
| Dominio de sight words | # palabras con 3 aciertos consecutivos | Tracking automático | Semanal |
| Habilidades matemáticas | Nivel promedio alcanzado en operaciones | Tracking automático | Semanal |
| Satisfacción padres | Encuesta 1-10 | Email post-sesión | Mensual |
| Autonomía | % sesiones iniciadas por niño sin padre | Event tracking | Mensual |

---

## 13. Roadmap de Entregas

### 13.1 Hitos de Desarrollo

| Hito | Fecha | Entregable | Criterio de Éxito |
|---|---|---|---|
| H1 | Mes 1 | Documentación técnica + Diseño UX/UI | Wireframes aprobados, stack definido |
| H2 | Mes 2 | Prototipo navegable (Figma) | Test de usabilidad con 10 niños, 80% completan flujo sin ayuda |
| H3 | Mes 3 | Backend core + Auth + API v1 | Postman collection completa, tests unitarios > 80% cobertura |
| H4 | Mes 4 | App móvil: Onboarding + WonderBooks MVP | 20 lecciones funcionales, narración sincronizada |
| H5 | Mes 5 | App móvil: WonderMath + WonderGrow + Gamificación | 3 módulos completos, sistema de mascota, recompensas |
| H6 | Mes 6 | Panel de Padres + Offline + QA + Beta | 500 familias beta, retención D7 > 60%, < 5 bugs críticos |
| H7 | Mes 7 | Iteración post-beta + Fixes + Optimización | NPS > 50, crash rate < 1% |
| H8 | Mes 8 | Lanzamiento público MVP | 2,000 descargas orgánicas, rating > 4.5 estrellas |

### 13.2 Dependencias Clave

| Dependencia | Bloquea | Mitigación |
|---|---|---|
| Contratación de ilustrador/animador | Mes 2-4 (assets visuales) | Freelancers con portfolio infantil confirmado antes de H1 |
| Grabación de audio profesional | Mes 3-5 (narración) | Estudio de doblaje contratado con 2 semanas de buffer |
| Aprobación legal COPPA/GDPR | Lanzamiento | Abogado especializado contratado desde Mes 1 |
| Backend escalable | Mes 6+ (beta masiva) | Arquitectura serverless desde el inicio |

---

## 14. Riesgos y Mitigaciones

| ID | Riesgo | Probabilidad | Impacto | Mitigación |
|---|---|---|---|---|
| R-01 | Retención baja por falta de engagement | Media | Alto | Invertir en gamificación desde MVP; entrevistas semanales con familias beta |
| R-02 | Problemas de moderación de contenido | Baja | Crítico | Zero UGC en MVP; todo contenido pre-aprobado por equipo educativo |
| R-03 | Saturación del mercado EdTech | Alta | Medio | Diferenciación por integración holística + SEL + ética freemium |
| R-04 | Costos de producción de contenido altos | Media | Medio | Pipeline de producción eficiente; reutilización de assets; herramientas internas de authoring |
| R-05 | Cumplimiento legal complejo (COPPA/GDPR) | Media | Crítico | Asesoría legal desde Mes 1; políticas de privacidad por defecto; mínima recolección de datos |
| R-06 | Dependencia de tiendas de apps (Apple/Google) | Media | Medio | Cumplimiento estricto de guidelines; relación con managers de cuenta; diversificación a web (Fase 4) |
| R-07 | Escalabilidad técnica en beta masiva | Media | Alto | Arquitectura cloud-native desde el inicio; load testing antes de H6 |
| R-08 | Dificultad para monetizar sin alienar usuarios | Media | Alto | Freemium generoso; valor premium claro; sin dark patterns; transparencia total |

---

## 15. Glosario

| Término | Definición |
|---|---|
| **MVP** | Minimum Viable Product — Producto mínimo viable para validar mercado. |
| **SEL** | Social Emotional Learning — Aprendizaje socioemocional. |
| **MAU** | Monthly Active Users — Usuarios activos mensuales. |
| **DAU** | Daily Active Users — Usuarios activos diarios. |
| **LTV** | Lifetime Value — Valor de vida del cliente. |
| **CAC** | Customer Acquisition Cost — Costo de adquisición de cliente. |
| **MRR** | Monthly Recurring Revenue — Ingreso recurrente mensual. |
| **ARPU** | Average Revenue Per User — Ingreso promedio por usuario. |
| **COPPA** | Children's Online Privacy Protection Act — Ley de protección de menores en EE.UU. |
| **GDPR-K** | General Data Protection Regulation for Kids — Regulación europea de datos para menores. |
| **TTS** | Text-to-Speech — Texto a voz. |
| **AR** | Augmented Reality — Realidad Aumentada. |
| **UGC** | User Generated Content — Contenido generado por usuarios. |
| **NPS** | Net Promoter Score — Métrica de satisfacción y lealtad. |
| **SLA** | Service Level Agreement — Acuerdo de nivel de servicio. |
| **CDN** | Content Delivery Network — Red de distribución de contenido. |
| **WCAG** | Web Content Accessibility Guidelines — Guías de accesibilidad web. |
| **Dark Pattern** | Patrón de diseño manipulativo que engaña al usuario. |

---

## 16. Historial de Cambios

| Versión | Fecha | Autor | Cambios |
|---|---|---|---|
| 0.1 | 2026-06-07 | Strategy Team | Borrador inicial basado en plan maestro |
| 1.2 | 2026-06-08 | Strategy Team | MoSCoW expandido a proyecto completo (Fases 1-4): 94 requisitos clasificados con distribución por fase y reglas de oro |
| 1.1 | 2026-06-08 | Strategy Team | Añadida sección North Star Metric (3.4) y priorización MoSCoW completa (6.9) para alcance del MVP |
| 1.0 | 2026-06-08 | Strategy Team | PRD completo: requisitos funcionales, no funcionales, casos de uso, especificaciones técnicas, criterios de aceptación |

---

## ✅ Checklist de Aprobación

- [ ] Producto / Product Manager
- [ ] Ingeniería / Tech Lead
- [ ] Diseño / UX Lead
- [ ] Legal / Compliance Officer
- [ ] Marketing / Growth Lead
- [ ] Educación / Pedagogical Advisor

---

*Fin del documento. Para dudas o sugerencias, contactar al equipo de Producto.*
