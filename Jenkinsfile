pipeline {
    agent any
    tools { nodejs "node"}
    stages {
        stage('Install Dependencies') {
            steps {
                // Checkout your Vue.js project from version control
                // Replace the placeholder with your version control commands
                sh 'npm install'
            }
        }
        stage('Master') {
            steps {
                // Run tests for the Vue.js project
                sh 'npm run serve'
            }
        }
        
      
    }
}
