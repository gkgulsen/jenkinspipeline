pipeline {
    agent any
   

    environment {
        PATH = "/usr/local/bin:${env.PATH}"		
        DOCKER_HUB_CREDENTIALS = credentials('PIPELINE_SECRET_TEXT')
        DOCKER_IMAGE = 'gkadirgil/vuejs-app-2' 
    }

    stages {        

        stage('Build') {
            steps {              
                sh 'sudo apt-get update && apt-get install -y npm'
                sh 'npm install'
                sh 'npm run build'
            }
        }       

        stage('Deploy') {
            steps {
                
                script {
                    docker.withRegistry('', DOCKER_HUB_CREDENTIALS) {                        
                        def customImage = docker.build(DOCKER_IMAGE, '-f path/to/Dockerfile ./')                        
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
