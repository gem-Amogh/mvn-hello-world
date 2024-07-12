pipeline {
    agent any

    tools {
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

        stage('Build docker image') {
            steps {
                script {
                    // Build the Maven project
                    sh 'docker container ls'
                }
            }
        }
    }
}
