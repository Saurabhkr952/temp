pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh "docker build -t saurabhkr952/jenkins-custom-img:$BUILD_NUMBER ."
            }
        }
        stage('Test') {
            steps {
                echo 'deploying the application...'
                withCredentials([usernamePassword(credentialsId: 'docker-cred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh "docker.io/saurabhkr952/jenkins-custom-img:$BUILD_NUMBER"
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

