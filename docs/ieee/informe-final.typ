#set document(
  title: "Scrum y DevOps aplicado a la mejora del modulo de Ventas en Odoo ERP",
  author: (
    "Sivincha Machaca Saul Andre",
    "Quinonez Delgado Aaron Fernando",
    "Sencia Ale Bryan Daniel",
    "Yauli Merma Diego Raul",
  ),
)

#set page(
  paper: "a4",
  margin: (top: 1.8cm, bottom: 1.8cm, left: 1.7cm, right: 1.7cm),
  columns: 1,
)

#set text(size: 9.5pt, lang: "es")
#set par(justify: true, leading: 0.55em)
#set heading(numbering: "I.A.")
#show heading: set block(above: 0.85em, below: 0.45em)
#show heading.where(level: 1): set text(size: 11pt, weight: "bold")
#show heading.where(level: 2): set text(size: 10pt, weight: "bold")
#show heading.where(level: 3): set text(size: 9.5pt, weight: "bold")
#show figure.caption: set text(size: 8pt)
#show table.cell: set text(size: 8pt)

#let authors = (
  "Sivincha Machaca Saul Andre",
  "Quinonez Delgado Aaron Fernando",
  "Sencia Ale Bryan Daniel",
  "Yauli Merma Diego Raul",
)

#let pending(title, description) = block(
  width: 100%,
  stroke: 0.6pt + rgb("#8f8f8f"),
  radius: 2pt,
  inset: 7pt,
)[
  *#title* \
  #text(size: 8pt, fill: rgb("#555555"))[#description]
]

#let evidence(title, description) = figure(
  pending(title, description),
  caption: [#title],
)

#align(center)[
  #text(size: 16pt, weight: "bold")[Scrum y DevOps aplicado a la mejora del modulo de Ventas en Odoo ERP] \
  #v(0.6em)
  #text(size: 9pt)[Universidad Nacional de San Agustin de Arequipa - Escuela Profesional de Ingenieria de Sistemas] \
  #v(0.4em)
  #text(size: 9pt)[#authors.join(" · ")]
]

#v(1em)

#grid(
  columns: (1fr, 1fr),
  gutter: 1em,
  [
    *Resumen* -- Este documento final consolida la ejecucion completa del proyecto academico desarrollado sobre Odoo ERP. El informe esta orientado a evidenciar el uso de Scrum, la trazabilidad documental del trabajo por sprints, la implementacion tecnica sobre el modulo de Ventas, las practicas DevOps aplicadas y los resultados de aseguramiento de calidad. El contenido sera desarrollado por partes siguiendo la estructura establecida por el equipo.
  ],
  [
    *Palabras clave* -- Scrum, DevOps, Odoo, ERP, GitHub Issues, GitHub Projects, GitHub Actions, Jenkins, Docker Compose, GitHub Pages, QA, trazabilidad documental.
  ],
)

#v(1em)
#set page(columns: 2)

= Introduccion

== Contexto academico del proyecto

#pending("Pendiente de redaccion", "Se desarrollara cuando el equipo defina el texto final de contexto del curso, universidad, hito y objetivo academico.")

== Objetivo general del trabajo

#pending("Pendiente de redaccion", "Debe establecer el objetivo completo del documento final, no solo del Sprint 4.")

== Producto open source seleccionado

#pending("Pendiente de redaccion", "Debe presentar Odoo ERP y justificar su seleccion como producto base.")

== Alcance tecnico y metodologico

#pending("Pendiente de redaccion", "Debe delimitar Ventas, Compras, Scrum, DevOps, QA y carga documental.")

== Organizacion del documento

#pending("Pendiente de redaccion", "Debe explicar como se estructura el informe sin incluir indice renderizado.")

= Evidencia de seleccion y viabilidad del proyecto

== Criterios de seleccion del software

#pending("Pendiente de redaccion", "Debe explicar criterios de dominio, complejidad, licencia, actividad del repositorio y posibilidad de intervencion tecnica.")

== Licencia y viabilidad legal

#pending("Pendiente de redaccion", "Debe sustentar la licencia LGPL-3 y el uso academico del proyecto.")

