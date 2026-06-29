# ITERA — Presentación / Pitch

## Curso: Lenguajes de Programación
### Enfoque: Demostración de Prolog, Scala y Python en un sistema real

---

## Paleta de Colores Sugerida

| Color | Hex | Uso |
|-------|-----|-----|
| Fondo oscuro principal | `#0B0E14` | Slides fondo |
| Superficie secundaria | `#141B29` | Cards, contenedores |
| Verde acento (ITERA) | `#2DD4A0` | Títulos, CTA, highlights generales |
| Blanco texto | `#F1F5F9` | Texto corporal |
| Scala Red | `#DC3220` | Badge/icono Scala |
| Python Blue | `#3776AB` | Badge/icono Python |
| Prolog Burgundy | `#8B2252` | Badge/icono Prolog |
| Dorado acento | `#F59E0B` | Highlights secundarios, datos importantes |

**Tipografía sugerida:**
- Títulos: **Inter** (bold, semibold)
- Cuerpo: **Inter** (regular, light)
- Código: **JetBrains Mono** (para snippets en slides técnicas)
- Escala: Títulos 48-36px, subtítulos 28-24px, cuerpo 20-18px, código 16px

---

## Estructura de Diapositivas

---

### Slide 1 — Portada

**Título grande (48px):**
```
ITERA
```

**Subtítulo:**
*Una plataforma de orientación vocacional impulsada por tres lenguajes*

**Badges de lenguajes:**
```
[ Scala ]   [ Python ]   [ Prolog ]
```

**Footer:**
Curso: Lenguajes de Programación — [Nombre del curso/profesor] — [Fecha]

**Notas del presentador:**
"Hoy vamos a mostrarles ITERA: un sistema real, funcionando, que integra tres paradigmas de programación distintos — funcional/POO en Scala, scripting/async en Python, y lógico/declarativo en Prolog — trabajando juntos para resolver un problema concreto."

---

### Slide 2 — El Problema (conectar con la audiencia)

**Headline:**
> Elegir una carrera no debería ser una lotería

**Datos duros (3 columnas con números grandes):**

| 50% | 2x | 5 meses |
|-----|----|---------|
| de estudiantes LATAM abandonan la universidad | es la tasa de desempleo juvenil vs. adultos | tarda una empresa en cubrir un puesto técnico |

**Texto de apoyo:**
Los estudiantes eligen sin datos. Las empresas no encuentran talento. No hay conexión entre lo que se estudia y lo que el mercado necesita.

**Notas del presentador:**
"Este es el problema que atacamos. 1 de cada 2 estudiantes universitarios en LATAM no termina la carrera. No porque no sean capaces — sino porque nadie les dijo cómo conectar lo que estudian con el mundo real."

---

### Slide 3 — La Solución: ITERA

**Headline:**
> ITERA cierra el círculo

**Diagrama conceptual simplificado:**

```
┌─────────────┐     ┌─────────────┐     ┌─────────────┐
│  📊 Datos   │ ──▶ │  🧠 Motor   │ ──▶ │  🎯 Plan    │
│  de Mercado │     │  de Matching│     │  Personal   │
└─────────────┘     └─────────────┘     └─────────────┘
       ▲                                       │
       │                                       ▼
       │                               ┌─────────────┐
       └───────────────────────────────│  ✅ Progreso │
                                       └─────────────┘
```

**Texto:**
- Escaneamos ofertas laborales en tiempo real
- Cruzamos con perfiles de estudiantes
- Generamos rutas de aprendizaje inteligentes
- Ajustamos según su progreso real

**Valor añadido clave:**
**3 lenguajes, un solo propósito**: La diversidad tecnológica no es un capricho — cada lenguaje resuelve lo que mejor sabe hacer.

**Notas del presentador:**
"ITERA no es un test vocacional más. Es un sistema que vive, respira datos reales del mercado laboral, y usa tres lenguajes de programación — cada uno en su elemento — para ofrecer orientación profesional personalizada."

---

### Slide 4 — Arquitectura: Tres Lenguajes, Un Sistema

**Headline:**
> Prolog + Scala + Python trabajando juntos

**Arquitectura visual:**

