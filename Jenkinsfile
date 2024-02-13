pipeline {
    agent any
    stages {
        stage('info') {
            steps('info') {
                sshagent(credentials: ['alep-deploy']) {
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