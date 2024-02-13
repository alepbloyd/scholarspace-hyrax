pipeline {
    agent any
    stages {
        stage('info') {
            steps('info') {
                sshagent(['alex-dev']) {
                    sh 'whoami'
                    sh 'ls -l'
                }
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /