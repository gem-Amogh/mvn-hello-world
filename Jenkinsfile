pipeline {
    agent any

    environment {
        // Define the Nexus repository URL and your Docker image name/tag
        NEXUS_URL = 'https://localhost:8081/repository/mvn-hello/'
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

        stage('Push Docker Image to Nexus') {
            steps {
                script {
                    // Authenticate with Nexus using credentials
                    
                        // Tag the Docker image for Nexus registry
                        

                        // Push Docker image to Nexus registry
                        sh "docker push $NEXUS_URL/$DOCKER_IMAGE"
                    
                }
            }
        }
    }
}