```
                    ┌──────────────┐
                    │   Usuario    │
                    └──────┬───────┘
                           │
                    ┌──────▼───────┐
                    │   Traefik    │
                    │  API Gateway │
                    └──┬───┬───┬───┘
                       │   │   │
              ┌────────┘   │   └────────┐
              ▼            ▼            ▼
      ┌────────────┐ ┌──────────┐ ┌──────────┐
      │   Scala    │ │  Python  │ │  Prolog  │
      │ Play +     │ │ FastAPI  │ │ HTTP     │
      │ PostgreSQL │ │ + MongoDB│ │ Server   │
      │ Core       │ │ IA +     │ │ Motor    │
      │ Transac.   │ │ Scraping │ │ Lógico   │
      └────────────┘ └──────────┘ └──────────┘
```

**Texto de apoyo:**
Cada microservicio usa el lenguaje más adecuado para su dominio.

**Notas del presentador:**
"En lugar de forzar un solo lenguaje para todo, elegimos el mejor para cada trabajo. Y lo hicimos funcionar como un solo sistema. Veamos por qué cada lenguaje."

---

### Slide 5 — Scala: El Corazón Transaccional

**Badge:** `[ Scala 2.13 + Play Framework ]`

**Headline:**
> Tipos fuertes, efectos controlados, datos consistentes

**Rol en ITERA:**
- Auth, perfiles, metas, evidencias, progreso, rewards
- Base de datos relacional (PostgreSQL)
- APIs REST con CQRS + Vertical Slice Architecture

**Por qué Scala:**
| Necesidad | Por qué Scala |
|-----------|---------------|
| Consistencia de datos | Sistema de tipos estático fuerte — errores en compile-time |
| Concurrencia | Cats Effect 3 — efectos funcionales puros, sin side effects |
| NO pierdo dinero | `Option`, `Either` — no hay null pointer exceptions |
| CQRS fácil | Case classes, pattern matching, inmutabilidad nativa |

**Código de ejemplo (pequeño snippet visual):**
```scala
// Cats Effect + Doobie para SQL
def findStudent(id: StudentId): IO[Option[Student]] =
  sql"SELECT * FROM students WHERE id = $id"
    .query[Student]
    .option
    .transact(xa)
```

**Notas del presentador:**
"El Core transaccional necesita ser ROBUSTO. Los datos de usuarios, progreso, metas — no pueden perderse ni corromperse. Scala con Cats Effect nos da un modelo funcional puro donde los efectos secundarios están explícitos en el tipo. Si una función devuelve `IO`, sabemos que hace algo — si no, es pura. Y Doobie nos da consultas SQL tipadas en compile-time."

---

### Slide 6 — Python: La Inteligencia de Mercado

**Badge:** `[ Python 3.11 + FastAPI ]`

**Headline:**
> Ecosistema rico, async nativo, prototipado rápido

**Rol en ITERA:**
- Web scraping (LinkedIn, Computrabajo) con Playwright
- Análisis de mercado: salarios, tendencias, skills demandados
- Match Score: similitud coseno entre perfil estudiante y mercado
- Taxonomía de habilidades por categoría profesional

**Por qué Python:**
| Necesidad | Por qué Python |
|-----------|----------------|
| Scraping dinámico | Playwright, BeautifulSoup — el mejor ecosistema |
| ML/Analytics | NumPy, cosine similarity — bibliotecas maduras |
| Async HTTP | `httpx.AsyncClient` — miles de requests paralelos |
| Prototipado rápido | Sin compilación, tipado dinámico, REPL |

**Código de ejemplo (pequeño snippet visual):**
```python
async def scrape_linkedin(keyword: str) -> list[JobOffer]:
    async with async_playwright() as p:
        browser = await p.chromium.launch()
        page = await browser.new_page()
        await page.goto(f"https://linkedin.com/jobs/{keyword}")
        return await extract_offers(page)
```

**Notas del presentador:**
"Python brilla donde necesitas moverte rápido y conectar bibliotecas. Scraping con Playwright, análisis con NumPy, API con FastAPI — todo async, todo productivo. Mientras Scala se encarga de los datos críticos, Python procesa miles de ofertas laborales y extrae inteligencia de mercado."

---

### Slide 7 — Prolog: El Cerebro Lógico

**Badge:** `[ SWI-Prolog ]`

**Headline:**
> Reglas declarativas que validan rutas de aprendizaje

**Rol en ITERA:**
- Roadmap generator: encadena cursos por prerrequisitos
- Prerequisite engine: bloquea nodos si dependencias no se cumplen
- Alternative routes: "Puedes tomar A o B, pero necesitas C"
- Time projection: estima semanas según ritmo del estudiante

