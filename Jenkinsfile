pipeline {
    agent any

    environment {
        // Define environment variables here
        IMAGE_NAME = 'html-profile'
        CONTAINER_NAME = 'my-profile'
        PORT = '8080'
    }

    stages {
        stage ('checkout code') {
            steps {
                    checkout scm
            }
        }
        stage ('build docker image') {
            steps {
                script {
                    // Build the Docker image
                    sh "docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        stage ('stop running container') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh """
                    if [ \$(docker ps -aq -f name=$CONTAINER_NAME) ]; then
                      docker stop $CONTAINER_NAME
                      docker rm $CONTAINER_NAME
                    fi
                    """
                }            }
        }
        stage ('Run Docker Container') {
            steps {
                script {
                    // Run the Docker container
                    sh "docker run -d --name ${CONTAINER_NAME} -p ${PORT}:${PORT} ${IMAGE_NAME}"
                }
            }
        }
    }
    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}