== Complejidad del repositorio

#pending("Pendiente de redaccion", "Debe explicar por que Odoo y el modulo de Ventas cumplen complejidad suficiente.")

== Modulo principal seleccionado: Ventas

#pending("Pendiente de redaccion", "Debe describir el modulo `sale`, su relevancia y su relacion con el flujo comercial.")

== Modulo complementario analizado: Compras

#pending("Pendiente de redaccion", "Debe explicar que Compras fue analizado como complemento del alcance ERP.")

== Capturas de repositorio, licencia y estructura del proyecto

#evidence("Captura pendiente: repositorio y licencia", "Guardar en `docs/ieee/figures/` la captura del repositorio, licencia y estructura base del proyecto.")

= Marco de trabajo Scrum aplicado

== Roles Scrum del equipo

#pending("Pendiente de redaccion", "Debe listar roles reales por sprint y explicar la reorganizacion del equipo.")

== Product Backlog

#pending("Pendiente de redaccion", "Debe explicar como se formalizo el backlog mediante GitHub Issues.")

== Sprint Backlog

#pending("Pendiente de redaccion", "Debe explicar como se seleccionaron tareas por sprint.")

== Sprint Planning

#pending("Pendiente de redaccion", "Debe documentar como se planifico cada sprint.")

== Daily Scrum y seguimiento

#pending("Pendiente de redaccion", "Debe indicar como se hizo seguimiento y coordinacion.")

== Sprint Review

#pending("Pendiente de redaccion", "Debe describir la revision de entregables al cierre de cada sprint.")

== Sprint Retrospective

#pending("Pendiente de redaccion", "Debe registrar aprendizajes y ajustes por sprint.")

== Definition of Done

#pending("Pendiente de redaccion", "Debe definir condiciones de cierre: issue cerrada, evidencia, prueba, documento y enlace.")

== Evidencias de aplicacion Scrum

#evidence("Captura pendiente: evidencia Scrum", "Capturas del Product Backlog, tablero Kanban, milestones, issues, responsables y estados.")

= Gestion del proyecto en GitHub

== Organizacion del repositorio

#pending("Pendiente de redaccion", "Debe explicar ramas, estructura documental, carpeta `docs/`, GitHub Pages y flujo de PR.")

== Uso de GitHub Issues

#pending("Pendiente de redaccion", "Debe explicar issues como unidad de trabajo y trazabilidad.")

== Uso de GitHub Projects como tablero Kanban

#pending("Pendiente de redaccion", "Debe describir columnas, avance y seguimiento visual.")

== Milestones por sprint e hito

#pending("Pendiente de redaccion", "Debe mostrar como se relacionaron sprints e hitos.")

== Labels y clasificacion de tareas

#pending("Pendiente de redaccion", "Debe describir etiquetas funcionales, QA, DevOps, docs y Scrum.")

== Asignacion de responsables

#pending("Pendiente de redaccion", "Debe explicar distribucion individual de issues.")

== Capturas del tablero, issues, milestones y backlog

#evidence("Captura pendiente: tablero GitHub", "Capturas del Project Kanban, issues por sprint, filtros y milestones.")

= Planificacion general y cronograma

== Cronograma maestro

#pending("Pendiente de redaccion", "Debe sintetizar el cronograma maestro desde Sprint 0 hasta Sprint 4.")

== Distribucion de hitos

#pending("Pendiente de redaccion", "Debe explicar Hito 1, Hito 2 e Hito 3.")

== Fechas de cada sprint

#pending("Pendiente de redaccion", "Debe registrar fechas planificadas y cierre documentado.")

== Objetivos por sprint

#pending("Pendiente de redaccion", "Debe incluir objetivo de Sprint 0, Sprint 1, Sprint 2, Sprint 3 y Sprint 4.")

== Entregables esperados por sprint

#pending("Pendiente de redaccion", "Debe explicar entregables tecnicos, Scrum, QA, DevOps y documentales.")

== Capturas del cronograma y planificacion

#evidence("Captura pendiente: cronograma", "Captura del cronograma maestro y/o pagina GitHub Pages correspondiente.")

