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
                    sh "docker image push saurabhkr952/jenkins-custom-img:$BUILD_NUMBER"
            }
        }
        }
        stage("checkout mainfest repo") {
            steps {
                git credentialsId: 'github-credentials', 
                url: 'https://github.com/Saurabhkr952/counter-demo-app-manifest-Helm.git',
                branch: 'main'
            }
        }
        stage("Update k8s manifest Repo") {
            steps {
                echo "pushing updated manifest to repository"
                withCredentials([usernamePassword(credentialsId: 'github-credentials', passwordVariable: 'git-token', usernameVariable: 'username')]) {
                    sh " sed -i 's+saurabhkr952/jenkins-custom-img:.*+saurabhkr952/jenkins-custom-img:$BUILD_NUMBER+g' kubernetes_manifests/temp-jenkins/templates/deployment.yaml"
                    sh "git add -A"
                    sh "git commit -m 'Updated image tag | Image Version=$BUILD_NUMBER'"
                    sh "git remote -v"
                    sh "git push https://$git-token@github.com/Saurabhkr952/counter-demo-app-manifest-Helm.git HEAD:main"
            }
        }
        }
    }
}


