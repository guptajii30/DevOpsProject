pipeline {
    agent any
    
    environment {
        // Use Jenkins workspace path converted to WSL format
        WSL_WORKSPACE = '/mnt/c/ProgramData/Jenkins/.jenkins/workspace/DevOpsPipeline'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t javaimg .'
                }
            }
        }
        
      stage('Deploy with Ansible') {
    steps {
        script {
            docker.image('willhallonline/ansible:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                sh 'ansible-playbook devopsdeploy.yml'
                }
            }
        }
    }
}
