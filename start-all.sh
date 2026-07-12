#!/bin/bash
set -e

echo "=========================================="
echo "  ITERA - Combined Backend Starting"
echo "  Python :8000 | Scala :8080 | Prolog :9000"
echo "=========================================="

# ---- Start Prolog (background) ----
echo "[1/3] Starting Prolog server on port ${PROLOG_PORT:-9000}..."
cd /opt/prolog
swipl -f src/server.pl &
PROLOG_PID=$!
sleep 2

# ---- Start Scala (background) ----
echo "[2/3] Starting Scala server on port ${SCALA_PORT:-8080}..."
cd /opt/scala
rm -f RUNNING_PID
./bin/itera -Dhttp.port=${SCALA_PORT:-8080} -Dhttp.address=0.0.0.0 &
SCALA_PID=$!
sleep 3

# ---- Start Python FastAPI (foreground - Render monitors this) ----
echo "[3/3] Starting Python FastAPI on port ${PYTHON_PORT:-8000}..."
cd /opt/python
exec uvicorn main:app \
    --host 0.0.0.0 \
    --port ${PYTHON_PORT:-8000} \
    --workers 1 \
    --log-level info
