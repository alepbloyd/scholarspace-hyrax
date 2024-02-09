pipeline {
    agent any
    stages {
        stage('switch scholarspace folder') {
            steps {
                sh 'cd /opt/scholarspace/scholarspace-hyrax'
                sh 'pwd'
                sh 'ls -l'
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /