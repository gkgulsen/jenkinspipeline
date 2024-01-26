pipeline {
    agent any
	
	tools { nodejs "node"}

    environment {
        PATH = "/usr/local/bin:${env.PATH}"		
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub_id')
        DOCKER_IMAGE = 'gkadirgil/vuejs-app-2' 
    }

    stages {        

        stage('Build') {
            steps {
              
                sh 'npm install'
                sh 'npm run build'
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
