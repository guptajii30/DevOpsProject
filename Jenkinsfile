pipeline {
    agent any
    
    environment {
        GIT_REPO = 'https://github.com/guptajii30/DevOpsProject.git'
        IMAGE_NAME = 'javaimg:latest'
        CONTAINER_NAME = 'java_container'
        WSL_ANSIBLE_SCRIPT = '/mnt/e/devopsprj/devopsdeploy.yml'  // Update if needed
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${IMAGE_NAME} ."
                }
            }
        }
        
        stage('Deploy with Ansible') {
    steps {
        script {
            // Run Ansible inside a Docker container
            docker.image('willhallonline/ansible:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                sh 'ansible-playbook devopsdeploy.yml'
            }
        }
    }
}
}
