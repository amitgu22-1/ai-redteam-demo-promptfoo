pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Start Containers') {
            steps {
                sh 'docker compose build run'
            }
        }

        stage('Pull Ollama Model') {
            steps {
                sh 'docker exec ollama ollama pull llama3'
            }
        }

        stage('Run Red Team Tests') {
            steps {
                sh 'chmod +x scripts/run-redteam.sh'
                sh './scripts/run-redteam.sh'
            }
        }

        stage('Export Metrics') {
            steps {
                sh 'chmod +x scripts/export-metrics.sh'
                sh './scripts/export-metrics.sh'
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: 'reports/report.html'
            }
        }
    }

    post {
        always {
            publishHTML([
                allowMissing: false,
                alwaysLinkToLastBuild: true,
                keepAll: true,
                reportDir: 'reports',
                reportFiles: 'report.html',
                reportName: 'AI Red Team Report'
            ])
        }
    }
}