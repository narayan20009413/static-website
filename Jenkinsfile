pipeline {
    agent any

    environment {
       DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }

    stages {

        stage('Clone repository') {
            steps {
                 git branch: 'main', url: 'https://github.com/narayan20009413/static-website.git'
            }
        }

        stage('Build Docker image') {
            steps {
                sh 'docker build -t narayan94/test:v1 .'
            }
        }

        stage('Login to Dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push image to Dockerhub reposiory') {
            steps {
                sh 'docker push narayan94/test:v1'
            }
        }

        stage('Integrate Jenkins with EKS Cluster') {
            steps {
                withAWS(credentials: 'aws-credentials', region: 'us-east-1') {
                  script {
                    sh ('aws eks update-kubeconfig --name EKS-cluster-major-project-cluster --region us-east-1')
                  }
                }
            }
        }

        stage('Deploy to Image to EKS cluster') {
            steps {
                  script {
                    sh "kubectl -n web-ns apply -f static-web-deploy.yaml"
                    sh "kubectl -n web get svc"
                }
            }
        }
    }
}