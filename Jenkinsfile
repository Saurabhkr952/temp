pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "docker build -t saurabhkr952/jenkins-custom-img:${BUILD_NUMBER} ."
            }
        }
        stage('Test') {
                environment {
                DOCKER_IMAGE = "saurabhkr952/jenkins-custom-img:${BUILD_NUMBER}"
                REGISTRY_CREDENTIALS = credentials('docker-cred')
        }
            steps {
                def dockerImage = docker.image("${DOCKER_IMAGE}")
                docker.withRegistry('https://index.docker.io/v1/', "docker-credentials") {
                dockerImage.push()
            }
        }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}

