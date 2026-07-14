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

#let docbox(title, description) = block(
  width: 100%,
  stroke: 0.6pt + rgb("#8f8f8f"),
  radius: 2pt,
  inset: 7pt,
)[
  *#title* \
  #text(size: 8pt, fill: rgb("#555555"))[#description]
]

#let capture(title, description) = figure(
  docbox(title, description),
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
    *Resumen* -- Este documento final consolida la ejecucion completa de un proyecto academico desarrollado sobre Odoo ERP. El trabajo integro Scrum, gestion documental, control de versiones, automatizacion DevOps y aseguramiento de calidad para intervenir el modulo de Ventas mediante una regla de control de descuentos. El proyecto se organizo desde Sprint 0 hasta Sprint 4, con evidencias de backlog, tablero Kanban, milestones, issues, commits, pull requests, pipelines, pruebas y publicacion en GitHub Pages. El resultado principal fue un flujo funcional que detecta descuentos superiores al limite permitido, retiene el pedido en estado `requires_review`, permite aprobacion por supervisor y habilita configuracion del limite por compania. El informe tambien documenta el cierre profesional del proyecto mediante dashboard de evidencias, burndown, defensa ejecutiva, informe final en Typst y planificacion de Jenkins como validacion complementaria.
  ],
  [
    *Palabras clave* -- Scrum, DevOps, Odoo, ERP, GitHub Issues, GitHub Projects, GitHub Actions, Jenkins, Docker Compose, GitHub Pages, QA, trazabilidad documental.
  ],
)

#v(1em)
#set page(columns: 2)

= Introduccion

== Contexto academico del proyecto

El proyecto corresponde al trabajo final del curso Ingenieria de Procesos de Software 2026-A. Su proposito fue aplicar un ciclo completo de gestion y desarrollo sobre un producto open source real, integrando Scrum como marco de trabajo agil y practicas DevOps para versionamiento, automatizacion, pruebas, evidencias y publicacion documental. La actividad exigio que el equipo no solo produzca una modificacion tecnica, sino que demuestre el proceso seguido mediante carga documental verificable.

El producto seleccionado fue Odoo ERP, una plataforma empresarial modular cuyo codigo fuente se mantiene publicamente y permite analisis, extension e integracion de modulos funcionales @odoo2026. La eleccion de un sistema ERP permitio trabajar con una base de codigo amplia, una arquitectura real y procesos de negocio comprensibles para un proyecto academico.

== Objetivo general del trabajo

El objetivo general fue implementar y documentar una mejora funcional en Odoo ERP aplicando Scrum y practicas DevOps de forma trazable. Para cumplirlo, el equipo organizo el trabajo en cinco sprints, gestiono tareas mediante GitHub Issues y GitHub Projects, desarrollo un addon de control de descuentos en Ventas, ejecuto pruebas, preparo evidencia de CI/CD y publico un portal de documentacion en GitHub Pages.

== Producto open source seleccionado

Odoo ERP fue seleccionado por su dominio empresarial, su arquitectura modular y su aplicabilidad a procesos comerciales. El modulo principal de trabajo fue Ventas, debido a que concentra cotizaciones, pedidos, clientes, lineas de venta, confirmacion comercial y facturacion. El modulo de Compras se uso como analisis complementario para mostrar comprension del entorno ERP y de la relacion entre procesos de negocio.

== Alcance tecnico y metodologico

El alcance tecnico se centro en el addon `validacion_descuento_maximo`, que extiende el flujo de pedidos de venta para controlar descuentos superiores a un limite permitido. El alcance metodologico incluyo planificacion Scrum, seguimiento por tablero Kanban, milestones, issues, asignaciones, revisiones por sprint, QA, automatizacion con GitHub Actions, preparacion de Jenkins como validacion complementaria, publicacion en GitHub Pages y elaboracion de este informe en Typst.

== Organizacion del documento

El documento se organiza como informe final y carga documental. Las primeras secciones justifican la seleccion del producto y el marco Scrum aplicado. Luego se describe la gestion en GitHub, la planificacion general, el desarrollo por sprints, la arquitectura tecnica, la implementacion funcional, DevOps, QA, trazabilidad, metricas, resultados, discusion y conclusiones. Los anexos concentran las capturas que sustentan visualmente el avance del proyecto.

= Evidencia de seleccion y viabilidad del proyecto

== Criterios de seleccion del software

La seleccion de Odoo respondio a cinco criterios: dominio conocido, licencia compatible con uso academico, complejidad suficiente, posibilidad de ejecucion local y oportunidad de extension funcional. Estos criterios permitieron trabajar con un producto no trivial, evitar una aplicacion demasiado pequena y sostener evidencias de arquitectura, configuracion, pruebas y despliegue.

#table(
  columns: (1fr, 2fr),
  inset: 4pt,
  [*Criterio*], [*Justificacion aplicada*],
  [Dominio], [ERP/CRM con procesos empresariales reconocibles: Ventas, Compras, clientes, productos y facturacion.],
  [Licencia], [Codigo open source con licencia LGPL-3, adecuada para analisis academico y extension.],
  [Complejidad], [Base modular con multiples addons y volumen de codigo suficiente para analisis tecnico.],
  [Ejecucion], [Soporte para entorno local con Odoo y PostgreSQL mediante Docker Compose.],
  [Extension], [Permite crear addons personalizados sin modificar directamente el nucleo del producto.],
)

== Licencia y viabilidad legal

El proyecto verifico la licencia del repositorio y considero que la LGPL-3 permite estudio, ejecucion, modificacion y uso academico siempre que se respete la naturaleza del software base. Esta revision fue importante porque el trabajo no consistia en crear una aplicacion aislada, sino en intervenir un producto existente manteniendo trazabilidad sobre sus archivos y dependencias.

== Complejidad del repositorio

Odoo presenta una arquitectura modular compuesta por addons, modelos, vistas, seguridad, pruebas y configuracion. Esta estructura permite evidenciar analisis de arquitectura, configuracion de entorno, pruebas automatizadas y extension funcional. El modulo `sale` y sus dependencias superan el nivel de complejidad esperado para un trabajo final, por lo que resultan adecuados para demostrar habilidades de lectura, modificacion y validacion de software existente.

== Modulo principal seleccionado: Ventas

El modulo de Ventas fue seleccionado porque representa un flujo comercial central. Permite trabajar con cotizaciones, pedidos, lineas de venta, descuentos, clientes y confirmacion de operaciones. La mejora elegida se enfoco en controlar descuentos maximos, un problema funcional plausible en un proceso comercial porque descuentos no autorizados pueden afectar margenes y requerir revision de un responsable.

== Modulo complementario analizado: Compras

Compras se considero como modulo complementario para ampliar el analisis ERP. Aunque la implementacion se concentro en Ventas, revisar Compras permitio entender dependencias funcionales, estructura de modulos y consistencia del producto. Esta decision ayudo a delimitar el alcance: Ventas fue el frente de implementacion; Compras fue un frente de revision y documentacion.

== Capturas de repositorio, licencia y estructura del proyecto

#capture("Captura requerida: repositorio, licencia y estructura", "Debe incorporarse una captura del repositorio GitHub, archivo de licencia, carpeta `addons` y modulo `sale` o addon personalizado. Esta evidencia sustenta la seleccion y viabilidad del producto.")

= Marco de trabajo Scrum aplicado

== Roles Scrum del equipo

El equipo asumio roles rotativos y funcionales segun el avance del proyecto. Roydan lidero el Sprint 0 y participo en la configuracion inicial y MVP; posteriormente dejo de participar desde Sprint 3 por reorganizacion del equipo. Diego lidero Sprint 1 y trabajo en documentacion, Scrum y frontend XML. Aaron lidero Sprint 2 y asumio responsabilidades de producto, backend y QA funcional. Bryan fue Scrum Master del Sprint 3 y responsable DevOps. Saul asumio el cierre del Sprint 4 como Scrum Master, consolidando portal, evidencias, PR final e informe.

== Product Backlog

El Product Backlog se formalizo mediante GitHub Issues. Cada issue represento una tarea tecnica, documental, de QA, DevOps o gestion Scrum. Esta decision permitio que el trabajo dejara de depender de acuerdos informales y quedara registrado con responsable, estado, descripcion y evidencia asociada. En la vista de cierre se registraron 43 issues trazadas.

== Sprint Backlog

El Sprint Backlog se construyo seleccionando issues para cada sprint. Sprint 0 se oriento a planificacion y viabilidad; Sprint 1 a entorno y arquitectura; Sprint 2 al MVP y CI inicial; Sprint 3 a aprobacion, seguridad y estabilizacion; Sprint 4 a cierre profesional, QA final, DevOps, GitHub Pages, defensa e integracion.

== Sprint Planning

La planificacion de cada sprint definio objetivo, responsables, entregables esperados y evidencia minima. La planificacion no se limito a una lista de tareas: se relaciono con hitos academicos y con una expectativa de cierre por sprint. Esto permitio justificar el avance ante el docente y mantener trazabilidad entre cronograma, issues y resultados.

== Daily Scrum y seguimiento

El seguimiento se realizo mediante coordinacion del equipo, revision de issues, commits y tablero Kanban. Aunque no todas las reuniones quedaron registradas como actas formales, el seguimiento se evidencio en el cambio de estados, asignaciones, commits, PR e incremento de entregables por sprint. Para efectos documentales, las capturas del Project y de issues funcionan como evidencia de seguimiento.

== Sprint Review

Cada Sprint Review se represento mediante revision de entregables: plan inicial, entorno, MVP, flujo de aprobacion, QA, DevOps y portal final. La revision del Sprint 4 se concentro en verificar que el proyecto pueda defenderse: paginas publicas, dashboard, burndown, defensa ejecutiva, evidencias y PR de integracion.

