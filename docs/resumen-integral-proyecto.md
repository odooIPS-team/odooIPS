---
layout: default
title: Resumen Integral del Proyecto
---

[Volver al portal](../index.html) · [Volver a la documentación](README.html)

# Resumen integral del proyecto OdooIPS

## Identificación del proyecto

| Campo | Información consolidada |
| --- | --- |
| Proyecto | Scrum y DevOps aplicado a Odoo ERP |
| Curso | Ingeniería y Procesos de Software 2026-A |
| Institución | Universidad Nacional de San Agustín de Arequipa |
| Producto base | Odoo 19 Community Edition |
| Licencia | GNU Lesser General Public License v3.0 (LGPL-3.0) |
| Módulo principal | Ventas (`sale`) |
| Módulo complementario | Compras (`purchase`), analizado pero no modificado funcionalmente |
| Incremento desarrollado | Addon `validacion_descuento_maximo` |
| Metodología | Scrum, con Sprint 0 y cuatro sprints de ejecución |
| Plataforma de gestión | GitHub Issues, GitHub Projects, milestones, ramas, commits y pull requests |
| Automatización | Docker Compose y GitHub Actions |
| Publicación documental | GitHub Pages con Jekyll |
| Repositorio vigente | [odooIPS-team/odooIPS](https://github.com/odooIPS-team/odooIPS) |
| Rama principal | `19.0` |
| Fecha de esta auditoría | 14 de julio de 2026 |

## Criterio de consolidación

Este resumen toma como línea narrativa principal el portal de GitHub Pages y
sus páginas de sprints, evidencias, burndown, defensa y documentación. Los datos
de implementación se contrastaron con los archivos presentes en el repositorio,
el historial completo de Git y el estado de GitHub Issues disponible en la fecha
de auditoría.

Para evitar conclusiones engañosas, el documento diferencia tres conceptos. Lo
**planificado** corresponde al cronograma; lo **declarado** corresponde a lo que
muestra GitHub Pages; y lo **verificado** exige un archivo, commit, issue, prueba
o rama localizable. Esta distinción es especialmente importante porque parte de
la evidencia del Sprint 1 se registró después de su fecha de cierre y porque la
vista de cierre de Pages todavía no coincide por completo con el estado vivo de
GitHub.

## Resumen ejecutivo

OdooIPS es un proyecto académico de ingeniería de software desarrollado sobre
Odoo 19, un ERP de código abierto. El equipo aplicó Scrum para organizar el
trabajo desde la selección del producto hasta el cierre documental, y empleó
prácticas DevOps para mantener un entorno reproducible, automatizar pruebas y
publicar evidencias. El alcance funcional se concentró en Ventas; Compras se
utilizó como módulo complementario para comprender dependencias y relaciones
del flujo empresarial.

El problema seleccionado fue el control de descuentos excesivos en pedidos de
venta. El incremento desarrollado detecta descuentos superiores a un límite
configurable, retiene el pedido en el estado `requires_review`, restringe la
aprobación a un grupo de supervisores y permite continuar el flujo después de
la revisión. La solución se implementó como un addon independiente, mediante
herencia de modelos y vistas, sin modificar directamente el núcleo de Odoo.

La evolución del proyecto siguió una secuencia técnica coherente. Sprint 0
definió producto, alcance, equipo, viabilidad y cronograma. Sprint 1 preparó el
entorno y el análisis arquitectónico. Sprint 2 convirtió ese análisis en un MVP
de validación de descuentos. Sprint 3 añadió aprobación, permisos,
parametrización, pruebas y artifacts. Sprint 4 se orientó a QA final,
trazabilidad, publicación en GitHub Pages, documentación y preparación de la
defensa.

## Problema y alcance

El flujo comercial estándar permite aplicar descuentos en las líneas de un
pedido. Sin una política adicional, un descuento superior al autorizado puede
reducir el margen, eludir una revisión jerárquica y dificultar la auditoría de
la decisión. El proyecto respondió a este riesgo con una regla explícita de
control antes de la confirmación del pedido.

El módulo de Ventas fue elegido por su relevancia empresarial y por ofrecer
puntos de extensión claros en `sale.order`, `sale.order.line`, las vistas XML y
la configuración por compañía. El módulo de Compras se estudió para ampliar la
comprensión del dominio, pero no se desarrolló una mejora funcional sobre él.
Por tanto, el producto entregado debe describirse como una intervención en
Ventas con análisis complementario de Compras.

## Incremento funcional implementado

| Componente | Implementación verificable | Resultado funcional |
| --- | --- | --- |
| Límite de descuento | Campo `discount_limit_percentage` en la compañía y configuración mediante `res.config.settings` | El umbral puede administrarse por compañía y usa 15% como valor inicial |
| Detección de exceso | Validación sobre `sale.order` y `sale.order.line` en creación, escritura y confirmación | Una línea de producto que supera el límite retiene el pedido |
| Estado de revisión | Extensión de `state` con `requires_review` | El pedido queda identificado como pendiente de revisión |
| Seguridad | Grupo `group_discount_supervisor` | Solo un usuario autorizado puede ejecutar la aprobación |
| Aprobación | Método `action_approve_discount` | El supervisor libera el pedido retenido y lo coloca en estado de venta |
| Interfaz | Vistas heredadas de pedido de venta y ajustes | Se muestran el límite, el estado y la acción de aprobación |
| Pruebas | 16 métodos de prueba presentes en la rama actual | Se cubren límites, permisos, múltiples líneas, cambios y configuración |

El addon está organizado en modelos, seguridad, vistas y pruebas. La regla
ignora líneas de sección o nota mediante `display_type`, revisa todas las líneas
de producto y usa contexto interno para evitar ciclos durante el cambio de
estado. La parametrización reside en la compañía, por lo que el comportamiento
puede variar entre compañías sin alterar el código.

## Arquitectura técnica

Odoo emplea una arquitectura modular sobre Python, PostgreSQL y una capa web
basada en XML, JavaScript y OWL. El módulo `sale` concentra la cabecera del
pedido en `sale.order`, sus productos en `sale.order.line` y las relaciones con
clientes, compañías, facturación y equipos comerciales. La implementación del
equipo se apoya en la herencia del ORM y de vistas, lo que conserva la
actualización y separación respecto del código base.

| Capa | Elementos del proyecto | Responsabilidad |
| --- | --- | --- |
| Datos | `res.company` | Mantener el límite de descuento por compañía |
| Configuración | `res.config.settings` | Exponer el límite en los ajustes de Odoo |
| Dominio | `sale.order`, `sale.order.line` | Detectar excesos, retener y aprobar pedidos |
| Seguridad | `discount_security.xml` | Definir el grupo Supervisor de Descuentos |
| Presentación | `sale_order_views.xml`, `res_config_settings_views.xml` | Integrar campos, estado y botón en la interfaz |
| Calidad | `test_sale_order_discount_limit.py` | Verificar la regla y sus escenarios de borde |

## Aplicación de Scrum por sprint

| Sprint | Fechas declaradas en Pages | Líder | Objetivo | Resultado principal declarado |
| --- | --- | --- | --- | --- |
| Sprint 0 | 01-13 mayo | Roydan Apaza | Seleccionar Odoo, definir alcance, equipo, cronograma y viabilidad | Plan inicial, verificación técnica, cronograma y portal básico |
| Sprint 1 | 14-28 mayo | Diego Yauli | Preparar entorno, analizar Ventas y Compras, organizar backlog e iniciar DevOps | Docker Compose, análisis arquitectónico, ramas y documentación técnica |
| Sprint 2 | 29 mayo-10 junio | Aaron Quiñonez | Implementar el MVP de control de descuentos y CI inicial | Addon base, vista, pruebas y workflow inicial |
| Sprint 3 | 11-26 junio | Bryan Sencia | Evolucionar el flujo de aprobación y estabilizar la solución | Grupo supervisor, acción de aprobación, límite configurable, QA y artifact |
| Sprint 4 | 27 junio-13 julio | Saul Sivincha | Cerrar profesionalmente el proyecto | Portal, dashboard, burndown, defensa, QA final y documentación |

Los líderes rotativos asumieron coordinación, seguimiento y consolidación en
cada etapa. Scrum se evidenció mediante backlog, issues, asignaciones,
milestones, tablero Kanban, revisiones de avance y documentación por sprint. El
burndown publicado reconstruye el avance acumulado del proyecto y no debe
interpretarse como una medición exclusiva de GitHub Pages.

### Profundidad técnica alcanzada en el Sprint 1

El Sprint 1 estableció la base de reproducibilidad sobre la que se desarrolló
el addon. El equipo preparó un sistema Ubuntu con Docker y Docker Compose,
clonó la rama `19.0`, abrió la rama
`feature/roydan-configuracion-entorno` y levantó dos servicios conectados por
una red dedicada: Odoo 19 como aplicación y PostgreSQL 15 como persistencia. El
montaje `../addons:/mnt/extra-addons` permitió que los módulos creados en el
repositorio fueran visibles desde el contenedor sin construir una imagen
personalizada. La comprobación se realizó con `docker compose ps` y con el
acceso al formulario de configuración en `http://localhost:8069`, donde se creó
la base de trabajo `odoo_ventas` con datos de demostración.

La arquitectura se estudió antes de seleccionar el punto de modificación. La
auditoría del manifiesto de `sale` identificó tres dependencias directas:
`sales_team`, para equipos y jerarquías comerciales; `account_payment`, para la
relación con pagos y facturación; y `utm`, para la atribución de campañas. El
análisis también reconoció dependencias transitivas relevantes como `account`,
`payment` y `portal`. Esto permitió comprender que una orden de venta no es un
registro aislado, sino un orquestador conectado con clientes, compañías,
facturas, pagos y la experiencia del portal.

El modelo `sale.order` se documentó desde cuatro perspectivas. En persistencia,
se analizaron `partner_id`, `company_id`, `order_line`, `invoice_ids` e
`invoice_status`. En comportamiento, se reconstruyó la máquina de estados
`draft`, `sent`, `sale` y `cancel`. En lógica transaccional, se revisaron
`_action_cancel`, responsable de coordinar la cancelación con facturas en
borrador, y `_create_invoices`, que prepara líneas facturables, anticipos,
agrupaciones y conversiones contables. Finalmente, se estudiaron
`action_confirm` y `_action_confirm` como puntos de extensión apropiados para
insertar controles antes de consolidar una venta.

La interfaz también se analizó como parte de la arquitectura, no únicamente
como presentación visual. El equipo revisó el encabezado de la vista de pedido,
los botones que invocan métodos Python, los banners condicionales, el componente
relacional de `order_line`, las vistas `form`, `list`, `kanban`, `pivot`,
`graph`, `calendar` y `activity`, y la capa de búsqueda con dominios y
agrupaciones. Esta trazabilidad entre XML y backend justificó que la mejora
posterior usara herencia de vistas y un botón `type="object"` conectado con una
acción del modelo.

El resultado más importante del Sprint 1 fue, por tanto, una decisión de
diseño: extender Odoo mediante un addon separado y controlar el descuento en el
flujo de confirmación, conservando intacto el módulo `sale`. Sprint 2 tomó esa
decisión y construyó el MVP; Sprint 3 tuvo que refinar su comportamiento
transaccional y añadir la jerarquía de aprobación.

### Profundidad metodológica y técnica del Sprint 3

El Sprint 3 tuvo como meta transformar el bloqueo inicial en un flujo de
aprobación parametrizable y verificable. Bryan Sencia actuó como Scrum Master y
responsable de DevOps; Aaron Quiñonez asumió Product Owner, backend y
parametrización; Diego Yauli trabajó en frontend XML y publicación; y Saul
Sivincha se encargó de QA. El informe del sprint estructuró el alcance en seis
historias de usuario:

| Historia | Prioridad | Necesidad y criterio principal |
| --- | --- | --- |
| HU-1 | Crítica | Ejecutar las pruebas del addon en cada `push` y hacer fallar el pipeline ante una regresión |
| HU-2 | Alta | Permitir que solo un Supervisor de Descuentos apruebe pedidos retenidos |
| HU-3 | Alta | Sustituir el límite fijo por un parámetro configurable por compañía, con 15% predeterminado |
| HU-4 | Alta | Adaptar las pruebas al estado `requires_review`, los permisos y la parametrización |
| HU-5 | Media | Publicar documentación técnica y seguimiento visual en GitHub Pages |
| HU-6 | Media | Iniciar el artículo IEEE y reunir métricas de calidad y ejecución |

El backlog detallado descompuso esas historias en 13 tareas: integración de
pruebas en CI, grupo supervisor, método de aprobación, configuración por
compañía, botón condicionado, artifact del log, campo en Ajustes, pruebas de
aprobación, pruebas de límites, GitHub Pages, borrador IEEE, métricas y
corrección transaccional. La página general contabiliza 12 issues para Sprint 3
porque la tarea de GitHub Pages fue reclasificada posteriormente como Sprint 4.
La diferencia no representa una tarea inexistente, sino un cambio de
clasificación entre el informe de ejecución y la vista final del backlog.

La decisión técnica central fue abandonar el `UserError` como mecanismo normal
para retener pedidos. En el MVP, escribir un estado y lanzar una excepción en la
misma transacción podía provocar que Odoo revirtiera también el cambio de
estado. Sprint 3 sustituyó ese patrón por una retención pasiva: cuando una línea
supera el límite, el pedido permanece persistido y pasa a `requires_review`.
Este cambio convirtió una alerta bloqueante en un flujo de negocio auditable y
permitió introducir una acción posterior de aprobación.

La parametrización se ubicó en `res.company` mediante
`discount_limit_percentage`, expuesta en `res.config.settings`. El valor
predeterminado de 15% funciona como política inicial, mientras que la relación
con `company_id` permite políticas diferentes en entornos multicompañía. La
vista de ajustes habilita al administrador para cambiar el umbral sin editar
Python ni XML.

El control de acceso se diseñó en dos capas. La interfaz oculta el botón cuando
el pedido no está en `requires_review` o cuando el usuario no pertenece a
`group_discount_supervisor`; el backend repite la comprobación con `has_group`
para impedir que una llamada directa omita la restricción visual. El flujo E2E
documentado comprende cuatro pasos: crear o editar una cotización, superar el
límite, retener el pedido, y aprobarlo con un usuario autorizado hasta alcanzar
el estado `sale`.

En DevOps, el sprint evolucionó GitHub Actions hacia una validación del addon y
no solo de la infraestructura. El workflow obtiene el código, levanta Odoo y
PostgreSQL con Docker Compose, espera la inicialización, ejecuta únicamente las
pruebas etiquetadas de `validacion_descuento_maximo`, imprime el log, conserva
el código de salida y publica `odoo_tests.log` con `if: always()`. El puerto
8070 aísla la ejecución automatizada de la instancia normal en 8069. Las
referencias al puerto 8079 y a la base
`odooips_discount_tests_report_final` pertenecen a validaciones manuales
locales, mientras que el pipeline utiliza la base `odoo_ventas`.

### Evolución de las decisiones entre Sprint 1 y el estado actual

| Aspecto | Conocimiento obtenido en Sprint 1 | Evolución documentada en Sprint 3 | Implementación presente en la rama actual |
| --- | --- | --- | --- |
| Punto de extensión | `action_confirm` y `_action_confirm` permiten validar antes de confirmar | `action_confirm` retiene el pedido sin lanzar una excepción | Se valida en creación, escritura y confirmación mediante `_raise_discount_limit_error`, que cambia a `requires_review` sin lanzar el mensaje preparado |
| Política comercial | Se identificó el descuento como punto de control del pedido | Límite por compañía con 15% predeterminado | `res.company.discount_limit_percentage`, relacionado con Ajustes |
| Flujo de revisión | La máquina de estados nativa no incluía revisión | Se añadió `requires_review` y una aprobación jerárquica | El estado y el botón están implementados |
| Aprobación | Se estudió la conexión XML-Python de botones `type="object"` | El informe describe volver a `draft` y ejecutar `action_confirm` con contexto de omisión | El método actual verifica el grupo y escribe directamente `state = 'sale'` |
| Jerarquía | Se analizaron equipos y roles comerciales mediante `sales_team` | El informe describe que Supervisor implica Gerente de Ventas | El XML actual crea el grupo, pero no contiene `implied_ids` hacia `sales_team.group_sale_manager` |
| Calidad | Se definieron escenarios y puntos de entrada que debían probarse | El informe registra 16 pruebas correctas y cero errores | El archivo actual contiene 16 métodos de prueba; verifica el rechazo sin permisos, pero no incluye un caso positivo de aprobación por supervisor |
| Estructura de seguridad | Se identificaron roles comerciales y puntos de extensión | El informe enumeró `ir.model.access.csv` junto con el grupo supervisor | El addon no contiene ese CSV porque no crea un modelo nuevo; carga únicamente `discount_security.xml` |
| Automatización | Docker Compose estableció el entorno reproducible | Actions ejecutó tests, propagó fallos y publicó un artifact | `main.yml` conserva este diseño con log en `docker-config/odoo_tests.log` |

Estas diferencias son relevantes para la defensa. El informe de Sprint 3
describe la intención y una versión histórica del incremento, mientras que el
repositorio actual determina el comportamiento ejecutable. La referencia
documental a “Issue #53” corresponde en realidad al Pull Request `#53`, que
integró la configuración del límite; la issue `#53` del backlog trata el campo
de configuración en la interfaz. En la exposición deben distinguirse ambos
objetos para mantener una trazabilidad precisa.

## Equipo y responsabilidades consolidadas

| Integrante | Responsabilidad predominante | Aportes principales |
| --- | --- | --- |
| Saul Sivincha | Scrum Master de Sprint 4, QA y documentación | Cronograma, backlog, pruebas, portal de Pages, evidencias, informe final e integración |
| Aaron Quiñonez | Arquitectura, backend y QA | Viabilidad técnica, análisis de Ventas/Compras, seguridad, aprobación, parametrización y QA final |
| Bryan Sencia | Arquitectura y DevOps | Análisis técnico, evidencias de entorno, GitHub Actions, artifacts y coordinación de Sprint 3 |
| Diego Yauli | Gestión, frontend y documentación | Liderazgo de Sprint 1, documentación, vistas XML, interfaz y entregables de cierre |
| Roydan Apaza | Liderazgo inicial y backend del MVP | Liderazgo de Sprint 0, entorno Docker y primera validación de descuentos; no participa desde Sprint 3 |

El equipo comenzó con cinco integrantes. La vista vigente de Pages documenta
cuatro integrantes activos en el cierre, debido a la salida de Roydan a partir
del Sprint 3. No existe un quinto reemplazo verificable en el repositorio o en
las asignaciones actuales.

## Gestión en GitHub y métricas

GitHub Issues funcionó como Product Backlog y GitHub Projects como tablero
Kanban. Las tareas se clasificaron por sprint y por frentes de backend,
frontend, QA, DevOps, documentación y gestión. Los commits y pull requests
aportaron la trazabilidad técnica, mientras que Pages presentó una vista
ejecutiva para evaluación.

| Indicador | Vista declarada en GitHub Pages | Estado verificado el 14-jul-2026 |
| --- | ---: | ---: |
| Issues totales | 43 | 43 |
| Issues cerradas | 43 | 39 |
| Issues abiertas | 0 | 4 |
| Issues abiertas identificadas | Ninguna | `#33`, `#67`, `#69`, `#70` |
| Avance mostrado | 100% | 39/43 issues cerradas, equivalente a 90.7% por conteo simple |

Las 43 tareas de Pages se distribuyen como 5 en Sprint 0, 7 en Sprint 1, 5 en
Sprint 2, 12 en Sprint 3 y 14 en Sprint 4. El informe operativo del Sprint 3
registró 13 tareas en Done; la diferencia proviene de la reclasificación de
GitHub Pages hacia Sprint 4 en la vista consolidada. Las cifras de Pages
representan la reconstrucción Scrum mostrada por el portal. No equivalen al
número de commits:
durante la ventana de Sprint 0 se registraron 30 commits del equipo, mientras
que Sprint 1 tuvo 3 commits dentro de su ventana y evidencia adicional
registrada posteriormente.

## DevOps y publicación

| Práctica | Estado comprobado | Evidencia |
| --- | --- | --- |
| Entorno reproducible | Implementado | `docker-config/docker-compose.yml` con Odoo 19, PostgreSQL 15, red y volúmenes |
| Montaje del addon | Implementado | `../addons:/mnt/extra-addons` en el servicio web |
| Integración continua | Implementada | `.github/workflows/main.yml` levanta el entorno y ejecuta pruebas del addon |
| Logs y artifacts | Implementados en el workflow | Publicación de `odoo_tests.log` mediante `actions/upload-artifact` |
| GitHub Pages | Implementado | Portal Jekyll con navegación, sprints, evidencias, burndown y defensa |
| Jenkins | Planificado, no verificable como implementación | No existe `Jenkinsfile` en las referencias Git inspeccionadas |

Jenkins aparece en Pages y en la issue `#68` como parte del frente DevOps
final. Sin embargo, la ausencia de un `Jenkinsfile` obliga a describirlo como
validación complementaria planificada, no como pipeline ejecutado. Para
considerarlo terminado se requiere un pipeline versionado, al menos una
ejecución satisfactoria y evidencia del resultado.

## Aseguramiento de calidad

La suite actual contiene 16 métodos de prueba de backend. Los casos verifican el valor
predeterminado, descuentos inferiores e iguales al límite, excesos decimales,
múltiples líneas, límites personalizados, creación y modificación de pedidos,
escritura directa de líneas, exclusión de secciones y permisos de aprobación.
El workflow de GitHub Actions ejecuta el módulo con `--test-enable`, conserva el
log aun cuando existen fallos y publica ese log como artifact.

La evidencia del Sprint 2 declaró 15 pruebas aprobadas, sin fallos ni errores.
El informe detallado del Sprint 3 registró posteriormente una ejecución de 16
pruebas en 1.373 segundos, también con cero fallos y cero errores. La rama
actual conserva esos 16 métodos `test_*`, por lo que la diferencia 15/16
representa la ampliación de cobertura entre ambos sprints. La brecha vigente no
es numérica: existe una prueba que confirma el rechazo de un usuario sin grupo,
pero no una que demuestre la aprobación exitosa con un supervisor autorizado.

## Entregables y evidencia disponible

| Frente | Evidencia principal | Estado documental |
| --- | --- | --- |
| Planificación | `docs/cronograma-sprints.md` | Integrada |
| Viabilidad | `docs/reporte-verificacion-sprint-0.md` | Integrada |
| Arquitectura de Ventas | `docs/arquitectura-modulo-ventas.md` e informe de Sprint 1 | Integrada |
| Arquitectura de Compras | Commit `0ea6e13` en `origin/feature/daniel-devops-evidencias` | Existe en rama remota, no como documento independiente en `19.0` |
| Informes de sprint | `docs/sprints/informe-sprint-1.md` a `informe-sprint-3.md` | Integrados |
| Implementación | `addons/validacion_descuento_maximo/` | Integrada |
| CI y pruebas | `.github/workflows/main.yml` y tests del addon | Integrados |
| Portal | `index.md`, `sprints.md`, `evidencias.md`, `burndown.md`, `defensa.md` | Integrado en la rama de Pages |
| Informe final | `docs/ieee/informe-final.typ` y PDF compilado | Borrador completo con capturas pendientes |

## Estado actual y cierre pendiente

El incremento funcional, las pruebas, Docker Compose, GitHub Actions y el
portal documental son verificables. El proyecto puede presentarse como una
implementación completa del control de descuentos en Ventas, acompañada por un
proceso Scrum documentado y prácticas DevOps reales.

Antes de declarar el cierre absoluto deben resolverse cinco diferencias:

1. Cerrar o justificar las issues `#33`, `#67`, `#69` y `#70`.
2. Actualizar Pages para que sus métricas coincidan con el estado vivo de las issues.
3. Implementar y ejecutar Jenkins, o retirarlo de la lista de componentes implementados.
4. Integrar la evidencia independiente de Compras desde la rama remota, si se desea defenderla como entregable publicado.
5. Alinear el informe del Sprint 3 con el código actual respecto de la estrategia de aprobación y la jerarquía del grupo supervisor, y añadir una prueba positiva de aprobación autorizada.

# Auditoría de cambios: Sprint 0 y Sprint 1

## Convenciones de la auditoría

Las tablas siguientes utilizan la fecha de autor registrada por Git y enlaces
al repositorio vigente de la organización. Se excluyen los commits propios del
proyecto Odoo upstream. Los cambios se ordenan cronológicamente y se describe el
contenido real del diff, incluso cuando el mensaje del commit es genérico o no
coincide con el archivo modificado.

La ventana de Sprint 0 contiene 30 commits del equipo. La ventana de Sprint 1
contiene 3. Además, se identificaron 8 commits posteriores que documentan o
consolidan trabajo atribuible al Sprint 1; se muestran por separado para
conservar la trazabilidad sin cambiar artificialmente sus fechas.

## Sprint 0: cambios registrados entre el 1 y el 13 de mayo

| N.° | Fecha | Commit | Autor | Cambio comprobado |
| ---: | --- | --- | --- | --- |
| 1 | 06-may 08:37 | [`8336f45`](https://github.com/odooIPS-team/odooIPS/commit/8336f45681891e6607730db203313c3ef8add543) | Roydan Apaza | Sustituyó el README original de Odoo por una presentación inicial del proyecto, el equipo, el objetivo, la licencia y el stack. |
| 2 | 06-may 08:50 | [`9531006`](https://github.com/odooIPS-team/odooIPS/commit/95310060801d9c9dd5089efc1b92a61726612a23) | Roydan Apaza | Creó `index.md` como portada inicial de GitHub Pages con la información base del proyecto. |
| 3 | 06-may 08:58 | [`e9428dd`](https://github.com/odooIPS-team/odooIPS/commit/e9428dd7912bb6830b99e4a402d41c37e21058d2) | Roydan Apaza | Realizó una prueba menor de formato en `README.md`, eliminando el encabezado inicial. |
| 4 | 08-may 16:32 | [`b0dd33b`](https://github.com/odooIPS-team/odooIPS/commit/b0dd33be50e9f8e3e8ca0d0a11a6c79f17e126ee) | Roydan Apaza | Amplió `index.md` con objetivo, software, roles, herramientas, sprints e hitos; el borrador todavía indicaba MIT y luego fue corregido a LGPL-3. |
| 5 | 08-may 16:34 | [`aee0728`](https://github.com/odooIPS-team/odooIPS/commit/aee072840ff602912d7c4128116b67384f35488d) | Roydan Apaza | Inició la limpieza de marcadores de cita generados en el objetivo del plan. |
| 6 | 08-may 16:37 | [`ea5e0f2`](https://github.com/odooIPS-team/odooIPS/commit/ea5e0f2d37355d94d6341cbffc650bca0c8b311c) | Roydan Apaza | Eliminó marcadores de cita restantes, completó nombres y normalizó la redacción de roles, herramientas e hitos. |
| 7 | 08-may 16:57 | [`68d0720`](https://github.com/odooIPS-team/odooIPS/commit/68d07204f833b8c7d28ad120d47f4e1664e8c9cd) | Roydan Apaza | Añadió la URL inicial de Pages, ajustó roles y creó encabezados para Sprint 1 a Sprint 4. |
| 8 | 08-may 16:59 | [`825e7cb`](https://github.com/odooIPS-team/odooIPS/commit/825e7cbaceafb8ace90a748fa1d15365c9088210) | Roydan Apaza | Restauró el encabezado y la alineación de la tabla de herramientas. |
| 9 | 08-may 17:04 | [`69f144c`](https://github.com/odooIPS-team/odooIPS/commit/69f144c255382236ea0c6d96501473110dfdb9cc) | Roydan Apaza | Incorporó el front matter de Jekyll para publicar `index.md` con el layout predeterminado. |
| 10 | 08-may 17:07 | [`44578db`](https://github.com/odooIPS-team/odooIPS/commit/44578dbefcd4292a25d9c97faf13e277280bd7df) | Roydan Apaza | Reorganizó y condensó el plan, corrigió el enlace al repositorio y simplificó herramientas e hitos. |
| 11 | 08-may 17:08 | [`0425f4d`](https://github.com/odooIPS-team/odooIPS/commit/0425f4d44910b3d4b5df8835590c358518b94809) | Roydan Apaza | Recuperó el detalle del objetivo, software, roles, herramientas y entregables de los tres hitos. |
| 12 | 08-may 17:17 | [`d86abf7`](https://github.com/odooIPS-team/odooIPS/commit/d86abf7b75416cab6f0a06b84b73c557711d824b) | Roydan Apaza | Restableció el front matter, creó secciones de responsabilidades por sprint y retiró temporalmente el detalle del cronograma. |
| 13 | 08-may 17:22 | [`3a93b90`](https://github.com/odooIPS-team/odooIPS/commit/3a93b90c942e6a871ad3caaeb566eb1f137d7838) | Aaron Quiñonez | Creó el reporte de verificación técnica y la primera versión de Docker Compose con Odoo 19, PostgreSQL 15 y volúmenes persistentes. |
| 14 | 08-may 17:25 | [`d3933ca`](https://github.com/odooIPS-team/odooIPS/commit/d3933caca3e73bdbc02f4356fe69ed0e1ae036c5) | Roydan Apaza | Reorganizó la información de complejidad y viabilidad e incorporó enlaces hacia la documentación técnica. |
| 15 | 08-may 17:27 | [`fbb3cb0`](https://github.com/odooIPS-team/odooIPS/commit/fbb3cb00f56c22074d113bd42ff76683121a9088) | Roydan Apaza | Ajustó los enlaces de licencia, Docker Compose y cronograma en la portada. |
| 16 | 08-may 17:47 | [`578ccc0`](https://github.com/odooIPS-team/odooIPS/commit/578ccc088e7a0a1cb466083a2d0f5575fc31e20c) | Bryan Sencia | Creó el informe de arquitectura de Ventas con alcance, complejidad estimada, componentes y mejoras candidatas. |
| 17 | 11-may 16:25 | [`f57159f`](https://github.com/odooIPS-team/odooIPS/commit/f57159f011dc7e10fa7a1b64dc870e1917a0bee5) | Roydan Apaza | Corrigió el formato Markdown de la tabla de herramientas. |
| 18 | 11-may 16:58 | [`98578c2`](https://github.com/odooIPS-team/odooIPS/commit/98578c29827a5a7f6705cebb8e236e7d55a3d963) | Roydan Apaza | Corrigió la licencia a LGPL-3, completó integrantes y roles, enlazó arquitectura y cronograma y añadió Google Meet. |
| 19 | 11-may 17:01 | [`7c5ba51`](https://github.com/odooIPS-team/odooIPS/commit/7c5ba51ead017134fc99550dd30522258c240fc2) | Roydan Apaza | Normalizó la lista Markdown de integrantes. |
| 20 | 11-may 17:03 | [`816f780`](https://github.com/odooIPS-team/odooIPS/commit/816f7809e6b90f941619970a3c56683a1d36fabe) | Roydan Apaza | Corrigió un error tipográfico en la descripción de la infraestructura DevOps. |
| 21 | 11-may 17:12 | [`e023443`](https://github.com/odooIPS-team/odooIPS/commit/e02344397bfbb3b3e086fed6f2a9840e7835d21d) | Roydan Apaza | Añadió estilo CSS para cabeceras oscuras en las tablas de Pages. |
| 22 | 11-may 17:16 | [`d0fd839`](https://github.com/odooIPS-team/odooIPS/commit/d0fd839b8d17307f2b42777136900af2bceb429b) | Roydan Apaza | Enlazó la herramienta GitHub Projects con el tablero inicial. |
| 23 | 11-may 17:19 | [`f8c1d3f`](https://github.com/odooIPS-team/odooIPS/commit/f8c1d3f30ede540b26b1f3a3d0a62a04c6c1adc2) | Roydan Apaza | Añadió bordes y colapso de bordes a las tablas de la portada. |
| 24 | 11-may 17:24 | [`41dbd0f`](https://github.com/odooIPS-team/odooIPS/commit/41dbd0f904c908f37d02a1acfd8554196ecb4516) | Roydan Apaza | Reconstruyó el README con información académica, equipo, objetivo, producto y enlaces documentales. |
| 25 | 11-may 17:26 | [`a93c21f`](https://github.com/odooIPS-team/odooIPS/commit/a93c21f8455e6d86390562a1e5caa5330aef0017) | Roydan Apaza | Cambió el enlace del plan en README para apuntar a la publicación de Pages. |
| 26 | 11-may 17:28 | [`6d0dfe1`](https://github.com/odooIPS-team/odooIPS/commit/6d0dfe16c57933d44422aa36f0d67a0f3eabd2fa) | Roydan Apaza | Retiró las reglas CSS de bordes, conservando el estilo de cabecera. |
| 27 | 11-may 17:32 | [`8a4708d`](https://github.com/odooIPS-team/odooIPS/commit/8a4708d253d7483b83c6a6b7517f27ebcd36cb8a) | Roydan Apaza | Cambió el color de las cabeceras de tabla a `#0b1f3a`. |
| 28 | 11-may 17:34 | [`86601ec`](https://github.com/odooIPS-team/odooIPS/commit/86601ec8e00fe2d1776aed29c02882afe65916dd) | Roydan Apaza | Ajustó nuevamente el color de cabecera a `#020d1a`. |
| 29 | 12-may 00:13 | [`86a848f`](https://github.com/odooIPS-team/odooIPS/commit/86a848f9f74a6560be8b0d27b9d229fd40615ae0) | Saul Sivincha | Creó el cronograma maestro con Sprint 0 a Sprint 4, hitos, actividades Scrum/DevOps y entregables; enlazó el documento desde README e index. |
| 30 | 12-may 00:19 | [`3c1cd48`](https://github.com/odooIPS-team/odooIPS/commit/3c1cd4870d2b9370fc3d24aa659dee57cc8ff0ae) | Saul Sivincha | Recuperó y realineó la tabla completa del cronograma y eliminó la línea de tiempo textual redundante. |

### Resultado verificable del Sprint 0

El historial muestra que Sprint 0 fue principalmente documental y de
preparación. Produjo la identidad del proyecto, la primera publicación en
Pages, la delimitación de Ventas, la comprobación de licencia y complejidad, una
primera configuración de contenedores, la definición de roles y el cronograma
maestro. También evidencia iteraciones rápidas de formato y contenido sobre
`index.md`; esos commits no representan treinta entregables distintos, sino el
proceso incremental de construir y corregir la presentación inicial.

## Sprint 1: cambios registrados entre el 14 y el 28 de mayo

| N.° | Fecha | Commit | Autor | Cambio comprobado |
| ---: | --- | --- | --- | --- |
| 1 | 15-may 10:57 | [`a7c056f`](https://github.com/odooIPS-team/odooIPS/commit/a7c056f8504059f77261231fec62732c47a0e0ef) | Diego Yauli | Cambió su rol de gestión de backlog a gestión documental del Hito 1 y consolidación de evidencias. |
| 2 | 25-may 22:58 | [`3763f4d`](https://github.com/odooIPS-team/odooIPS/commit/3763f4dad4b181b26c128a137f228d46fe032607) | Roydan Apaza | Estabilizó Docker Compose: ordenó servicios, añadió red dedicada, corrigió el volumen de PostgreSQL y montó `../addons` como módulos extra. |
| 3 | 26-may 13:21 | [`8c877c0`](https://github.com/odooIPS-team/odooIPS/commit/8c877c0bad0c4f34e499bad52884e40e18126733) | Diego Yauli | Integró mediante merge la configuración Docker de Roydan; el commit de merge no añadió cambios distintos a los de `3763f4d`. |

### Resultado verificable dentro de la ventana del Sprint 1

Dentro de las fechas declaradas se consolidaron el ajuste de responsabilidades
y el entorno reproducible de Odoo/PostgreSQL. La cantidad de commits es menor
que la de Sprint 0 porque el trabajo técnico se concentró en una rama y parte de
la evidencia se registró después del 28 de mayo.

## Evidencia del Sprint 1 registrada después del cierre

| N.° | Fecha real | Commit | Autor | Aporte atribuible al Sprint 1 | Situación actual |
| ---: | --- | --- | --- | --- | --- |
| 1 | 01-jun 22:11 | [`756d9ed`](https://github.com/odooIPS-team/odooIPS/commit/756d9ed4cc936effd6a40dc51d91773a872c1d96) | Bryan Sencia | Creó el índice de la carpeta de evidencias del entorno. | Solo en `origin/feature/daniel-devops-evidencias` |
| 2 | 01-jun 23:42 | [`015d62e`](https://github.com/odooIPS-team/odooIPS/commit/015d62eabce4032769e6665574c98d2b25cdae46) | Bryan Sencia | Añadió capturas de commits, ramas, `docker compose up` y el dashboard de Odoo. | Solo en `origin/feature/daniel-devops-evidencias` |
| 3 | 01-jun 23:52 | [`7cedcc5`](https://github.com/odooIPS-team/odooIPS/commit/7cedcc5b11aec95cb026b9abe1d16057892f4b05) | Bryan Sencia | Creó un workflow inicial para validar Docker Compose. | Solo en la rama de evidencias; el workflow vigente es `main.yml` |
| 4 | 03-jun 02:57 | [`0ea6e13`](https://github.com/odooIPS-team/odooIPS/commit/0ea6e1345b6138ba410d85fb1b306048269dc34c) | Aaron Quiñonez | Añadió 524 líneas de análisis y diagramas independientes para Ventas y Compras. | Solo en `origin/feature/daniel-devops-evidencias` |
| 5 | 12-jun 15:38 | [`72c444b`](https://github.com/odooIPS-team/odooIPS/commit/72c444b471653de4b6fb580d436946828300b8cd) | Bryan Sencia | Creó `sprint1.md` como archivo vacío de preparación. | Integrado; luego fue completado |
| 6 | 12-jun 15:44 | [`23b0b78`](https://github.com/odooIPS-team/odooIPS/commit/23b0b78bd52caabec78a5fd67b9e1b1e66996113) | Bryan Sencia | Pobló `sprint1.md` con 267 líneas de informe y evidencias de Sprint 1 y Sprint 2, aunque el mensaje dice “md sprint 2”. | Integrado |
| 7 | 12-jun 15:47 | [`02d5aa8`](https://github.com/odooIPS-team/odooIPS/commit/02d5aa8c7600319fc91d697184b059cf9a2f6182) | Bryan Sencia | Reestructuró el informe combinado, redujo contenido redundante y mejoró el resumen, QA e infraestructura. | Integrado |
| 8 | 12-jun 16:09 | [`75385a7`](https://github.com/odooIPS-team/odooIPS/commit/75385a7258c12011927470b0eca62fc1f349c396) | Diego Yauli | Amplió el informe con dependencias, modelo `sale.order`, estados, métodos, vistas XML y trazabilidad; añadió 366 líneas y retiró 45. | Integrado y posteriormente reorganizado en `docs/sprints/` |

## Correcciones de trazabilidad derivadas del historial

1. La primera versión de Docker Compose no nació en `3763f4d`; fue creada por Aaron en `3a93b90` durante Sprint 0. Roydan la convirtió en una configuración funcional y reproducible en `3763f4d` durante Sprint 1.
2. `8c877c0` es un commit de integración. No debe contarse como una segunda implementación de Docker Compose.
3. El análisis independiente de Compras sí existe en `0ea6e13`, pero permanece en una rama remota y no está publicado como archivo autónomo en `19.0`.
4. El workflow `7cedcc5` pertenece a una rama de evidencias. La automatización vigente del proyecto se encuentra en `.github/workflows/main.yml` y fue evolucionada en sprints posteriores.
5. `72c444b` solo creó un archivo vacío. El contenido real del informe comenzó en `23b0b78`, pese a que su mensaje menciona Sprint 2.
6. Los enlaces históricos a `roydanpe/odooIPS` describen el origen del trabajo, pero la referencia vigente para commits y entregables es `odooIPS-team/odooIPS`.
7. Las cifras 5 y 7 que Pages asigna a Sprint 0 y Sprint 1 corresponden a issues reconstruidas, no a commits. El historial contiene 30 commits en Sprint 0 y 3 en la ventana de Sprint 1.

## Cambios consolidados alcanzados al finalizar Sprint 1

- Se seleccionó Odoo 19 Community como producto open source viable bajo LGPL-3.
- Se delimitó Ventas como módulo principal y Compras como análisis complementario.
- Se definieron objetivo, integrantes, liderazgo rotativo, roles iniciales y herramientas.
- Se creó la portada inicial de GitHub Pages y se conectó la documentación disponible.
- Se construyó el cronograma maestro de Sprint 0 a Sprint 4 y de los tres hitos.
- Se documentaron alcance, complejidad y arquitectura inicial del módulo de Ventas.
- Se creó y estabilizó Docker Compose con Odoo 19, PostgreSQL 15, red, volúmenes y montaje de addons.
- Se verificó el acceso local a Odoo en el puerto 8069.
- Se prepararon ramas y evidencias de ejecución del entorno.
- Se documentaron dependencias, modelos, estados, métodos y vistas del módulo `sale`.
- Se produjo un análisis separado de `sale` y `purchase` en una rama remota.
- Se dejó una validación CI inicial de Docker Compose, posteriormente sustituida por el workflow principal.
- Se consolidó retrospectivamente el informe técnico del Sprint 1 con evidencias visuales.

## Conclusión de la auditoría inicial

Sprint 0 y Sprint 1 cumplieron su propósito de reducir incertidumbre antes de
la implementación. Al concluir estas etapas ya existían una selección de
producto jurídicamente viable, un alcance funcional, una organización Scrum,
un cronograma, un entorno reproducible y conocimiento suficiente de la
arquitectura de Ventas para elegir `action_confirm`, `sale.order` y
`sale.order.line` como puntos de extensión.

El historial también muestra debilidades de proceso: mensajes de commit poco
descriptivos, numerosas correcciones mínimas sobre la portada, evidencia
registrada fuera de fecha y entregables que permanecieron en una rama sin
integrar. La trazabilidad correcta no elimina esos hechos; los documenta y
explica cómo los resultados tempranos sirvieron de base para la implementación
de los sprints posteriores.
