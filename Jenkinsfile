node {
    // Define environment variables
    def KUBE_CONFIG_PATH = 'C:\\Users\\Amogh.Malviya\\.kube\\config'
    def NEXUS_URL = 'http://localhost:8082/repository/mvn-hello/'
    def DOCKER_IMAGE = 'mvn-hello-world'
    def kubeConfig = credentials('k1') // Replace with your Kubernetes config credentials ID
    def dockerPath = 'C:\\Program Files\\Docker\\Docker\\resources\\bin\\docker.exe'


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
        bat "${mavenTool}/bin/mvn clean install"
    }

    // Stage: Build Docker Image
    stage('Build Docker Image') {
       
        bat "\"${dockerPath}\" build -t ${DOCKER_IMAGE}:latest ."
    }

    // Stage: Push Docker image to Nexus
   stage('Push Docker Image to Nexus') {
        bat "\"${DOCKER_PATH}\" tag ${DOCKER_IMAGE}:latest ${NEXUS_URL}${DOCKER_IMAGE}:latest"
        // Push the Docker image to Nexus repository
        bat "\"${DOCKER_PATH}\" push ${NEXUS_URL}${DOCKER_IMAGE}:latest"
        }

//     stage('Deploy to Kubernetes') {
//     // Replace with your Kubernetes config credentials ID

// //     kubernetesDeploy(
//         kubeconfigId: kubeConfig,
//         manifests: 'kubernetes.yaml', // Reference to your combined YAML file
//         enableConfigSubstitution: true
//         // No namespace specified, deploys to the default namespace
//     )
//     echo "Successfully deployed to Kubernetes"
// }

}