= Desarrollo documentado por sprints

== Sprint 0: seleccion, planificacion y viabilidad

=== Objetivo del sprint
#pending("Pendiente de redaccion", "Redactar objetivo especifico del Sprint 0.")

=== Actividades realizadas
#pending("Pendiente de redaccion", "Listar actividades de seleccion, viabilidad, equipo y cronograma.")

=== Roles y responsables
#pending("Pendiente de redaccion", "Identificar responsables documentados del Sprint 0.")

=== Issues asociadas
#pending("Pendiente de redaccion", "Relacionar issues reales o representativas del Sprint 0.")

=== Evidencias documentales y capturas
#evidence("Captura pendiente: Sprint 0", "Capturas de issues, cronograma, seleccion del producto y evidencia inicial.")

=== Resultado del sprint
#pending("Pendiente de redaccion", "Describir resultado cerrado del Sprint 0.")

== Sprint 1: configuracion del entorno y analisis arquitectonico

=== Objetivo del sprint
#pending("Pendiente de redaccion", "Redactar objetivo especifico del Sprint 1.")

=== Actividades realizadas
#pending("Pendiente de redaccion", "Describir entorno, analisis Ventas/Compras, backlog e inicio DevOps.")

=== Roles y responsables
#pending("Pendiente de redaccion", "Registrar liderazgo y asignaciones del Sprint 1.")

=== Issues asociadas
#pending("Pendiente de redaccion", "Relacionar issues del Sprint 1.")

=== Evidencias documentales y capturas
#evidence("Captura pendiente: Sprint 1", "Capturas de entorno, arquitectura, tablero e informe.")

=== Resultado del sprint
#pending("Pendiente de redaccion", "Describir resultado cerrado del Sprint 1.")

== Sprint 2: implementacion inicial e integracion CI/CD

=== Objetivo del sprint
#pending("Pendiente de redaccion", "Redactar objetivo especifico del Sprint 2.")

=== Actividades realizadas
#pending("Pendiente de redaccion", "Describir MVP, pruebas iniciales, workflow y documentacion.")

=== Roles y responsables
#pending("Pendiente de redaccion", "Registrar liderazgo de Aaron y aportes del equipo.")

=== Issues asociadas
#pending("Pendiente de redaccion", "Relacionar issues del Sprint 2.")

=== Evidencias documentales y capturas
#evidence("Captura pendiente: Sprint 2", "Capturas del MVP, GitHub Actions, pruebas y tablero.")

=== Resultado del sprint
#pending("Pendiente de redaccion", "Describir resultado cerrado del Sprint 2.")

== Sprint 3: mejoras, refactorizacion y estabilizacion

=== Objetivo del sprint
#pending("Pendiente de redaccion", "Redactar objetivo especifico del Sprint 3.")

=== Actividades realizadas
#pending("Pendiente de redaccion", "Describir supervisor, aprobacion, limite configurable, QA y artifacts.")

=== Roles y responsables
#pending("Pendiente de redaccion", "Registrar liderazgo de Bryan y aportes tecnicos.")

=== Issues asociadas
#pending("Pendiente de redaccion", "Relacionar issues del Sprint 3.")

=== Evidencias documentales y capturas
#evidence("Captura pendiente: Sprint 3", "Capturas de aprobacion, artifacts, tests y GitHub Pages parcial.")

=== Resultado del sprint
#pending("Pendiente de redaccion", "Describir resultado cerrado del Sprint 3.")

== Sprint 4: cierre profesional, QA final y documentacion

=== Objetivo del sprint
#pending("Pendiente de redaccion", "Redactar objetivo especifico del Sprint 4.")

=== Actividades realizadas
#pending("Pendiente de redaccion", "Describir GitHub Pages, QA final, DevOps, Jenkins, defensa, PR e informe.")

=== Roles y responsables
#pending("Pendiente de redaccion", "Registrar liderazgo de Saul y responsables de issues finales.")

=== Issues asociadas
#pending("Pendiente de redaccion", "Relacionar issues #56, #65, #66, #67, #68, #69, #70 y #33 si corresponde.")

