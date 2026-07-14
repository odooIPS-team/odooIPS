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
#show figure.caption: set text(size: 8pt)
#show table.cell: set text(size: 8pt)

#let authors = (
  "Sivincha Machaca Saul Andre",
  "Quinonez Delgado Aaron Fernando",
  "Sencia Ale Bryan Daniel",
  "Yauli Merma Diego Raul",
)

#let evidence(title, description) = block(
  width: 100%,
  stroke: 0.6pt + gray,
  radius: 2pt,
  inset: 8pt,
)[
  *#title* \
  #text(size: 8pt, fill: rgb("#555555"))[#description]
]

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
    *Resumen* -- Este documento consolida el trabajo final del curso Ingenieria de Procesos de Software, desarrollado sobre el producto open source Odoo ERP. El proyecto aplico Scrum para planificar, ejecutar y evidenciar cinco sprints, desde la seleccion y viabilidad del producto hasta el cierre documental y la publicacion en GitHub Pages. En el plano tecnico, el equipo trabajo sobre el modulo de Ventas mediante un addon de validacion de descuentos, incorporando estado de revision, rol supervisor, aprobacion y limite configurable. En el plano DevOps, se documenta el uso de Docker Compose, GitHub Actions, evidencias de integracion continua, publicacion documental y la planificacion de Jenkins como validacion complementaria.
  ],
  [
    *Palabras clave* -- Scrum, DevOps, Odoo, ERP, GitHub Actions, Jenkins, Docker Compose, GitHub Pages, aseguramiento de calidad, trazabilidad documental.
  ],
)

#v(1em)
#outline(title: [Indice documental], depth: 2)

#pagebreak()
#set page(columns: 2)

= Introduccion

El proyecto final se desarrollo sobre Odoo ERP, un sistema empresarial open source con arquitectura modular y un ecosistema funcional amplio para gestion comercial, ventas, compras, facturacion y operaciones empresariales @odoo2026. El trabajo tuvo un doble proposito: intervenir tecnicamente un modulo real del producto y demostrar el uso documentado de Scrum y DevOps durante todo el ciclo de vida del proyecto.

El modulo principal seleccionado fue Ventas, debido a su relevancia en el flujo comercial y a la posibilidad de introducir una mejora verificable sobre descuentos maximos. El modulo de Compras se considero como analisis complementario para demostrar comprension del alcance ERP y de la relacion entre procesos empresariales.

Este documento funciona como informe final y carga documental. Por ello, no solo describe el resultado tecnico, sino que tambien consolida evidencias de backlog, issues, milestones, tablero Kanban, commits, pull requests, pruebas, pipelines y publicacion web.

== Objetivo general

Implementar y documentar una mejora funcional sobre Odoo ERP aplicando Scrum y practicas DevOps, con trazabilidad completa desde Sprint 0 hasta Sprint 4 y con evidencias verificables del avance del proyecto.

== Alcance del documento

El informe cubre la seleccion del producto, la planificacion del proyecto, la ejecucion de los sprints, la arquitectura de la solucion, la implementacion tecnica, la automatizacion DevOps, el aseguramiento de calidad, la trazabilidad documental y los resultados finales. Las capturas completas se integran como figuras y anexos para sustentar la ejecucion real del proceso.

= Seleccion y viabilidad del producto

Odoo fue seleccionado por cumplir criterios de dominio conocido, licencia abierta, complejidad suficiente y disponibilidad de modulos empresariales reales. La seleccion permitio trabajar sobre un producto no trivial, con estructura modular y con soporte para extension mediante addons personalizados @odoo2026.

== Criterios de seleccion

#table(
  columns: (1.1fr, 2.1fr),
  inset: 5pt,
  [*Criterio*], [*Evidencia esperada*],
  [Dominio conocido], [ERP/CRM aplicado a procesos comerciales y administrativos.],
  [Licencia], [Uso academico y modificacion sobre base open source.],
  [Complejidad], [Modulo de Ventas y dependencias asociadas con volumen de codigo suficiente.],
  [Viabilidad DevOps], [Ejecucion con Docker Compose, versionamiento en GitHub y automatizacion con CI.],
)

#figure(
  evidence("Figura pendiente: evidencia de seleccion del repositorio", "Captura del repositorio base, licencia, estructura principal y modulo de Ventas."),
  caption: [Evidencia documental de seleccion y viabilidad del producto.]
)

= Marco de trabajo Scrum aplicado

Scrum se utilizo como marco de gestion iterativa para organizar el trabajo en sprints, definir objetivos, asignar responsables, mantener un Product Backlog y cerrar entregables incrementales. La Guia Scrum define el uso de eventos, artefactos y responsabilidades para gestionar productos complejos de forma incremental @scrum2020.

== Roles del equipo

#table(
  columns: (1.1fr, 1.1fr, 2.1fr),
  inset: 4pt,
  [*Integrante*], [*Rol principal documentado*], [*Responsabilidad transversal*],
  [Saul Sivincha], [Scrum Master Sprint 4 / QA], [Gestion de cierre, portal, evidencias, PR final y seguimiento de issues.],
  [Aaron Quinonez], [Producto / Backend / QA], [Validacion funcional, alcance Ventas/Compras y consolidacion tecnica.],
  [Bryan Sencia], [DevOps / Scrum Master Sprint 3], [Pipelines, Docker Compose, artifacts, Jenkinsfile y evidencia de CI.],
  [Diego Yauli], [Scrum / Frontend / Documentacion], [Vistas XML, coordinacion de Sprint 1, documentacion y entregables.],
  [Roydan Apaza], [Lider Sprint 0 / Backend inicial], [Configuracion inicial y MVP antes de la reorganizacion del equipo.],
)

== Artefactos Scrum

El proyecto documenta Product Backlog mediante issues, Sprint Backlog mediante tareas por sprint, incrementos por entregables funcionales y evidencias de cierre mediante GitHub Pages. La trazabilidad entre sprint, issue, responsable, commit y resultado permite sostener que el proceso no fue solo declarativo, sino verificable.

#figure(
  evidence("Figura pendiente: tablero Kanban", "Captura del GitHub Project con columnas de seguimiento y tarjetas del proyecto."),
  caption: [Tablero Kanban usado para seguimiento Scrum.]
)

= Planificacion general del proyecto

El proyecto se organizo en Sprint 0 y cuatro sprints de desarrollo y cierre. El Sprint 0 fijo seleccion, viabilidad y planificacion; los sprints posteriores avanzaron desde entorno y arquitectura hasta implementacion, estabilizacion y cierre profesional.

#table(
  columns: (0.7fr, 1.1fr, 2.2fr),
  inset: 4pt,
  [*Sprint*], [*Fechas*], [*Objetivo final*],
  [Sprint 0], [01 mayo - 13 mayo], [Seleccionar Odoo, definir alcance, equipo, cronograma y viabilidad tecnica.],
  [Sprint 1], [14 mayo - 28 mayo], [Preparar entorno, analizar Ventas/Compras, organizar backlog e iniciar DevOps.],
  [Sprint 2], [29 mayo - 10 junio], [Implementar MVP de validacion de descuento maximo y CI inicial.],
  [Sprint 3], [11 junio - 26 junio], [Evolucionar el flujo con supervisor, aprobacion, limite configurable y artifact.],
  [Sprint 4], [27 junio - 13 julio], [Cerrar el Hito 3 con portal, QA final, DevOps, documentacion y PR final.],
)

#figure(
  evidence("Figura pendiente: cronograma maestro", "Captura de la pagina de cronograma o tabla de hitos del proyecto."),
  caption: [Cronograma maestro y distribucion de hitos.]
)

= Desarrollo documentado por sprints

== Sprint 0: seleccion, viabilidad y planificacion

