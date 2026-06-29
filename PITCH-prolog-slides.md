# ITERA — Guion Prolog (Kathy)

## Slide 8 — Motor de Inferencia Deductivo

Prolog es el cerebro lógico de ITERA. Recibe los datos del estudiante y, en lugar de usar if y else, usa reglas declarativas para inferir qué cursos puede tomar y en qué orden.

Tiene una base de conocimientos con 8 cursos organizados en 5 categorías. Cada curso tiene prerrequisitos: por ejemplo, no puedes tomar Estructuras de Datos sin antes haber cursado Introducción a la Programación.

El sistema evalúa cada curso y lo clasifica en tres estados:
- **Completado** — si ya lo aprobaste o tienes la habilidad equivalente
- **Disponible** — si cumples todos los prerrequisitos
- **Bloqueado** — si te falta algún prerrequisito

Además, maneja exenciones por habilidades: si ya sabes SQL, te saltas Bases de Datos. Tambien maneja rutas alternativas: si hay un curso equivalente al que te falta, el sistema lo acepta automáticamente.

Prolog también ordena los cursos disponibles según la urgencia del mercado, y estima cuántas semanas te tomaría completar todo según las horas que puedas dedicar y tu ritmo de estudio.

Lo importante es que en Prolog no escribes el algoritmo de búsqueda. Solo declaras los hechos —qué cursos existen, cuáles son sus dependencias— y el motor encuentra las respuestas solo. Si agregas un curso nuevo, solo agregas un hecho. Nunca tocas la lógica.
