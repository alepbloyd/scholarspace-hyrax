pipeline {
    // agent { docker { image 'ruby:3.3.0-alpine3.19' } }
    agent { 
        dockerfile true
    }
    stages {
        stage('info') {
            steps {
                sh 'echo pwd'
            }
        }
    }
}