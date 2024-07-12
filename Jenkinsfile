pipeline {
    agent any

    environment {
        // Define the Nexus repository URL and your Docker image name/tag
        NEXUS_URL = 'http://localhost:8082/repository/mvn-hello/'
        DOCKER_IMAGE = 'mvn-hello-world'
    }

    tools {
        dockerTool 'docker'
        maven 'maven' // The name you gave to the Maven installation
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the repository from GitHub
                git url:'https://github.com/gem-Amogh/mvn-hello-world.git' , branch:'main'
                echo "clone done"
            }
        }

        stage('Build Maven Project') {
            steps {
                script {
                    // Build the Maven project
                    sh 'mvn clean install'
                }
            }
        }

        
        stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t mvn-hello-world .'
                }
            }
        }  

        stage('Push Docker image to Nexus') {
            steps{
                script{
                    sh 'docker.withRegistry("http://localhost:8082/repository/mvn-hello/", "nexus") {
                docker.image("${DOCKER_IMAGE}:latest").push()'
                }
            }
                echo "Successfully pushed to nexus repository"
            }
            
    }
    }
}
