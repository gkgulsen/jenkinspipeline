pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                // Checkout your Vue.js project from version control
                // Replace the placeholder with your version control commands
                sh 'git clone https://github.com/gkgulsen/jenkinspipeline.git'
            }
        }
        
        stage('Build') {
            steps {
                // Install dependencies and build the Vue.js project
                sh 'npm install'
                sh 'npm run build'
            }
        }
        
        stage('Test') {
            steps {
                // Run tests for the Vue.js project
                sh 'npm run test'
            }
        }
        
        stage('Deploy') {
            steps {
                // Deploy the Vue.js project to a server or hosting platform
                // Replace the placeholder with your deployment commands
                sh 'npm run deploy'
            }
        }
    }
}
