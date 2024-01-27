pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:${env.PATH}"
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub_id')
        DOCKER_IMAGE = 'gkadirgil/vuejs-projem'  // Docker Hub kullanıcı adınızı ekleyin
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Vue.js projesini build et
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Docker Hub'a imajı gönder
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {
                        def customImage = docker.build(DOCKER_IMAGE, '.')
                        customImage.push()
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Build and deployment succeeded!'
        }
        failure {
            echo 'Build or deployment failed!'
        }
    }
}
