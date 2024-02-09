pipeline {
    agent any
    stages {
        stage('switch to master branch') {
            steps {
                dir('/opt/scholarspace/scholarspace-hyrax') {
                    sh 'docker ps'
                }
            }
        }
    }
}

// clobber assets
// precompile assets
// passenger-config restart-app /