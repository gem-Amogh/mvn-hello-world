pipeline {
    agent any

    environment {
        // Define the Nexus repository URL and your Docker image name/tag
        KUBE_CONFIG_PATH = 'C:\Users\Amogh.Malviya\.kube\config'
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
                git url:'https://github.com/gem-Amogh/mvn-hello-world.git', branch:'main'
                echo "Clone done"
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
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }  

        stage('Push Docker image to Nexus') {
            steps {
                script {
                    // Push Docker image to Nexus repository
                    docker.withRegistry('http://localhost:8082/repository/mvn-hello/', 'nexus') {
                        docker.image("${DOCKER_IMAGE}:latest").push()
                    }
                    echo "Successfully pushed to Nexus repository"
                }
            }
        }

        stage('Deploy to Minikube') {
        withEnv(["KUBECONFIG=${KUBE_CONFIG_PATH}"]) {
            bat "kubectl version"
        }
        echo "Deployment Successful....."
        }

        
        
    }
}