== Sprint Retrospective

La retrospectiva se refleja en ajustes sucesivos del proceso. El equipo paso de una configuracion inicial y documentacion dispersa a un backlog mas formal, luego a pruebas automatizadas, despues a artifacts y finalmente a un portal publico con dashboard y documento final. La reorganizacion del equipo despues de Sprint 2 tambien obligo a redistribuir responsabilidades y cerrar el trabajo con cuatro integrantes activos.

== Definition of Done

La Definition of Done del proyecto se definio como una combinacion de criterios: issue cerrada, responsable identificado, evidencia documental, cambio versionado, prueba o validacion cuando aplica, enlace en GitHub Pages y trazabilidad hacia el sprint correspondiente. En Sprint 4 se agrego como criterio adicional que los entregables fueran defendibles ante el docente.

== Evidencias de aplicacion Scrum

#capture("Captura requerida: Scrum aplicado", "Debe incluir Product Backlog, tablero Kanban, milestones, issues por sprint, responsables y estados de cierre. Estas capturas demuestran la aplicacion de Scrum y no solo su descripcion textual.")

= Gestion del proyecto en GitHub

== Organizacion del repositorio

El repositorio se organizo sobre la rama base `19.0`, con ramas de feature para cambios especificos y pull requests para integracion. La documentacion academica se reorganizo hacia `docs/`, mientras que el portal publico se mantuvo en archivos Markdown de raiz y layout Jekyll. El cierre del Sprint 4 se trabajo en `feature/sprint4-github-pages`, rama usada para mejorar GitHub Pages, resolver conflictos contra `19.0`, agregar el informe Typst y preparar la entrega final.

== Uso de GitHub Issues

GitHub Issues se utilizo como unidad principal de trabajo. Las issues permitieron registrar tareas de producto, QA, Scrum, DevOps, documentacion, Pages e integracion final. Para Sprint 4 se destacaron issues como portal publico, validacion funcional, QA final, documentacion Scrum, DevOps final, entregables profesionales, insumos finales y PR de cierre.

== Uso de GitHub Projects como tablero Kanban

GitHub Projects funciono como tablero Kanban para visualizar estados y seguimiento. Su uso permitio representar el flujo de trabajo y defender el avance frente al docente. Las columnas y estados del Project permiten demostrar movimiento de tareas desde backlog hasta cierre.

== Milestones por sprint e hito

Los milestones agruparon trabajo por sprint e hito. Esta estructura fue relevante porque el curso evaluo entregas parciales y cierre final. Relacionar issues con milestones facilita demostrar que el avance no fue aislado, sino organizado segun el cronograma maestro.

== Labels y clasificacion de tareas

Las tareas se clasificaron por frente: Scrum, producto, QA, DevOps, documentacion, Pages e integracion. Esta clasificacion permitio distribuir responsabilidades individuales y evitar que todos aparezcan como responsables de la misma tarea. Tambien permitio separar trabajo tecnico de trabajo documental.

== Asignacion de responsables

La asignacion se realizo a una persona por issue cuando fue posible. Esto ayudo a sostener responsabilidad individual. En la vista documental se consolidaron asignaciones aceptadas por integrante: Saul 8, Aaron 9, Bryan 9, Diego 9 y Roydan 3. Roydan no figura desde Sprint 3 por reorganizacion del equipo.

== Capturas del tablero, issues, milestones y backlog

#capture("Captura requerida: gestion en GitHub", "Debe incorporarse el Project Kanban, la lista de milestones, filtros de issues por sprint y asignaciones individuales.")

= Planificacion general y cronograma

== Cronograma maestro

El cronograma maestro organizo el trabajo desde el 1 de mayo hasta el 13 de julio. Se definio un Sprint 0 de planificacion y cuatro sprints de desarrollo, estabilizacion y cierre. Este cronograma permitio vincular el avance con los hitos del curso y justificar la evolucion gradual del proyecto.

== Distribucion de hitos

El Hito 1 se relaciono con seleccion, planificacion y viabilidad. El Hito 2 cubrio implementacion inicial, pruebas y CI. El Hito 3 concentro estabilizacion, cierre, evidencias, QA, DevOps y publicacion documental. Esta distribucion facilito mostrar progreso incremental y no una entrega concentrada al final.

== Fechas de cada sprint

#table(
  columns: (0.7fr, 1.1fr, 2fr),
  inset: 4pt,
  [*Sprint*], [*Fechas*], [*Resultado temporal documentado*],
  [Sprint 0], [01 mayo - 13 mayo], [Concluido con seleccion, alcance y cronograma.],
  [Sprint 1], [14 mayo - 28 mayo], [Concluido con entorno, arquitectura y backlog inicial.],
  [Sprint 2], [29 mayo - 10 junio], [Concluido con MVP y CI inicial.],
  [Sprint 3], [11 junio - 26 junio], [Concluido con flujo de aprobacion y artifact.],
  [Sprint 4], [27 junio - 13 julio], [Concluido con cierre documental y PR final.],
)

