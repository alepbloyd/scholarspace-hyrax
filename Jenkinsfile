pipeline {
    // agent { docker { image 'ruby:3.3.0-alpine3.19' } }
    // agent { 
        // dockerfile true
    // }
    agent any
    stages {
        stage('info') {
            steps {
                sh 'cd /opt'
                sh 'pwd'
                sh 'ls -l'
            }
        }
        stage('prepare file structure') {
            steps {
                sh 'mkdir -p /opt/scholarspace'
                sh 'mkdir /opt/scholarspace/certs'
                sh 'mkdir /opt/scholarspace-tmp'
                sh 'mkdir /opt/scholarspace-minter'
                sh 'mkdir /opt/scholarspace/fedora-data'
                sh 'mkdir /opt/scholarspace/solr-data'
                sh 'cd /opt/scholarspace'
            }
        }
        stage('create env file') {
            steps {
                sh 'cp docker/ci.env .env'
            }
        }
        stage('start docker containers') {
            steps {
                sh 'docker compose up --wait'
            }
        }
    }
}