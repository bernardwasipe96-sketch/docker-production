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