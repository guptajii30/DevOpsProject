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
                    // Execute as your WSL user with proper path
                    bat """
                    wsl -u ganesh -e bash -c \
                    'cd ${WSL_WORKSPACE} && ansible-playbook devopsdeploy.yml'
                    """
                }
            }
        }
    }
}
