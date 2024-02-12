pipeline {
    agent any
    stages {
        stage('switch to scholarspace folder') {
            steps {
                sh 'cd /opt/scholarspace/scholarspace-hyrax'
                sh 'ls -l'
                sh 'whoami'
            }
        }
        stage('stop docker containers') {
            steps {
                sh 'docker-compose down'
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /