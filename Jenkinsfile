pipeline {
    agent any
    
    environment {
        DOCKER_IMAGE = 'javaimg'
        CONTAINER_NAME = 'java_container'
        // Add Windows path to Docker CLI
        DOCKER_CLI_PATH = 'C:/Program Files/Docker/Docker/resources/bin/docker.exe'
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
                    bat """
                    docker run --rm ^
                        -v "%CD%:/ansible" ^
                        -v //var/run/docker.sock:/var/run/docker.sock ^
                        -v "%DOCKER_CLI_PATH%:/usr/bin/docker" ^
                        -e DOCKER_HOST=unix:///var/run/docker.sock ^
                        willhallonline/ansible ^
                        ansible-playbook /ansible/devopsdeploy.yml -vvv
                    """
                }
            }
        }
    }
}
