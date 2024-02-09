pipeline {
    // agent { docker { image 'ruby:3.3.0-alpine3.19' } }
    // agent { 
        // dockerfile true
    // }
    agent any
    stages {
        stage('info') {
            steps {
                sh 'docker compose up -d --no-color --wait'
                sh 'docker compose ps'
            }
        }
    }
}