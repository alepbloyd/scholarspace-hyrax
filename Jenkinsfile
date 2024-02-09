pipeline {
    agent any
    stages {
        stage('switch to master branch') {
            steps {
                dir('/opt/scholarspace/scholarspace-hyrax') {
                    sh 'pwd'
                }
                // sh 'git checkout master'
            }
        }
        // stage('pull git changes') {
        //     steps {
        //         sh 'git pull'
        //     }
        // }
    }
}

