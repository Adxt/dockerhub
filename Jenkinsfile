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

        stage('Build docker image'){
            steps{
                script{
                    bat 'docker build -t jenkinsjavaapp .'
                }
            }
        }
        stage('Change image tag'){
            steps{
                script{
                    bat 'docker tag jenkinsjavaapp atharv321/dockerhub:v1.0'
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-credentials', usernameVariable: 'DOCKERHUB_USERNAME', passwordVariable: 'DOCKERHUB_PASSWORD')]) {
                        bat "docker login -u atharv321 -p atharv@321"
                    }

                    // Push the Docker image to Docker Hub
                    sh 'docker push atharv321/dockerhub:v1.0'
                }
            }
        }
    }
}
