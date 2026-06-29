# ITERA — Guion Scala (Keny Andre)

## Slide 4 — Arquitectura

ITERA tiene 4 servicios independientes, cada uno con su lenguaje y su base de datos:

- **Angular** — la interfaz del usuario
- **Scala + PostgreSQL** — el core: usuarios, perfiles, progreso, recompensas
- **Python + MongoDB** — scraping, análisis de mercado, match score
- **Prolog** — motor lógico que genera roadmaps de aprendizaje

Se comunican a través de Traefik, un gateway que recibe todo por un solo puerto y redirige según la URL. La persistencia es políglota: PostgreSQL para datos transaccionales que necesitan consistencia fuerte, MongoDB para datos semiestructurados como ofertas de trabajo.

## Slide 6 — Core Transaccional (Scala)

**Stack:** Scala 2.13, Play Framework, Cats Effect 3, Doobie + PostgreSQL, JWT, BCrypt.

**¿Qué hace?** Maneja auth (registro/login con JWT), perfiles de estudiante, metas de estudio, evidencia y aprobación de cursos, y un sistema de recompensas (100 EXP por nodo aprobado, insignias por logros).

**Arquitectura:** CQRS + Vertical Slice. Cada funcionalidad está separada en comandos (escribir) y consultas (leer). Cada feature —auth, perfil, metas, progreso— tiene su propio paquete independiente. No hay un modelo central gigante.

**Seguridad:** Passwords con BCrypt, JWT con HMAC-SHA256 que expira en 24h. Cada endpoint validado contra el token. Circuit Breaker para llamadas a servicios externos: si Python o Prolog fallan 3 veces, se espera un minuto antes de reintentar.
