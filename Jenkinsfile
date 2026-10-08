pipeline {
    agent any
 
 
    stages {
 
        stage('Checkout') {
            steps {
                git branch: 'main',
                    credentialsId: 'git-creds',
                    url: 'https://github.com/chethan237/smart--task-managemet-system.git'
            }
        }
 
        stage('Install Dependencies') {
            steps {
                sh '''
                npm install
                '''
            }
        }
 
        stage('Build Docker Images') {
            steps {
                sh '''
                docker compose build
                '''
            }
        }
         
         stage('Terraform Deploy') {
            steps {
               sh '''
               cd terraform
               terraform init
               terraform apply -auto-approve
               '''
           }
      }
 
        stage('Helm Lint') {
            steps {
                sh '''
                helm lint helm/frontend
                helm lint helm/api-gateway
                helm lint helm/auth-service
                helm lint helm/task-service
                helm lint helm/notification-service
                helm lint helm/report-service
                helm lint helm/smart-task
                '''
            }
        }
 
        stage('Verify Docker Images') {
            steps {
                sh '''
                docker images | grep smart-task || true
                '''
            }
        }
    }
 
    post {
        success {
            echo 'CI Pipeline completed successfully!'
        }
 
        failure {
            echo 'CI Pipeline failed. Check the failed stage.'
        }
    }
}
