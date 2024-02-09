pipeline {
    agent any
    stages {
        stage('switch to master branch') {
            steps {
                sh 'git checkout master'
            }
        }
        stage('pull git changes') {
            steps {
                sh 'git pull'
            }
        }
    }
}