== Objetivos por sprint

Sprint 0 busco seleccionar Odoo, definir alcance, equipo, cronograma y viabilidad. Sprint 1 preparo entorno, analizo Ventas/Compras y organizo backlog. Sprint 2 implemento el MVP de validacion de descuento maximo e inicio CI. Sprint 3 evoluciono el flujo con supervisor, aprobacion, limite configurable y artifacts. Sprint 4 cerro el proyecto con GitHub Pages, QA final, DevOps, documentacion, defensa e integracion.

== Entregables esperados por sprint

Los entregables incluyeron plan inicial, cronograma, entorno Docker, analisis tecnico, addon personalizado, pruebas, workflow, artifacts, dashboard de evidencias, burndown, defensa ejecutiva, informe Typst y PR final. Esta combinacion demuestra entregables tecnicos y documentales.

== Capturas del cronograma y planificacion

#capture("Captura requerida: cronograma y planificacion", "Debe agregarse captura del cronograma maestro y de la pagina de sprints del portal.")

= Desarrollo documentado por sprints

== Sprint 0: seleccion, planificacion y viabilidad

=== Objetivo del sprint
Seleccionar el producto open source, validar su viabilidad legal y tecnica, definir el alcance inicial, organizar el equipo y establecer el cronograma maestro.

=== Actividades realizadas
Se reviso el repositorio de Odoo, se identifico el modulo de Ventas como frente principal, se verifico licencia, se definio el equipo, se preparo el cronograma y se inicio la estructura documental del proyecto.

=== Roles y responsables
Roydan Apaza lidero el Sprint 0. Saul apoyo cronograma y backlog inicial; Aaron reviso viabilidad tecnica; Bryan reviso arquitectura y complejidad; Diego gestiono documentacion inicial.

=== Issues asociadas
La vista de cierre documenta cinco tareas cerradas para Sprint 0, orientadas a seleccion, planificacion, cronograma, viabilidad y gestion inicial.

=== Evidencias documentales y capturas
#capture("Captura requerida: Sprint 0", "Capturas de repositorio, licencia, cronograma inicial, issues y tablero.")

=== Resultado del sprint
El sprint cerro con producto seleccionado, alcance definido, equipo organizado, cronograma base y viabilidad tecnica documentada.

== Sprint 1: configuracion del entorno y analisis arquitectonico

=== Objetivo del sprint
Preparar el entorno de trabajo, analizar arquitectura de Ventas y Compras, organizar el backlog tecnico e iniciar practicas DevOps.

=== Actividades realizadas
Se trabajo en configuracion de Odoo y PostgreSQL con Docker Compose, analisis de dependencias del modulo `sale`, revision de vistas XML, organizacion de ramas y formalizacion de issues.

=== Roles y responsables
Diego Yauli fue lider del Sprint 1. Roydan participo en configuracion de entorno; Aaron analizo arquitectura; Bryan apoyo DevOps y evidencias; Saul gestiono backlog e issues.

=== Issues asociadas
El sprint se documento con siete issues cerradas y ocho asignaciones aceptadas, vinculadas a entorno, arquitectura, backlog y soporte DevOps.

=== Evidencias documentales y capturas
#capture("Captura requerida: Sprint 1", "Capturas de Docker Compose, arquitectura de Ventas/Compras, tablero e informe de Sprint 1.")

=== Resultado del sprint
El sprint cerro con base tecnica y organizativa suficiente para iniciar implementacion funcional.

== Sprint 2: implementacion inicial e integracion CI/CD

=== Objetivo del sprint
Implementar la primera version funcional del addon de validacion de descuento maximo e iniciar integracion continua.

=== Actividades realizadas
Se desarrollo el MVP del addon `validacion_descuento_maximo`, se agregaron pruebas funcionales, se integro la interfaz inicial en Ventas y se configuro GitHub Actions para validaciones automatizadas.

=== Roles y responsables
Aaron Quinonez lidero el Sprint 2. Roydan trabajo en backend MVP; Diego integro vistas XML; Bryan preparo GitHub Actions y validacion Docker; Saul consolido QA y evidencias.

=== Issues asociadas
El sprint registro cinco issues cerradas y cinco asignaciones aceptadas, relacionadas con backend, frontend, DevOps, QA y gestion.

=== Evidencias documentales y capturas
#capture("Captura requerida: Sprint 2", "Capturas del MVP, pruebas, workflow de GitHub Actions, issue list y tablero.")

=== Resultado del sprint
El sprint entrego la primera version funcional del control de descuento maximo y una base inicial de CI.

== Sprint 3: mejoras, refactorizacion y estabilizacion

