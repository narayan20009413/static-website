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
        stage('Login') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push') {
            steps {
                sh 'docker push narayan94/test:v1'
            }
        }
    }
}