pipeline {
    agent any
    stages {
        stage('switch to scholarspace folder') {
            steps {
                dir('/opt/scholarspace/scholarspace-hyrax') {
                    sh 'ls -l'
                    sh 'whoami'
                    sh 'ls -l /opt/scholarspace'
                }
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /