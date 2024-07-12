pipeline {
    agent any

    def DOCKER_IMAGE = "mvn-hello-world"
    def DOCKER_REGISTRY = "localhost:8081/repository/mvn-hello/"
    def NEXUS_CREDENTIALS = "nexus"

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

        stage('Pushing to nexus repo'){
            docker.withRegistry("http://${DOCKER_REGSITRY}", "${NEXUS_CREDENTIALS}") {
                docker.image("${DOCKER_IMAGE}:latest").push()
            }

            echo "successfully added  to nexus"
    
        }
    }
}