**Por qué Prolog:**
| Necesidad | Por qué Prolog |
|-----------|----------------|
| Prerrequisitos anidados | Hechos + reglas — modelas la relación, no el algoritmo |
| Validación de rutas | Unificación y backtracking — encuentra caminos automáticamente |
| Alternativas | El motor encuentra TODAS las rutas posibles |
| Mantenibilidad | Agregar un curso = agregar un hecho, no reescribir lógica |

**Código de ejemplo (pequeño snippet visual):**
```prolog
% Hechos: prerrequisitos
prerequisite('Estructurada', 'Intro Programación').
prerequisite('Databases', 'Estructurada').
prerequisite('POO', 'Estructurada').

% Regla: ruta válida
can_take(Course, Taken) :-
    prerequisite(Course, Req),
    member(Req, Taken),
    can_take(Req, Taken).
```

**Notas del presentador:**
"Y aquí está la joya. Para validar prerrequisitos académicos — algo que en código imperativo sería un lío de `if` anidados y grafos — usamos Prolog. En Prolog, TÚ no escribes el algoritmo. Declaras los hechos y las reglas, y el motor encuentra las soluciones. Agregar un nuevo curso: un hecho. Una nueva regla de validación: una línea. Es la definición de 'declarativo' en acción."

---

### Slide 8 — La Integración: Todos Trabajando Juntos

**Headline:**
> No es magia, es una API Gateway bien puesta

**Ejemplo de flujo real:**

```
🧑 Usuario pide un roadmap
       │
       ▼
🌐 Traefik rutea: /api/logic/roadmap
       │
       ▼
🧠 Prolog recibe: "carrera = 'Data Science', ritmo = 'intensivo'"
       │
       ▼
⚙️ Prolog INFIERE: IntroProg → Estructurada → Databases → ML → ...
       │
       ▼
📦 Scala guarda el roadmap en PostgreSQL
       │
       ▼
🐍 Python lo complementa con datos de mercado
       │
       ▼
🎨 Angular lo pinta como mapa interactivo
```

**Texto de apoyo:**
- **Traefik** descubre servicios automáticamente (Docker)
- Cada microservicio se comunica por HTTP/REST
- Cada lenguaje hace lo que mejor sabe hacer

**Notas del presentador:**
"Y la pregunta del millón: ¿cómo conviven? Cada microservicio es independiente, con su propia base de datos, su propio lenguaje. Traefik rutea las requests al servicio correcto. Cuando un estudiante pide un roadmap, Prolog lo genera con inferencia lógica, Scala lo persiste, Python lo enriquece con datos de mercado, y Angular lo dibuja. Cada lenguaje en su elemento."

---

### Slide 9 — Demo en Vivo

**Headline:**
> Veámoslo funcionar

**Checklist de demo:**

| Paso | Acción | Qué se demuestra | Lenguaje |
|------|--------|------------------|----------|
| 1 | Landing + buscar carrera | UI funcionando | Angular |
| 2 | Registro de usuario | Auth + JWT | Scala |
| 3 | Generar roadmap | Motor lógico encadena cursos | **Prolog** |
| 4 | Prerrequisito bloqueado | Prolog valida dependencias | **Prolog** |
| 5 | Ruta alternativa | Prolog backtracking | **Prolog** |
| 6 | Ver ofertas laborales | Scraping live | **Python** |
| 7 | Ver match score | Análisis de mercado | **Python** |
| 8 | Crear meta + evidencia | Transacción consistente | **Scala** |
| 9 | Panel de admin/catálogos | CRUD tipado | **Scala** |

**Notas del presentador — Guión de demo:**

*"Vamos a abrir el navegador y mostrar ITERA en vivo."*

**[Paso 1-2] — Rápido**
*"Buscamos una carrera cualquiera — por ejemplo 'Data Science'. Vemos datos salariales, tendencias."*

**[Paso 3-5] — Aquí se detienen**
*"Ahora generamos un roadmap. Prolog recibe la petición, consulta su base de hechos, y devuelve una secuencia válida de cursos. Vean: 'Introducción a la Programación' → 'Estructurada' → 'Bases de Datos' → 'Machine Learning'. Ahora, si marco que NO tengo 'Estructurada', Prolog backtrackea y busca alternativas. No hay — el prerrequisito es obligatorio. Pero si hay una optativa, Prolog encuentra el camino B."*

**[Paso 6-7]**
*"Pasamos al explorador laboral. Python ya scrapeó ofertas de LinkedIn. Vemos sueldos, skills requeridos. El match score compara mi perfil contra el mercado y me dice qué skills me faltan."*

