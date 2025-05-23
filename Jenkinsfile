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
                    docker run --rm -v "%CD%:/ansible" -v //var/run/docker.sock:/var/run/docker.sock willhallonline/ansible \
                    ansible-playbook /ansible/devopsdeploy.yml -vvv
                    '''
                }
            }
        }
    }
}
