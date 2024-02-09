pipeline {
    agent any
    stages {
        stage('switch scholarspace folder') {
            steps {
                sh 'cd /opt && ls -l'
                sh 'pwd'
                sh 'whoami'
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /