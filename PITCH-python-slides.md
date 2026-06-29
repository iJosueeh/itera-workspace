# ITERA — Guion Python (Kenny Sthiven)

## Slide 7 — Inteligencia de Mercado

Este servicio está hecho con Python 3.11 y FastAPI. Es el que trae datos reales del mercado laboral a la plataforma.

Tiene 26 endpoints. Los más importantes son: scraping de ofertas, consulta de ofertas con filtros, match score entre estudiante y mercado, métricas de salarios y tendencias, y registro de telemetría y feedback de usuarios.

El scraping funciona con dos fuentes. Para LinkedIn usamos Playwright, que automatiza un navegador Chrome sin interfaz gráfica: busca empleos, hace scroll para cargar resultados y extrae los datos. Para Computrabajo usamos BeautifulSoup, que es más liviano porque la página no necesita JavaScript.

Cada oferta scrapeada pasa por un proceso de enriquecimiento: se extraen las habilidades requeridas, se clasifica en una de 17 categorías profesionales y se asigna un ranking a la empresa. Todo se guarda en MongoDB.

El match score compara las habilidades del estudiante contra las que pide el mercado. Usa coincidencia por sinónimos —JavaScript es igual a JS— y calcula un porcentaje de compatibilidad. También dice qué habilidades faltan y cuáles son diferenciadoras.

Las métricas de mercado agrupan ofertas por categoría y calculan salarios, skills más demandados, empresas top y tendencias.

## Slide 9 — Organización y Despliegue

El proyecto es un monorepositorio con 4 microservicios. Cada uno tiene su propio Dockerfile y su configuración independiente.

Todo se orquesta con Docker Compose. Traefik funciona como entrada única en el puerto 80 y redirige según el prefijo de la URL: `/api/ia` va a Python, `/api/core` a Scala, `/api/logic` a Prolog, y todo lo demás al frontend.

Para desarrollo, cada servicio expone su puerto en el host: Angular en 4200, Scala en 8080, Python en 8000, Prolog en 9000 y Traefik dashboard en 8081.

Las variables de entorno como URLs de bases de datos y claves secretas se manejan con un archivo `.env` compartido. Las migraciones de PostgreSQL se manejan con Flyway, que aplica los cambios de esquema automáticamente al arrancar el servicio.
