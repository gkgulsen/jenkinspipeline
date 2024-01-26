pipeline {
    agent any
	
	tools { nodejs "node"}

    environment {
	    PATH = "/usr/local/bin:${env.PATH}"
        registry = "gkadirgil/vue-app-new"
	registryCredential = 'dockerhub_id'
	dockerImage = ''
    }

    stages {        

        stage('Build') {
            steps {
              
                sh 'npm install'
                sh 'npm run build'
            }
        }
	    stage('Deploy our image') {
steps{
	

script {
docker.withRegistry( '', registryCredential ) {
dockerImage.push()
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
