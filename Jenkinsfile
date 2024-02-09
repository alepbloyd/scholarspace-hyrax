pipeline {
    agent any
    stages {
        stage('switch to master branch') {
            steps {
                sh 'chmod +x /opt/scholarspace/scholarspace-hyrax/script.sh'
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /