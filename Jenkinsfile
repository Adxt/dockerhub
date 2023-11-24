pipeline {
    agent any

    stages {
        stage('Build app') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Adxt/dockerhub.git']])
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