El Sprint 0 establecio la base del proyecto: seleccion de Odoo, revision de licencia, definicion de equipo, alcance, cronograma e infraestructura inicial. Este sprint funciono como punto de partida metodologico y documental.

#figure(
  evidence("Figura pendiente: issues Sprint 0", "Captura del milestone o filtro de issues correspondiente al Sprint 0."),
  caption: [Evidencia de cierre del Sprint 0.]
)

== Sprint 1: entorno y analisis arquitectonico

El Sprint 1 preparo el entorno de trabajo, reviso la arquitectura del modulo de Ventas, analizo Compras como complemento y formalizo tareas tecnicas iniciales. Tambien consolido evidencias de configuracion local y organizacion del backlog.

#figure(
  evidence("Figura pendiente: evidencias Sprint 1", "Captura de entorno, tablero o informe del Sprint 1."),
  caption: [Evidencia documental del Sprint 1.]
)

== Sprint 2: implementacion inicial e integracion CI/CD

El Sprint 2 produjo el primer incremento funcional del addon `validacion_descuento_maximo`, incorporando validacion de descuento y pruebas iniciales. Tambien se inicio la automatizacion con GitHub Actions para validar el entorno y el comportamiento del modulo @githubactions2026.

#figure(
  evidence("Figura pendiente: GitHub Actions Sprint 2", "Captura de workflow ejecutado y resultado de pruebas iniciales."),
  caption: [Evidencia de integracion continua durante el Sprint 2.]
)

== Sprint 3: mejoras, refactorizacion y estabilizacion

El Sprint 3 evoluciono la funcionalidad hacia un flujo de aprobacion mas completo. Se incorporo el estado `requires_review`, el grupo Supervisor de Descuentos, la aprobacion por rol autorizado, el limite configurable y artifacts de prueba.

#figure(
  evidence("Figura pendiente: flujo de aprobacion Sprint 3", "Captura del pedido de venta retenido para revision y aprobacion."),
  caption: [Evidencia funcional del flujo de aprobacion.]
)

== Sprint 4: cierre profesional y carga documental

El Sprint 4 consolido el cierre del proyecto mediante GitHub Pages, dashboards, burndown, defensa ejecutiva, QA final, documentacion Scrum y preparacion del PR hacia `19.0`. Este sprint tiene naturaleza de validacion, integracion y presentacion del producto completo.

#figure(
  evidence("Figura pendiente: GitHub Pages final", "Captura del portal publicado con dashboard de evidencias y navegacion por sprints."),
  caption: [Evidencia del cierre documental publicado.]
)

= Arquitectura e implementacion tecnica

La solucion se implemento como addon personalizado de Odoo sobre el modulo de Ventas. El flujo intercepta pedidos con descuentos superiores al limite permitido, los marca para revision y permite que un usuario supervisor autorice la continuidad del proceso.

== Componentes implementados

#table(
  columns: (1.1fr, 2.2fr),
  inset: 4pt,
  [*Componente*], [*Funcion dentro del proyecto*],
  [`sale.order`], [Modelo extendido para validar descuentos y controlar el estado de revision.],
  [`requires_review`], [Estado funcional para retener pedidos que exceden el limite permitido.],
  [Supervisor de Descuentos], [Grupo autorizado para aprobar pedidos retenidos.],
  [Vista XML], [Integracion visual de boton de aprobacion y campos de configuracion.],
  [Configuracion de compania], [Parametro para definir el limite maximo de descuento.],
)

= DevOps y automatizacion

Docker Compose se uso para reproducir el entorno Odoo y PostgreSQL, lo que permite ejecutar el sistema de forma controlada durante desarrollo y pruebas @docker2026. GitHub Actions se utilizo como herramienta de integracion continua para validar cambios y producir evidencia automatizada @githubactions2026.