=== Objetivo del sprint
Evolucionar el control de descuentos hacia un flujo de aprobacion parametrizable, estable y validado por pruebas.

=== Actividades realizadas
Se incorporo el estado `requires_review`, el grupo Supervisor de Descuentos, la accion de aprobacion, el limite configurable por compania, pruebas parametrizadas y artifact de resultados.

=== Roles y responsables
Bryan Sencia fue Scrum Master del Sprint 3 y trabajo en pipeline/artifacts. Aaron trabajo en backend, aprobacion y parametro. Diego trabajo en frontend XML y documentacion. Saul trabajo en QA del flujo.

=== Issues asociadas
El sprint registro doce issues cerradas y doce asignaciones aceptadas, concentradas en backend, frontend, QA, DevOps y documentacion.

=== Evidencias documentales y capturas
#capture("Captura requerida: Sprint 3", "Capturas del estado `requires_review`, aprobacion, limite configurable, Actions y artifact.")

=== Resultado del sprint
El desarrollo funcional principal quedo completo, con flujo de aprobacion y validacion automatizada.

== Sprint 4: cierre profesional, QA final y documentacion

=== Objetivo del sprint
Transformar el trabajo tecnico en una entrega final verificable, navegable y evaluable, integrando evidencias Scrum, QA, DevOps, documentacion y presentacion publica mediante GitHub Pages.

=== Actividades realizadas
Se construyo un portal profesional con paleta Odoo, dashboard de evidencias, pagina de sprints, burndown, defensa ejecutiva, reorganizacion documental, PR final, informe Typst y planificacion de Jenkins como validacion complementaria.

=== Roles y responsables
Saul Sivincha asumio el rol de Scrum Master del cierre. Aaron trabajo en validacion funcional y QA final. Bryan asumio DevOps final, Docker Compose, Actions, Jenkinsfile y badges. Diego trabajo en documentacion Scrum, entregables, roadmap, guia y presentacion. Roydan no participo desde Sprint 3.

=== Issues asociadas
Las issues finales incluyeron portal GitHub Pages, validacion funcional Ventas/Compras, QA final, trazabilidad Scrum, DevOps final, entregables profesionales, insumos finales e integracion final. La vista de cierre identifica \#56, \#65, \#66, \#67, \#68, \#69, \#70 y \#33 como referencias principales.

=== Evidencias documentales y capturas
#capture("Captura requerida: Sprint 4", "Capturas del portal, dashboard de evidencias, burndown, PR final, Actions, Jenkins y PDF Typst.")

=== Resultado del sprint
El sprint cerro el Hito 3 con una entrega documental y tecnica defendible: portal publico, evidencias, dashboard, burndown, QA, DevOps e informe final.

= Arquitectura tecnica del producto

== Arquitectura general de Odoo

Odoo se organiza como plataforma modular. Sus addons encapsulan modelos, vistas, seguridad, datos, pruebas y configuracion. Esta arquitectura permite extender comportamientos sin alterar directamente el nucleo del sistema, lo que resulta adecuado para un proyecto academico de mejora funcional @odoo2026.

== Modulo de Ventas

El modulo de Ventas administra cotizaciones, pedidos, clientes, productos, lineas de venta, descuentos y confirmacion comercial. Por ello fue el modulo principal para implementar una regla de control de descuentos maximos.

== Modulo de Compras

Compras se reviso como complemento del analisis ERP. Su inclusion documental permite mostrar que el equipo no se limito a leer un unico archivo, sino que comprendio el contexto empresarial de Odoo y sus procesos relacionados.

== Addon personalizado

El addon `validacion_descuento_maximo` encapsula la logica de validacion, estados, vistas, configuracion, seguridad y pruebas asociadas al control de descuentos. Su uso respeta el patron de extension de Odoo.

== Estructura de archivos modificados

#table(
  columns: (1.3fr, 2fr),
  inset: 4pt,
  [*Archivo o carpeta*], [*Funcion*],
  [`models/sale_order.py`], [Extension del pedido de venta y control del flujo de revision.],
  [`models/res_company.py`], [Parametro empresarial del limite de descuento.],
  [`models/res_config_settings.py`], [Exposicion del limite configurable en ajustes.],
  [`views/sale_order_views.xml`], [Boton y elementos visibles del flujo de aprobacion.],
  [`views/res_config_settings_views.xml`], [Vista de configuracion del limite.],
  [`security/discount_security.xml`], [Grupo Supervisor de Descuentos.],
  [`tests/`], [Pruebas automatizadas del comportamiento funcional.],
)

== Flujo funcional implementado

El flujo revisa descuentos en lineas de pedido. Si el descuento se mantiene dentro del limite, el pedido continua su confirmacion normal. Si supera el limite, el pedido pasa a `requires_review`. Un supervisor autorizado puede aprobar el descuento y permitir que el pedido continue el flujo comercial.

== Capturas de estructura, codigo y vistas

#capture("Captura requerida: arquitectura tecnica", "Capturas de estructura del addon, archivos modificados, vistas XML y modelos principales.")

= Implementacion funcional

== Validacion de descuento maximo
La validacion compara el porcentaje de descuento de las lineas de venta con el limite configurado. Esta regla evita que descuentos superiores al umbral avancen sin revision comercial.

== Estado requires_review
El estado `requires_review` representa pedidos retenidos por superar el limite de descuento. Esta decision evita depender solo de errores bloqueantes y permite un flujo de aprobacion trazable.

== Grupo Supervisor de Descuentos
El grupo Supervisor de Descuentos restringe la accion de aprobacion a usuarios autorizados. Este control separa al vendedor comun del responsable que puede aprobar excepciones comerciales.

== Boton de aprobacion
El boton de aprobacion aparece en la interfaz del pedido de venta cuando corresponde. Su objetivo es permitir que el supervisor confirme la excepcion y continue el proceso.

== Limite configurable
El limite configurable permite ajustar el porcentaje maximo desde configuracion de compania. Esto evita dejar la regla fija en codigo y facilita adaptar el comportamiento a distintos escenarios.

== Vistas XML
Las vistas XML integran visualmente el flujo en Odoo. Incluyen elementos en el formulario del pedido y configuracion del limite, permitiendo que el usuario interactue con la mejora desde la interfaz.

== Evidencias visuales del flujo en Odoo
#capture("Captura requerida: flujo funcional en Odoo", "Capturas de pedido con descuento, estado `requires_review`, boton de aprobacion, usuario supervisor y configuracion del limite.")

= DevOps y automatizacion

== Docker Compose
Docker Compose se utilizo para reproducir el entorno Odoo + PostgreSQL. Esta decision redujo dependencias manuales y permitio levantar servicios de manera consistente durante desarrollo, QA y validaciones @docker2026.

== GitHub Actions
GitHub Actions se utilizo como herramienta de integracion continua. Los workflows validaron configuracion, ejecucion de pruebas y generacion de evidencia mediante logs y artifacts @githubactions2026.

== Ejecucion automatizada de pruebas
Las pruebas automatizadas verificaron escenarios del limite de descuento, estado de revision, aprobacion y configuracion. Su ejecucion en CI permitio detectar regresiones antes de consolidar cambios en la rama base.

== Artifacts y logs
Los artifacts y logs permiten conservar evidencia de ejecucion. En un contexto academico, estos elementos son importantes porque muestran que la validacion no fue solo declarada, sino ejecutada y registrada.

== Jenkins como validacion complementaria
Jenkins se plantea como herramienta DevOps complementaria. Su rol esperado es ejecutar stages de checkout, validacion de Docker Compose, pruebas del modulo y publicacion de evidencia. No sustituye GitHub Actions; demuestra conocimiento de una alternativa CI/CD ampliamente usada @jenkins2026.

== GitHub Pages como publicacion documental
GitHub Pages se uso como publicacion documental del proyecto. El portal concentra sprints, evidencias, burndown, defensa, arquitectura, verificacion tecnica y enlaces de cierre. Esta publicacion facilita la evaluacion porque el docente puede navegar el proyecto sin revisar archivos aislados @githubpages2026.

== Capturas de pipelines, artifacts y publicacion
#capture("Captura requerida: DevOps y publicacion", "Capturas de GitHub Actions, artifacts, Jenkins, Docker Compose y GitHub Pages.")

= Aseguramiento de calidad

== Estrategia de QA
La estrategia de QA combino pruebas funcionales, pruebas automatizadas y verificacion documental. El foco fue comprobar que el flujo de descuentos respondiera correctamente ante descuentos normales, descuentos superiores al limite, usuarios no supervisores, usuarios supervisores y cambios de configuracion.

== Casos de prueba
#table(
  columns: (1.1fr, 1.6fr, 1.1fr),
  inset: 4pt,
  [*Caso*], [*Resultado esperado*], [*Evidencia*],
  [Descuento permitido], [El pedido continua el flujo normal.], [Prueba funcional.],
  [Descuento excedido], [El pedido pasa a `requires_review`.], [Prueba funcional.],
  [No supervisor], [No puede aprobar excepciones.], [Prueba de permisos.],
  [Supervisor], [Puede aprobar y continuar.], [Prueba de rol.],
  [Limite configurable], [La regla cambia segun configuracion.], [Prueba parametrizada.],
)

== Pruebas funcionales
Las pruebas funcionales validan el comportamiento desde la perspectiva del usuario y del proceso comercial. Su objetivo es confirmar que la regla de negocio sea visible y defendible en Odoo.

== Pruebas de roles y permisos
Las pruebas de roles comprueban que solo usuarios autorizados puedan aprobar descuentos retenidos. Esta validacion es central porque la mejora tiene sentido si existe separacion de responsabilidades.

== Pruebas de configuracion
Las pruebas de configuracion verifican que el limite configurable cambie el comportamiento del sistema. Esto confirma que la solucion no depende de un porcentaje fijo y puede adaptarse.

== Resultados de QA
La evidencia documentada registra pruebas cerradas y sin pendientes para la defensa. Las ejecuciones automatizadas y logs de CI respaldan la estabilidad del flujo implementado.

== Capturas de pruebas y resultados
#capture("Captura requerida: QA", "Capturas de pruebas automatizadas, logs de GitHub Actions, artifact y validacion funcional en Odoo.")

= Trazabilidad del proyecto

== Relacion entre sprints, issues y entregables
Cada sprint se vinculo con issues y entregables concretos. Esto permite rastrear el camino desde planificacion hasta producto final: Sprint 0 define, Sprint 1 prepara, Sprint 2 implementa, Sprint 3 estabiliza y Sprint 4 documenta e integra.

== Relacion entre responsables y tareas
La asignacion individual permitio mostrar contribucion por integrante. Saul aparece asociado al cierre, portal y PR; Aaron a producto y QA; Bryan a DevOps; Diego a documentacion, Scrum y frontend; Roydan a configuracion inicial y MVP antes de su salida.

== Relacion entre commits y funcionalidades
El historial evidencia commits funcionales y de CI: configuracion Docker (`3763f4d`), MVP de descuento (`0d8f0b`), pruebas QA (`758796c`), visualizacion XML (`d775046`), supervisor (`14576d`), limite configurable (`08d2ee`), correcciones de CI y reorganizacion documental (`8a652d`). Estos commits permiten conectar codigo y entregables.

== Relacion entre pruebas y criterios de aceptacion
Los criterios de aceptacion se vinculan con pruebas: descuento permitido, descuento excedido, aprobacion por supervisor, restriccion a no supervisor y limite configurable. Esta relacion es clave para demostrar calidad y cierre.

== Matriz de trazabilidad completa
#table(
  columns: (0.7fr, 1.3fr, 1.4fr, 1.1fr),
  inset: 3.5pt,
  [*Sprint*], [*Entregable*], [*Evidencia*], [*Estado*],
  [0], [Seleccion y viabilidad], [Cronograma, licencia, repositorio], [Cerrado],
  [1], [Entorno y arquitectura], [Docker, informe, backlog], [Cerrado],
  [2], [MVP y CI inicial], [Addon, pruebas, Actions], [Cerrado],
  [3], [Aprobacion y parametrizacion], [Supervisor, artifacts, tests], [Cerrado],
  [4], [Cierre documental], [Pages, burndown, PR, informe], [Cerrado],
)

= Metricas y seguimiento Scrum

== Issues creadas por sprint
La vista de evidencias registra 43 issues trazadas. Por sprint, la distribucion usada para cierre fue: Sprint 0 con 5, Sprint 1 con 7, Sprint 2 con 5, Sprint 3 con 12 y Sprint 4 con 14.

== Issues cerradas por sprint
La vista de cierre documenta 43 issues cerradas y 0 abiertas para defensa. Esto representa un cierre documental completo del backlog previsto para evaluacion.

== Issues aceptadas por integrante
Las asignaciones aceptadas se distribuyeron en Saul 8, Aaron 9, Bryan 9, Diego 9 y Roydan 3. Roydan solo aparece hasta Sprint 2 debido a la reorganizacion del equipo.

== Burndown del proyecto
El burndown muestra reduccion del trabajo pendiente hasta llegar a cero en Sprint 4. Su funcion es evidenciar control del avance, no solo mostrar una grafica estetica.

== Avance acumulado
El avance acumulado paso de planificacion inicial a cierre profesional. En la representacion documental, Sprint 0 inicia el proyecto, Sprint 2 alcanza un MVP, Sprint 3 completa la funcionalidad principal y Sprint 4 consolida evidencias y publicacion.

== Dashboard de evidencias
El dashboard de evidencias separa la informacion por sprint, mostrando objetivo, lider, issues creadas, asignaciones, roles y enlaces de verificacion. Esto permite una lectura rapida para defensa.

== Capturas de graficos y metricas
#capture("Captura requerida: metricas Scrum", "Capturas del dashboard de evidencias, burndown, graficos por sprint e issues cerradas.")

= Resultados del proyecto

== Resultados funcionales
Se obtuvo un flujo funcional de control de descuentos en Ventas: validacion de limite, estado de revision, grupo supervisor, aprobacion y configuracion. Esto representa un incremento verificable sobre Odoo.

== Resultados metodologicos Scrum
El proyecto evidencia uso de Scrum mediante roles, sprints, backlog, issues, tablero, milestones, responsables, reviews documentadas y cierre por sprint.

