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
        
        stage('Deploy with Ansible on WSL') {
            steps {
                script {
                    bat "wsl ansible-playbook ${WSL_ANSIBLE_SCRIPT}"
                }
            }
        }
    }
}