=== Evidencias documentales y capturas
#evidence("Captura pendiente: Sprint 4", "Capturas de portal, dashboard, burndown, PR final, Actions y Jenkins.")

=== Resultado del sprint
#pending("Pendiente de redaccion", "Describir resultado cerrado del Sprint 4.")

= Arquitectura tecnica del producto

== Arquitectura general de Odoo

#pending("Pendiente de redaccion", "Explicar arquitectura modular de Odoo con cita oficial.")

== Modulo de Ventas

#pending("Pendiente de redaccion", "Explicar el modulo `sale` y su papel en el flujo comercial.")

== Modulo de Compras

#pending("Pendiente de redaccion", "Explicar el uso de Compras como analisis complementario.")

== Addon personalizado

#pending("Pendiente de redaccion", "Describir `validacion_descuento_maximo`.")

== Estructura de archivos modificados

#pending("Pendiente de redaccion", "Listar modelos, vistas, seguridad, tests y manifest.")

== Flujo funcional implementado

#pending("Pendiente de redaccion", "Explicar descuento, revision, aprobacion y confirmacion.")

== Capturas de estructura, codigo y vistas

#evidence("Captura pendiente: arquitectura tecnica", "Capturas de estructura del addon, vistas y fragmentos clave.")

= Implementacion funcional

== Validacion de descuento maximo
#pending("Pendiente de redaccion", "Explicar regla de negocio.")

== Estado requires_review
#pending("Pendiente de redaccion", "Explicar estado de revision.")

== Grupo Supervisor de Descuentos
#pending("Pendiente de redaccion", "Explicar permiso y seguridad.")

== Boton de aprobacion
#pending("Pendiente de redaccion", "Explicar accion visible y flujo.")

== Limite configurable
#pending("Pendiente de redaccion", "Explicar parametro en configuracion.")

== Vistas XML
#pending("Pendiente de redaccion", "Explicar integracion de interfaz.")

== Evidencias visuales del flujo en Odoo
#evidence("Captura pendiente: flujo Odoo", "Capturas del flujo funcional completo en Odoo.")

= DevOps y automatizacion

== Docker Compose
#pending("Pendiente de redaccion", "Explicar entorno reproducible Odoo + PostgreSQL.")

== GitHub Actions
#pending("Pendiente de redaccion", "Explicar workflow, pruebas y artifacts.")

== Ejecucion automatizada de pruebas
#pending("Pendiente de redaccion", "Explicar pruebas automatizadas ejecutadas en CI.")

== Artifacts y logs
#pending("Pendiente de redaccion", "Explicar evidencia descargable o logs del pipeline.")

== Jenkins como validacion complementaria
#pending("Pendiente de redaccion", "Explicar Jenkins solo cuando se implemente o como trabajo en ejecucion.")

== GitHub Pages como publicacion documental
#pending("Pendiente de redaccion", "Explicar portal publico y carga documental.")

== Capturas de pipelines, artifacts y publicacion
#evidence("Captura pendiente: DevOps", "Capturas de Actions, artifacts, Jenkins, Docker Compose y Pages.")

= Aseguramiento de calidad

== Estrategia de QA
#pending("Pendiente de redaccion", "Explicar enfoque de pruebas funcionales y automatizadas.")

== Casos de prueba
#pending("Pendiente de redaccion", "Listar escenarios principales.")

== Pruebas funcionales
#pending("Pendiente de redaccion", "Explicar pruebas en Odoo.")

== Pruebas de roles y permisos
#pending("Pendiente de redaccion", "Explicar supervisor/no supervisor.")

== Pruebas de configuracion
#pending("Pendiente de redaccion", "Explicar limite configurable.")

== Resultados de QA
#pending("Pendiente de redaccion", "Registrar resultados y estado final.")

== Capturas de pruebas y resultados
#evidence("Captura pendiente: QA", "Capturas de pruebas, logs y evidencia funcional.")

= Trazabilidad del proyecto

== Relacion entre sprints, issues y entregables
#pending("Pendiente de redaccion", "Construir matriz sprint-issue-entregable.")

