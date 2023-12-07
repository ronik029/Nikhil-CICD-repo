pipeline {
    agent { 
        node {
            label 'docker-agent-alpine'
            }
      }
    triggers {
        pollSCM '* * * * *'
    }
    stages {
        stage('Build') {
            steps {
                echo "Building.."
                sh '''
                apk update
                apk add docker docker-compose curl unzip 
                groupadd docker
                usermod -aG docker $USER
                '''
            }
        }
        stage('Test') {
            steps {
                echo "Testing.."
                sh '''
                cd gluon_forwarder
                docker build -t forwarder .
                '''
            }
        }
        stage('Deliver') {
            steps {
                echo 'Deliver....'
                sh '''
                echo "doing delivery stuff.."

                '''
            }
        }
    }
}