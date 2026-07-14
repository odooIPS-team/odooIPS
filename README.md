

# Proyecto SCRUM y DevOps – Odoo (Módulo Ventas)

![CI Odoo](https://github.com/odooIPS-team/odooIPS/actions/workflows/main.yml/badge.svg)
![License](https://img.shields.io/github/license/odooIPS-team/odooIPS)
![Last Commit](https://img.shields.io/github/last-commit/odooIPS-team/odooIPS)
## 1. Información del Equipo

| Información | Detalle |
| --- | --- |
| **Universidad** | Universidad Nacional de San Agustín (UNSA) |
| **Facultad** | Ingeniería de Producción y Servicios |
| **Escuela Profesional** | Ingeniería de Sistemas |
| **Curso** | Ingeniería y Procesos de Software 2026-A |

---

## 2. Integrantes

| Integrante | Rol |
| --- | --- |
| **Apaza Anahua Roydan** | Integrante |
| **Quiñonez Delgado Aarón Fernando** | Integrante |
| **Sencia Ale Bryan Daniel** | Integrante |
| **Yauli Merma Diego Raul** | Integrante |
| **Sivincha Machaca Saul Andre** | Integrante |

---

## 3. Objetivo del Proyecto

Implementar un proceso de desarrollo de software que integre la metodología ágil **Scrum** con prácticas **DevOps** automatizadas sobre **Odoo**, analizando y ejecutando las fases del ciclo de vida del software mediante la refactorización y mejora del módulo de ventas.

---

## 4. Producto Seleccionado: Odoo

| Característica | Descripción |
| --- | --- |
| **Producto** | Odoo ERP (Community Edition) |
| **Dominio** | ERP / Sistema empresarial |
| **Licencia** | LGPL v3 |
| **Stack Tecnológico** | Python, JavaScript, PostgreSQL, Docker |
| **Módulo Trabajado** | Ventas |

---

## 5. Repositorio del Proyecto

Repositorio oficial del proyecto:

[https://github.com/roydanpe/odooIPS](https://github.com/roydanpe/odooIPS)

---

## 6. Documentación del proyecto

| Documento | Enlace |
| --- | --- |
| Índice de documentación | [Ver documentos](https://odooips-team.github.io/odooIPS/docs/README.html) |
| GitHub Pages | [Ver sitio](https://odooips-team.github.io/odooIPS/) |
| Arquitectura del módulo | [Ver documento](https://odooips-team.github.io/odooIPS/docs/arquitectura-modulo-ventas.html) |
| Reporte de verificación — Sprint 0 | [Ver documento](https://odooips-team.github.io/odooIPS/docs/reporte-verificacion-sprint-0.html) |

---
## 7. CI/CD

**Pipeline oficial:** GitHub Actions (`.github/workflows/main.yml`)
- Último run exitoso: [Ver run](https://github.com/odooIPS-team/odooIPS/actions/runs/29319293929) — 14 de julio de 2026, 03:47 (hora Perú)
- Rama: `19.0` · Duración: 1m 46s
- Artifact de pruebas: `odoo-test-results` (3.08 KB), disponible en el run enlazado arriba, sección Artifacts.

**Pipeline alternativo/local:** `Jenkinsfile`
Este repositorio incluye un `Jenkinsfile` como demostración de un pipeline
equivalente ejecutable localmente con Jenkins. No reemplaza a GitHub Actions,
que sigue siendo el CI oficial. Etapas:
1. Checkout del código
2. Preparación de entorno (verifica Docker/Compose disponibles)
3. Levantamiento del entorno (`docker compose up -d` sobre `docker-config`)
4. Espera de inicialización de Postgres/Odoo
5. Ejecución de pruebas del módulo `validacion_descuento_maximo`
6. Recolección de evidencia (logs archivados como artifact de Jenkins)
7. Limpieza (`docker compose down -v`)
| Cronograma | [Ver documento](https://odooips-team.github.io/odooIPS/docs/cronograma-sprints.html) |
| Informe del Sprint 1 | [Ver informe](https://odooips-team.github.io/odooIPS/docs/sprints/informe-sprint-1.html) |
| Informe del Sprint 2 | [Ver informe](https://odooips-team.github.io/odooIPS/docs/sprints/informe-sprint-2.html) |
| Informe del Sprint 3 | [Ver informe](https://odooips-team.github.io/odooIPS/docs/sprints/informe-sprint-3.html) |
