# Project Requirements Matrix

## Functional Requirements (FR)

| ID | Domain | Feature | Description | Microservice | Priority | Status |
|:---|:---|:---|:---|:---|:---|:---|
| **RF-01** | Core | Identity Management | Registration, credential validation, and role assignment. | `core-scala` | Critical | ✅ Completed |
| **RF-02** | Core | Academic Profile | Institution configuration, current cycle, and starting skills. | `core-scala` | Critical | ✅ Completed |
| **RF-03** | Core | Goal Planner | Objective definition, weekly hours, and target dates. | `core-scala` | High | ✅ Completed |
| **RF-04** | Core | Evidence Management | Uploading URLs or files to prove node approval. | `core-scala` | High | ✅ Completed |
| **RF-05** | Core | Reward System | Calculation and assignment of EXP and Badges. | `core-scala` | Medium | ✅ Completed |
| **RF-06** | Market | Job Explorer | UI for searching and filtering tech roles or careers. | `angular-ui` | Critical | ⏳ Pending |
| **RF-07** | Market | Salary Analytics | Interactive graphs of salary averages and demand levels. | `ia-python` | High | ⏳ Pending |
| **RF-08** | Market | Automated Extraction | Scraping bot for LinkedIn/Indeed job offers. | `ia-python` | Critical | ⏳ Pending |
| **RF-09** | Market | Audit Monitor | Admin panel for scraping status, errors, and discards. | `ia-python` | Medium | ⏳ Pending |
| **RF-10** | Intelligence | Profile Match-Score | Vector calculation of student-market compatibility. | `ia-python` | Critical | ⏳ Pending |
| **RF-11** | Intelligence | Feedback & Telemetry | Capturing user interactions/ratings to improve AI. | `ia-python` | Low | ⏳ Pending |
| **RF-12** | Logic | Roadmap Generator | Creation of visual graphs with personalized academic paths. | `logic-prolog` | Critical | ✅ Completed |
| **RF-13** | Logic | Prerequisite Engine | Strict blocking of nodes if dependencies are not met. | `logic-prolog` | Critical | ✅ Completed |
| **RF-14** | Logic | Alternative Routes | Enabling progress via optional nodes (A or B). | `logic-prolog` | High | ✅ Completed |
| **RF-15** | Logic | Dynamic Validation | Automatic course exemption if user has the skill. | `logic-prolog` | High | ✅ Completed |
| **RF-16** | Logic | Time Projection | Estimated weeks calculation based on chosen pace. | `logic-prolog` | Medium | ✅ Completed |
| **RF-17** | Admin | Catalog Management | CRUD panel for Institutions and Progress States. | `core-scala` | Medium | ✅ Completed |
| **RF-18** | UI | Progress Dashboard | General visualization of progress, level, and acquired skills. | `angular-ui` | High | ⏳ Pending |

## Non-Functional Requirements (NFR)

| ID | Category | Technical Description | Tool / Implementation | Status |
|:---|:---|:---|:---|:---|
| **RNF-01** | Architecture | Isolation of logical layers and persistence in containers. | Docker & Docker Compose | ✅ Implemented |
| **RNF-02** | Network | Centralized interception, balancing, and auto-discovery. | Traefik API Gateway | ✅ Implemented |
| **RNF-03** | Persistencia | Use of heterogeneous data models (SQL/NoSQL). | PostgreSQL / MongoDB | 🔄 Partial (SQL done) |
| **RNF-04** | Security | Stateless authentication mechanisms for APIs. | JWT (JSON Web Tokens) | ✅ Implemented |
| **RNF-05** | UI/UX | Guaranteed responsive design for desktop, tablet, and mobile. | Angular / Tailwind CSS | ⏳ Pending |
| **RNF-06** | Rendimiento | Market queries resolved in < 500ms using pre-calculations. | MongoDB Materialized Views | ⏳ Pending |
| **RNF-07** | Asincronismo | Execution of IA models and scraping without blocking UI. | Python Cron / Background Tasks | ⏳ Pending |
| **RNF-08** | Lógica | Separation of inference engine from transactional code. | Prolog Knowledge Base | ✅ Implemented |
| **RNF-09** | Observabilidad | Visual health monitoring of microservice routes. | Traefik Dashboard | ✅ Implemented |
| **RNF-10** | Colaboración | Traceability via agile workflows. | GitHub Projects & PRs | ✅ Active |
| **RNF-11** | Escalabilidad | Universal unique identifiers to prevent collisions. | UUIDs (Postgres & Mongo) | ✅ Implemented |
| **RNF-12** | Integridad | Automatic deletion of obsolete job offers. | MongoDB TTL Indexes | ⏳ Pending |
