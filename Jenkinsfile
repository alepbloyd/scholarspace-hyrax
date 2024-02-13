pipeline {
    agent any
    stages {
        stage('info') {
            sshagent(crendentials: ['alep-deploy']) {
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