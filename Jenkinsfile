// Jenkinsfile - Pipeline local/alternativo de demostración
// Pipeline oficial de CI: GitHub Actions (.github/workflows/main.yml)
// Este Jenkinsfile replica localmente el mismo flujo para pruebas de infraestructura.

pipeline {
    agent any

    environment {
        COMPOSE_DIR = 'docker-config'
        COMPOSE_FILE = 'docker-compose.yml'
    }

    options {
        timeout(time: 20, unit: 'MINUTES')
        timestamps()
    }

    stages {

        stage('Checkout') {
            steps {
                echo '== Clonando el repositorio =='
                checkout scm
            }
        }

        stage('Preparación de entorno') {
            steps {
                dir("${COMPOSE_DIR}") {
                    echo '== Verificando Docker y Docker Compose =='
                    sh 'docker --version'
                    sh 'docker compose version'
                }
            }
        }

        stage('Levantar entorno (Docker Compose)') {
            steps {
                dir("${COMPOSE_DIR}") {
                    echo '== Levantando Odoo + PostgreSQL =='
                    sh 'docker compose -f ${COMPOSE_FILE} up -d'
                    sh 'docker compose -f ${COMPOSE_FILE} ps'
                }
            }
        }

        stage('Esperar a Odoo/Postgres') {
            steps {
                dir("${COMPOSE_DIR}") {
                    echo '== Esperando inicialización de Postgres y Odoo =='
                    sh 'sleep 15'
                }
            }
        }

        stage('Ejecutar pruebas del módulo') {
            steps {
                dir("${COMPOSE_DIR}") {
                    echo '== Corriendo pruebas: validacion_descuento_maximo =='
                    sh '''
                        docker compose exec -T web /entrypoint.sh odoo \
                          -d odoo_ventas \
                          -u validacion_descuento_maximo \
                          --test-enable --test-tags /validacion_descuento_maximo \
                          --stop-after-init --http-port=8070 \
                          > odoo_tests.log 2>&1 || TEST_EXIT=$?
                        cat odoo_tests.log
                        exit ${TEST_EXIT:-0}
                    '''
                }
            }
        }

        stage('Recolección de evidencia') {
            steps {
                dir("${COMPOSE_DIR}") {
                    sh 'docker compose logs > jenkins-odoo-logs.txt || true'
                }
                archiveArtifacts artifacts: 'docker-config/odoo_tests.log,docker-config/jenkins-odoo-logs.txt', allowEmptyArchive: true
            }
        }
    }

    post {
        always {
            echo '== Limpieza: apagando entorno =='
            dir("${COMPOSE_DIR}") {
                sh 'docker compose -f ${COMPOSE_FILE} down -v || true'
            }
        }
        success {
            echo 'Pipeline local ejecutado correctamente.'
        }
        failure {
            echo 'El pipeline falló. Revisar jenkins-odoo-logs.txt como evidencia.'
        }
    }
}
