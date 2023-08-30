pipeline {
    agent any
    environment{
        DOCKERHUB_USERNAME = "amardeepgurjar"
        APP_NAME = "onlinebookstore"
        IMAGE_TAG = "${BUILD_NUMBER}"
        IMAGE_NAME = "${DOCKERHUB_USERNAME}" + "/" + "${APP_NAME}"
        REGISTRY_CREDS = 'dockerhub'
    }
    stages {
        stage('Clear Workspace'){
            steps{
                script{
                    cleanWs()
                }
            }
        }
        stage('git Checkout') {
            steps {
                script{
                    git credentialsId: 'github',
                    url: 'https://github.com/Developer-Atomic-Vishnu/Jenkins-ci-cd-java-pipeline.git',
                    branch: 'main'
                }
            }
        }
        stage('build package of application'){
            steps{
                sh 'mvn clean install'
            }
        }
        stage('build docker image'){
            steps{
                script{ 
                    docker_image = docker.build "${IMAGE_NAME}" 
                }
            }
        }
        stage('push docker image'){
            steps{
                script{
                    docker.withRegistry('',REGISTRY_CREDS){
                        docker_image.push("$BUILD_NUMBER")
                        docker_image.push('latest')
                    }
                }
            }
        }
        stage('deploying the image on vm'){
            steps{
                sh 'docker run -d -p 3000:8080 amardeepgurjar/onlinebookstore:latest'
            }
        }
    }
}