== Relacion entre responsables y tareas
#pending("Pendiente de redaccion", "Construir matriz responsable-issue-resultado.")

== Relacion entre commits y funcionalidades
#pending("Pendiente de redaccion", "Vincular commits relevantes con funcionalidad.")

== Relacion entre pruebas y criterios de aceptacion
#pending("Pendiente de redaccion", "Vincular QA con criterios.")

== Matriz de trazabilidad completa
#pending("Pendiente de redaccion", "Agregar matriz final compacta.")

= Metricas y seguimiento Scrum

== Issues creadas por sprint
#pending("Pendiente de redaccion", "Agregar tabla/grafico resumido.")

== Issues cerradas por sprint
#pending("Pendiente de redaccion", "Agregar tabla/grafico resumido.")

== Issues aceptadas por integrante
#pending("Pendiente de redaccion", "Agregar distribucion por integrante.")

== Burndown del proyecto
#pending("Pendiente de redaccion", "Explicar burndown general.")

== Avance acumulado
#pending("Pendiente de redaccion", "Explicar progreso de Sprint 0 a Sprint 4.")

== Dashboard de evidencias
#pending("Pendiente de redaccion", "Vincular GitHub Pages y graficos.")

== Capturas de graficos y metricas
#evidence("Captura pendiente: metricas Scrum", "Capturas del dashboard, burndown y graficos por sprint.")

= Resultados del proyecto

== Resultados funcionales
#pending("Pendiente de redaccion", "Describir resultado del producto.")

== Resultados metodologicos Scrum
#pending("Pendiente de redaccion", "Describir evidencia Scrum.")

== Resultados DevOps
#pending("Pendiente de redaccion", "Describir pipelines, compose, artifacts y pages.")

== Resultados documentales
#pending("Pendiente de redaccion", "Describir portal, informe IEEE y anexos.")

== Cumplimiento de hitos
#pending("Pendiente de redaccion", "Describir cierre de Hito 1, Hito 2 e Hito 3.")

== Estado final del producto
#pending("Pendiente de redaccion", "Describir estado final antes de defensa.")

= Discusion

== Decisiones tecnicas relevantes
#pending("Pendiente de redaccion", "Explicar decisiones clave del flujo de descuentos.")

== Problemas encontrados
#pending("Pendiente de redaccion", "Documentar problemas tecnicos y de gestion.")

== Riesgos gestionados
#pending("Pendiente de redaccion", "Documentar riesgos de integracion, pruebas y evidencias.")

== Limitaciones del proyecto
#pending("Pendiente de redaccion", "Delimitar lo no implementado.")

== Lecciones aprendidas
#pending("Pendiente de redaccion", "Registrar aprendizajes Scrum, DevOps y Odoo.")

= Conclusiones

== Conclusiones sobre el producto
#pending("Pendiente de redaccion", "Redactar conclusion funcional.")

== Conclusiones sobre Scrum
#pending("Pendiente de redaccion", "Redactar conclusion metodologica.")

== Conclusiones sobre DevOps
#pending("Pendiente de redaccion", "Redactar conclusion DevOps.")

== Conclusiones sobre QA
#pending("Pendiente de redaccion", "Redactar conclusion QA.")

== Trabajo futuro
#pending("Pendiente de redaccion", "Incluir mejoras posteriores y automatizaciones pendientes.")

= Referencias

#bibliography("references.bib", style: "ieee")

= Anexos

== Anexo A. Capturas completas del Product Backlog
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo B. Capturas del tablero Kanban
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo C. Capturas de milestones
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo D. Capturas de issues por sprint
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo E. Capturas de pull requests
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo F. Capturas de commits relevantes
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo G. Capturas de GitHub Actions
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo H. Capturas de Jenkins
#pending("Pendiente documental", "Insertar capturas finales si Jenkins queda implementado.")

== Anexo I. Capturas de Docker Compose
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo J. Capturas de GitHub Pages
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo K. Capturas del flujo funcional en Odoo
#pending("Pendiente documental", "Insertar capturas finales.")

== Anexo L. Matriz completa de trazabilidad
#pending("Pendiente documental", "Insertar matriz completa.")