== Resultados DevOps
Se documento Docker Compose, GitHub Actions, pruebas automatizadas, logs, artifacts, GitHub Pages y planificacion de Jenkins. Estos elementos muestran practicas DevOps aplicadas a un repositorio real.

== Resultados documentales
El portal GitHub Pages, el dashboard de evidencias, el burndown, la defensa ejecutiva, la reorganizacion `docs/` y el informe Typst forman la carga documental final.

== Cumplimiento de hitos
El Hito 1 se cubrio con seleccion y planificacion; el Hito 2 con MVP y CI inicial; el Hito 3 con estabilizacion, QA, DevOps, portal, PR e informe final.

== Estado final del producto
El producto queda documentado como incremento funcional y academico, con evidencias suficientes para evaluacion. Las tareas pendientes se concentran en completar capturas reales, implementar o evidenciar Jenkins y cerrar integracion final si el PR aun no se ha fusionado.

= Discusion

== Decisiones tecnicas relevantes
La decision mas importante fue pasar de una validacion bloqueante simple a un flujo de revision con estado `requires_review`. Esto permite trazabilidad de excepciones y aprobacion por supervisor.

== Problemas encontrados
El equipo enfrento reorganizacion de integrantes, integracion de ramas, conflictos con `19.0`, necesidad de ordenar documentacion dispersa y estabilizar CI para ejecutar pruebas en un entorno controlado.

== Riesgos gestionados
Se gestionaron riesgos de falta de evidencia, cambios no trazables, issues sin responsable, conflictos de merge, rutas rotas en GitHub Pages y validaciones CI incompletas.

== Limitaciones del proyecto
El proyecto se concentro en el modulo de Ventas. Compras fue analizado, pero no intervenido funcionalmente. Jenkins se considera complementario y debe mostrarse como implementado solo si se ejecuta y documenta con capturas.

== Lecciones aprendidas
El equipo aprendio que Scrum requiere evidencias y no solo reuniones declaradas; que DevOps necesita scripts reproducibles; que GitHub Pages puede funcionar como carga documental; y que integrar cambios en un repositorio grande exige resolver conflictos con criterio.

= Conclusiones

== Conclusiones sobre el producto
La mejora implementada aporta control comercial al flujo de Ventas de Odoo, permitiendo detectar y aprobar descuentos superiores al limite configurado.

== Conclusiones sobre Scrum
Scrum permitio organizar el avance por objetivos, roles, issues y entregables. La trazabilidad por sprints facilita defender el proceso ante evaluacion academica.

== Conclusiones sobre DevOps
Docker Compose, GitHub Actions, artifacts y GitHub Pages fortalecieron la reproducibilidad y evidencia del proyecto. Jenkins puede ampliar esa evidencia como herramienta CI/CD complementaria.

== Conclusiones sobre QA
QA permitio validar que la regla de descuento, permisos y configuracion funcionen de manera coherente. La relacion entre casos de prueba y criterios de aceptacion es esencial para sostener calidad.

== Trabajo futuro
Como trabajo futuro se recomienda completar Jenkins con pipeline ejecutable, agregar capturas finales en anexos, ampliar pruebas de borde, integrar reportes mas detallados y evaluar una extension funcional al modulo de Compras.

= Referencias

#bibliography("references.bib", style: "ieee")

= Anexos

== Anexo A. Capturas completas del Product Backlog
#docbox("Carga documental", "Insertar capturas completas del Product Backlog.")

== Anexo B. Capturas del tablero Kanban
#docbox("Carga documental", "Insertar capturas del tablero GitHub Projects.")

== Anexo C. Capturas de milestones
#docbox("Carga documental", "Insertar capturas de milestones por sprint e hito.")

== Anexo D. Capturas de issues por sprint
#docbox("Carga documental", "Insertar capturas filtradas de issues Sprint 0 a Sprint 4.")

== Anexo E. Capturas de pull requests
#docbox("Carga documental", "Insertar capturas del PR final y PRs relevantes.")

== Anexo F. Capturas de commits relevantes
#docbox("Carga documental", "Insertar capturas del historial de commits funcionales, QA y DevOps.")

== Anexo G. Capturas de GitHub Actions
#docbox("Carga documental", "Insertar capturas de workflows, logs y artifacts.")

== Anexo H. Capturas de Jenkins
#docbox("Carga documental", "Insertar capturas si Jenkins queda implementado y ejecutado.")

== Anexo I. Capturas de Docker Compose
#docbox("Carga documental", "Insertar capturas del entorno levantado y servicios.")

== Anexo J. Capturas de GitHub Pages
#docbox("Carga documental", "Insertar capturas de portal, evidencias, burndown y defensa.")

== Anexo K. Capturas del flujo funcional en Odoo
#docbox("Carga documental", "Insertar capturas de descuento, revision, aprobacion y configuracion.")

== Anexo L. Matriz completa de trazabilidad
#docbox("Carga documental", "Insertar matriz final sprint-issue-responsable-entregable-evidencia.")
