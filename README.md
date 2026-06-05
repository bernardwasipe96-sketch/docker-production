# Docker in Production Assignment

## Overview
This project demonstrates containerization of a Flask application using 
Docker multi-stage builds, GitHub Actions CI/CD, Trivy security scanning, 
secrets management, and full observability with Prometheus and Grafana.

---

## GHCR Image URL
ghcr.io/bernardwasipe96-sketch/myapp:latest

---

## Image Size Comparison
| Version | Size |
|---|---|
| Assignment 1 (single-stage) | 234MB |
| Assignment 2 (multi-stage)  | 288MB |
| Note | Multi-stage build improves security and layer caching |

---

## Trivy Scan Summary
- Scan run on: June 2026
- Findings: Clean — no critical vulnerabilities found
- Fix applied: Used python:3.11-slim-bookworm as base image to minimize attack surface

---

## Start the Full Stack
```bash
make run
# or
docker compose up --build -d
```

---

## Screenshots
All screenshots are in the `/screenshots` folder:
- part1-multistage.png — Multi-stage build output
- part2-actions.png — GitHub Actions pipeline running
- part2-ghcr.png — Image pushed to GHCR
- part3-scan-before.png — Trivy scan results
- part4-compose.png — All 5 services running
- part4-gitignore.png — .env in gitignore
- part5-stack.png — Full stack docker compose ps
- part5-grafana.png — Grafana dashboard with metrics
- bonus-swarm.png — 3 Swarm replicas with different hostnames
- bonus-alert.png — Prometheus alert firing

---

## Reflection
The hardest part was setting up Docker Swarm and dealing with 
network conflicts between Swarm and Compose. I learned how 
orchestration works, how Prometheus scrapes metrics, and how 
Grafana visualizes them in real time.

## Challenges Faced During the Assignment

This assignment introduced several production-focused Docker concepts that were more complex than basic containerization. One of the main challenges was creating and troubleshooting the multi-stage Docker build. Understanding how to separate the build stage from the runtime stage while keeping the image functional required careful testing and debugging.

Another challenge was configuring Docker Compose with multiple services. Connecting Flask, Redis, PostgreSQL, Prometheus, and Grafana on the same network required attention to service names, environment variables, health checks, and volume mappings. Small configuration mistakes often prevented containers from starting correctly.

Secrets management was also an important learning experience. Replacing hardcoded credentials with environment variables, creating a .env file, adding it to .gitignore, and using a .env.example file helped me understand how sensitive information should be managed securely in production environments.

The Prometheus and Grafana setup was the most challenging section. Learning how Prometheus scrapes metrics from the Flask application, configuring prometheus.yml, connecting Grafana to Prometheus, and building a dashboard required understanding several new monitoring concepts. Troubleshooting health checks and ensuring metrics appeared correctly in Grafana took additional effort.

I also encountered issues while experimenting with Docker Swarm because some Docker Compose features, such as conditional depends_on settings, are not fully supported in Swarm mode. This taught me the importance of understanding compatibility differences between Docker Compose and orchestration platforms.

Overall, this assignment helped me gain practical experience with container security, CI/CD, secrets management, monitoring, observability, and production-ready Docker workflows. The biggest lesson I learned is that running containers in production involves much more than simply building an image; it requires automation, security, monitoring, and reliable deployment practices.
