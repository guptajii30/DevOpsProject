<<<<<<< HEAD
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
=======
pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'javaimg'
        CONTAINER_NAME = 'java_container'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat 'docker build -t %DOCKER_IMAGE% .'
                }
            }
        }
        
        stage('Deploy with Ansible') {
            steps {
                script {
                    bat '''
                    docker run --rm -v "%CD%:/ansible" willhallonline/ansible \
                    ansible-playbook /ansible/devopsdeploy.yml -vvv
                    '''
                }
            }
        }
    }
}
>>>>>>> 50b062b397e87e70ed26c43a884f6aca69fb83ab