Jenkins se plantea como validacion complementaria para el cierre DevOps. Su funcion dentro del proyecto es ejecutar un pipeline reproducible que valide Docker Compose, pruebas del modulo y generacion de evidencia adicional. No sustituye GitHub Actions; lo complementa como practica DevOps observable @jenkins2026.

#figure(
  evidence("Figura pendiente: Jenkins pipeline", "Captura del pipeline con stages de checkout, compose, test y artifact."),
  caption: [Evidencia planificada de Jenkins como integracion complementaria.]
)

= Aseguramiento de calidad

La estrategia de QA se centro en validar el comportamiento funcional del flujo de descuentos, los permisos del supervisor, la configuracion del limite y la ausencia de regresiones en pruebas automatizadas. Las pruebas deben estar asociadas a criterios de aceptacion y evidencias visibles.

#table(
  columns: (1.2fr, 1.8fr, 1.2fr),
  inset: 4pt,
  [*Escenario*], [*Resultado esperado*], [*Evidencia*],
  [Descuento dentro del limite], [El pedido mantiene el flujo normal.], [Captura Odoo / prueba.],
  [Descuento superior al limite], [El pedido pasa a `requires_review`.], [Captura Odoo / prueba.],
  [Usuario no supervisor], [No puede aprobar descuentos retenidos.], [Prueba de permisos.],
  [Usuario supervisor], [Puede aprobar y continuar el flujo.], [Captura boton / prueba.],
  [Cambio de limite], [El comportamiento se ajusta al parametro configurado.], [Prueba parametrizada.],
)

= Trazabilidad y carga documental

La carga documental se organiza alrededor de capturas y matrices que conectan sprints, issues, responsables, commits, pruebas y entregables. Esta seccion sera completada con figuras reales antes del cierre final del informe.

#table(
  columns: (0.8fr, 1.4fr, 1.8fr),
  inset: 4pt,
  [*Sprint*], [*Evidencia minima*], [*Objetivo de la evidencia*],
  [Sprint 0], [Seleccion, licencia, cronograma, backlog inicial.], [Demostrar viabilidad y planificacion.],
  [Sprint 1], [Entorno, arquitectura, issues, tablero.], [Demostrar arranque tecnico y Scrum.],
  [Sprint 2], [MVP, CI inicial, pruebas, informe.], [Demostrar primer incremento funcional.],
  [Sprint 3], [Aprobacion, permisos, artifacts, QA.], [Demostrar estabilizacion del producto.],
  [Sprint 4], [Pages, burndown, PR final, Jenkins, QA final.], [Demostrar cierre profesional.],
)

= Resultados esperados

El resultado final debe evidenciar un producto funcional sobre Odoo, una metodologia Scrum aplicada con trazabilidad y una capa DevOps capaz de validar el entorno, ejecutar pruebas y publicar evidencia. La documentacion en GitHub Pages y el informe IEEE en Typst funcionan como medios de evaluacion y defensa academica.

= Conclusiones preliminares

El proyecto permite articular practica tecnica y gestion agil sobre un producto real. La mejora del modulo de Ventas aporta un flujo de control comercial verificable, mientras que Scrum, GitHub Projects, GitHub Actions, Docker Compose, Jenkins y GitHub Pages permiten sostener la trazabilidad del trabajo realizado.

= Trabajo pendiente de documentacion

#table(
  columns: (1.2fr, 2.1fr),
  inset: 4pt,
  [*Pendiente*], [*Accion requerida*],
  [Capturas Scrum], [Tomar Product Backlog, tablero Kanban, milestones e issues por sprint.],
  [Capturas producto], [Tomar flujo en Odoo: descuento, revision, aprobacion y configuracion.],
  [Capturas DevOps], [Tomar Actions, artifacts, Docker Compose y Jenkins.],
  [Figuras finales], [Guardar imagenes en `docs/ieee/figures/` y reemplazar placeholders.],
  [Revision final], [Ajustar redaccion, verificar citas y compilar PDF definitivo.],
)

= Referencias

#bibliography("references.bib", style: "ieee")