**[Paso 8]**
*"Creo una meta: 'Terminar SQL en 2 semanas'. Scala valida, guarda en PostgreSQL, calcula EXP y badges. Datos consistentes, sin pérdida."*

**[Cierre demo]**
*"Todo esto — tres lenguajes, tres bases de datos, cuatro servicios — funcionando como un solo producto."*

---

### Slide 10 — Lecciones Aprendidas

**Headline:**
> Lo que nos enseñó cada lenguaje

| Lenguaje | Lección |
|----------|---------|
| **Scala** | Un sistema de tipos fuerte NO frena — acelera. Menos tests, más confianza en compile-time |
| **Python** | La productividad importa. Para prototipado y data, nada le gana |
| **Prolog** | Hay problemas que son declarativos por naturaleza. Forzar imperativo es lucha contra la corriente |
| **Arquitectura** | No elegir UN lenguaje — elegir el MEJOR para cada parte |

**Frase de cierre técnica:**
> *"No hay bala de plata. Hay lenguajes que brillan en dominios específicos. Saber cuándo usar cada uno es la verdadera habilidad."*

**Notas del presentador:**
"La lección más importante de este proyecto: no te cases con un lenguaje. Cada paradigma — funcional en Scala, scripting en Python, lógico en Prolog — tiene fortalezas únicas. Aprender a combinarlos es más poderoso que dominar uno solo."

---

### Slide 11 — Cierre

**Headline:**
> ITERA: Prolog + Scala + Python = Orientación vocacional inteligente

**Repositorio:**
`github.com/iJosueeh/itera-workspace`

**Llamado a la acción:**
*"La próxima vez que elijas un lenguaje para un proyecto — pregúntate: ¿es el mejor para ESTE problema?"*

**QR Code / link al repo**

**Contacto:**
[Opcional: información de contacto]

**Notas del presentador:**
"Hemos visto tres lenguajes, tres paradigmas, un solo producto funcionando. ITERA es la prueba de que la diversidad tecnológica no es complejidad innecesaria — es la respuesta correcta para problemas complejos. Gracias."

---

## Apéndice: Recomendaciones de Diseño Visual

### Layout por slide
- **Slides 1-3, 11**: Full-bleed background oscuro, contenido centrado
- **Slides 4, 8**: Diagramas de arquitectura con conectores entre cajas
- **Slides 5-7**: Split layout — 60% contenido / 40% código o tabla
- **Slide 9**: Lista de pasos con checkboxes; fondo minimalista para que la demo robe la atención

### Paleta extendida para gráficos
| Elemento | Color |
|----------|-------|
| Líneas de conexión (arquitectura) | `#2DD4A0` (verde) con opacidad 60% |
| Badge Scala | `#DC3220` sobre fondo `#1A0C0A` |
| Badge Python | `#3776AB` sobre fondo `#0A1628` |
| Badge Prolog | `#8B2252` sobre fondo `#1A0A12` |
| Números grandes (Slide 2) | `#F59E0B` (dorado) |
| Código | `JetBrains Mono` 14px sobre fondo `#0D1117` |

### Animaciones sugeridas
- **Transiciones**: Fade sutil (no slides animados rebuscados)
- **Aparición de código**: Reveal de izquierda a derecha o fade-in
- **Diagramas**: Aparecer nodo por nodo, con flechas trazándose
- **Badges de lenguajes**: Pequeño glow/acento al color del lenguaje cuando aparece

---

## Resumen de Narrativa para el Pitch Oral (30-40 min)

| Tiempo | Slide | Qué decir |
|--------|-------|-----------|
| 2 min | 1 | Presentación, contexto del curso |
| 3 min | 2 | El problema — conectar con la audiencia |
| 2 min | 3 | ITERA como solución |
| 3 min | 4 | Vista general de la arquitectura |
| 5 min | 5 | Scala — tipos, efectos, robustez |
| 5 min | 6 | Python — scraping, analytics, productividad |
| 5 min | 7 | Prolog — lógica declarativa, prerrequisitos |
| 3 min | 8 | Cómo se integran — Traefik + HTTP |
| 10 min | 9 | **Demo en vivo** (corazón de la presentación) |
| 3 min | 10 | Lecciones aprendidas |
| 2 min | 11 | Cierre y Q&A |

**Total estimado: ~40 minutos + preguntas**
