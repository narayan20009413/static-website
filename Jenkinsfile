pipeline {
    agent any
    stages {
        stage('Clone repository') {
            steps {
                git 'https://github.com/narayan20009413/static-website.git'
            }
        }
        stage('Build Docker image') {
            steps {
                sh 'docker build -t test:v1 .'
            }
        }
    }
}