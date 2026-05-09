# 🐳 Guía Docker - Itera Workspace

Documento de referencia para trabajar con Docker en Itera.

## 📋 Tabla de Contenidos

1. [Requisitos](#requisitos)
2. [Build y Deploy](#build-y-deploy)
3. [Comandos Útiles](#comandos-útiles)
4. [Troubleshooting](#troubleshooting)
5. [Best Practices](#best-practices)

---

## ✅ Requisitos

- **Docker**: 20.10+
- **Docker Compose**: 2.0+

### Instalación

**Windows:**
```bash
# Descargar Docker Desktop desde:
# https://www.docker.com/products/docker-desktop

# Verificar instalación
docker --version
docker-compose --version
```

**Linux:**
```bash
# Debian/Ubuntu
sudo apt-get install docker.io docker-compose

# Verificar
docker --version
docker-compose --version
```

---

## 🚀 Build y Deploy

### Opción 1: Docker Compose (Recomendado)

```bash
# Levantar todos los servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Logs de un servicio específico
docker-compose logs -f backend-scala

# Detener todo
docker-compose down

# Detener y eliminar volúmenes (reset)
docker-compose down -v
```

### Opción 2: Build Individual

```bash
# Frontend Angular
cd itera-angular
docker build -t itera-frontend:latest .
docker run -p 4200:4200 itera-frontend:latest

# Backend Scala
cd Itera
docker build -t itera-scala:latest .
docker run -p 8080:8080 itera-scala:latest

# Backend Python
cd Itera-python
docker build -t itera-python:latest .
docker run -p 8000:8000 itera-python:latest

# Prolog
cd itera-prolog
docker build -t itera-prolog:latest .
docker run -p 9000:9000 itera-prolog:latest
```

### Opción 3: Build con Tags Versionados

```bash
# Build con versión
docker build -t itera-frontend:1.0.0 .
docker build -t itera-scala:1.0.0 .
docker build -t itera-python:1.0.0 .
docker build -t itera-prolog:1.0.0 .

# Push a registry (opcional)
docker push your-registry/itera-frontend:1.0.0
```

---

## 🛠️ Comandos Útiles

### Ver Estado de Contenedores

```bash
# Listar contenedores activos
docker-compose ps

# Ver todas las imágenes
docker images

# Ver volúmenes
docker volume ls

# Ver networks
docker network ls
```

### Ejecutar Comandos en Contenedores

```bash
# Ejecutar comando en contenedor
docker-compose exec backend-scala sbt compile

# Shell interactivo
docker-compose exec frontend sh

# Ver recursos (CPU, memoria)
docker stats
```

### Logs y Debugging

```bash
# Ver últimas 100 líneas
docker-compose logs --tail=100

# Seguir logs en tiempo real
docker-compose logs -f

# Logs con timestamp
docker-compose logs -t

# Filtrar logs por servicio
docker-compose logs backend-python -f

# Guardar logs en archivo
docker-compose logs > logs.txt
```

### Limpiar Recursos

```bash
# Eliminar imágenes no usadas
docker image prune

# Eliminar contenedores parados
docker container prune

# Limpiar volúmenes no usados
docker volume prune

# Limpiar todo (CUIDADO)
docker system prune -a
```

---

## 🔍 Troubleshooting

### ❌ "Address already in use"

```bash
# Encontrar qué proceso usa el puerto
netstat -ano | findstr :4200

# Matar el proceso
taskkill /PID <PID> /F

# O cambiar puerto en docker-compose.yml
# ports:
#   - "4200:4200"  →  - "4201:4200"
```

### ❌ Build falla

```bash
# Limpiar caché de Docker
docker system prune -a

# Rebuild sin caché
docker-compose build --no-cache

# Ver logs detallados del build
docker-compose build --verbose
```

### ❌ Contenedor se reinicia constantemente

```bash
# Ver logs
docker-compose logs backend-scala

# Verificar healthcheck
docker-compose ps  # Ver columna "STATUS"

# Ejecutar comando directamente
docker-compose run backend-scala sbt run
```

### ❌ Red/DNS no funciona

```bash
# Reiniciar Docker
docker-compose down
docker-compose up -d

# Limpiar networks
docker network prune

# Verificar conectividad entre contenedores
docker-compose exec frontend ping backend-scala
```

### ❌ Permiso denegado (Linux)

```bash
# Agregar usuario a grupo docker
sudo usermod -aG docker $USER

# Aplicar cambios
newgrp docker

# Reiniciar Docker daemon
sudo systemctl restart docker
```

### ❌ Espacio en disco insuficiente

```bash
# Ver uso de Docker
docker system df

# Limpiar imágenes no usadas
docker image prune -a

# Reducir tamaño de volúmenes
docker volume prune
```

---

## 💡 Best Practices

### 1. Multi-Stage Builds
✅ Usar multi-stage para reducir tamaño de imágenes

```dockerfile
FROM node:18 as builder
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM node:18-alpine
COPY --from=builder /app/dist .
CMD ["npm", "start"]
```

### 2. .dockerignore
✅ Excluir archivos innecesarios

```
node_modules/
.git
.env
*.log
dist/
build/
```

### 3. Healthchecks
✅ Incluir healthchecks en todos los servicios

```dockerfile
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:8080/health
```

### 4. Usuario No-Root
✅ Ejecutar como usuario sin privilegios

```dockerfile
RUN useradd -m -u 1000 appuser
USER appuser
```

### 5. Variables de Entorno
✅ Usar .env para configuración

```bash
# .env.example
API_URL=http://backend:8080
LOG_LEVEL=info

# docker-compose.yml
environment:
  - API_URL=${API_URL}
  - LOG_LEVEL=${LOG_LEVEL}
```

### 6. Networks
✅ Usar networks personalizadas en Compose

```yaml
networks:
  itera-network:
    driver: bridge
    
services:
  frontend:
    networks:
      - itera-network
```

### 7. Volúmenes
✅ Usar volúmenes para persistencia

```yaml
volumes:
  db-data:
    driver: local
  
services:
  database:
    volumes:
      - db-data:/data
```

### 8. Límites de Recursos
✅ Limitar CPU y memoria

```yaml
services:
  backend:
    deploy:
      resources:
        limits:
          cpus: '1'
          memory: 512M
        reservations:
          cpus: '0.5'
          memory: 256M
```

---

## 📊 Monitoreo

### Ver Estadísticas en Tiempo Real

```bash
docker stats
```

### Inspeccionar Contenedor

```bash
docker inspect <container-id>
```

### Ver Historia de Cambios

```bash
docker history <image-name>
```

---

## 🔐 Seguridad

### Escanear Imágenes por Vulnerabilidades

```bash
# Usar Trivy
docker run aquasec/trivy image itera-frontend:latest

# O usar Snyk
snyk container test itera-frontend:latest
```

### Secrets en Docker

```bash
# Crear secret
echo "my-password" | docker secret create db_password -

# Usar en Compose
secrets:
  db_password:
    external: true
```

---

## 📚 Referencias

- [Docker Docs](https://docs.docker.com/)
- [Docker Compose Docs](https://docs.docker.com/compose/)
- [Best Practices](https://docs.docker.com/develop/dev-best-practices/)
- [Security](https://docs.docker.com/engine/security/)

---

**Última actualización**: Mayo 2026
