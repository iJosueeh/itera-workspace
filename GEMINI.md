# Project Governance & Technical Mandates

This document defines the strict architectural and coding rules for the Itera project. All contributors and AI agents must adhere to these mandates.

## 1. Architectural Mandates

### 1.1 Vertical Slice Architecture (Scala)
- Organize code by features (slices) rather than layers.
- Each slice should contain its own domain logic, infrastructure, and presentation components.
- Shared logic should be minimized and placed in a `shared` or `common` module only when truly universal.

### 1.2 CQRS (Command Query Responsibility Segregation)
- Strictly separate read (Query) and write (Command) operations.
- **Commands**: Encapsulate intent to change state. Should be processed by specific handlers.
- **Queries**: Encapsulate intent to retrieve data. Should be optimized for reading (e.g., direct projection).

### 1.3 Microservices & Gateway
- Services are isolated by domain (Scala for Core, Python for Analytics, Prolog for Rules).
- **Traefik** is the mandatory API Gateway. All client requests must go through it.

## 2. Design Patterns

### 2.1 Singleton
- Use for shared infrastructure components (e.g., Database connection pools, configuration managers).
- In Scala, prefer `object` declarations for singletons.

### 2.2 Factory
- Use for creating complex Domain Entities and Value Objects.
- Ensure validation logic resides within the factory or the entity's constructor.

### 2.3 Builder
- Use for constructing complex Data Transfer Objects (DTOs), configuration objects, or test data.
- Favor immutable builders.

## 3. Coding Standards & Strict Rules

### 3.1 Imports
- **EXACT IMPORTS ONLY**: Never use wildcard imports (e.g., `import itera.domain._`).
- Explicitly list every class or member being imported to improve readability and avoid name collisions.

### 3.2 Build Verification
- **MANDATORY**: A successful build and test execution (e.g., `sbt compile`, `npm run build`) is required after every major change or before finalizing a task.
- Never commit or finalize a change that breaks the build or fails existing tests.

### 3.3 Language-Specific Standards
- **Scala**: Follow functional programming principles. Prefer `ZIO` or `Cats Effect` if introduced.
- **Python**: Adhere to PEP8. Use type hints. Use **MongoDB** for high-volume analytics and scraping data.
- **Angular**: Use Standalone Components and Signals for state management. Use **Tailwind CSS** for styling to ensure responsive design (RNF-05).
- **Prolog**: Maintain logical purity and clear predicate naming. Use for the **Knowledge Base** and roadmap logic (RNF-08).

## 4. Database Governance
- **Flyway** is the mandatory tool for PostgreSQL schema migrations.
- Manual schema changes are forbidden; all changes must be versioned migrations in `Itera/src/main/resources/db/migration/`.
- **MongoDB** will be used for market data and IA telemetry. Use UUIDs to maintain consistency with the SQL layer (RNF-11).
