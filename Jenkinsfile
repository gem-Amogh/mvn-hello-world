node {
    // Define environment variables
    def KUBE_CONFIG_PATH = 'C:\\Users\\Amogh.Malviya\\.kube\\config'
    def NEXUS_URL = 'http://localhost:8082/repository/mvn-hello/'
    def DOCKER_IMAGE = 'mvn-hello-world'

    // Define tools to be used
    def dockerTool = tool name: 'docker'
    def mavenTool = tool name: 'maven'

    // Stage: Checkout
    stage('Checkout') {
        git url: 'https://github.com/gem-Amogh/mvn-hello-world.git', branch: 'main'
        echo "Clone done"
    }

    // Stage: Build Maven Project
    stage('Build Maven Project') {
        sh "${mavenTool}/bin/mvn clean install"
    }

    // Stage: Build Docker Image
    stage('Build Docker Image') {
        sh "${dockerTool}/bin/docker build -t ${DOCKER_IMAGE} ."
    }

    // Stage: Push Docker image to Nexus
    stage('Push Docker image to Nexus') {
        docker.withRegistry("${NEXUS_URL}", 'nexus') {
            docker.image("${DOCKER_IMAGE}:latest").push()
        }
        echo "Successfully pushed to Nexus repository"
    }

    // Stage: Deploy to Minikube
    stage('Deploy to Minikube') {
        withEnv(["KUBECONFIG=${KUBE_CONFIG_PATH}"]) {
            sh "kubectl version"
        }
        echo "Deployment Successful....."
    }
}
