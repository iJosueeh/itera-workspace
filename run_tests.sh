#!/bin/bash
# Script to run Scala tests using Docker build stage
docker build --target build -t itera-scala-test ./Itera
docker run --rm itera-scala-test sbt test
