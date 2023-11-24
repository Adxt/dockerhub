pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Clean and build your Java application
                    sh 'mvn clean install'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh 'docker build -t adxt321/firstjava:v1.0 .'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
                    }

                    // Push the Docker image to Docker Hub
                    sh 'docker push atharv321/dockerhub:v1.0'
                }
            }
        }
    }
}
