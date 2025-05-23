pipeline {
    agent any
    
    environment {
        // Docker image details
        DOCKER_IMAGE = 'javaimg'
        CONTAINER_NAME = 'java_container'
        
        // Workspace paths (for reference)
        WIN_WORKSPACE = "${WORKSPACE}"
        WSL_WORKSPACE = '/mnt/c/ProgramData/Jenkins/.jenkins/workspace/DevOpsPipeline'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE} ."
                    bat "docker images"  // Verification
                }
            }
        }
        
        stage('Deploy with Ansible') {
            steps {
                script {
                    docker.image('willhallonline/ansible:latest').inside('-v /var/run/docker.sock:/var/run/docker.sock') {
                        sh '''
                        echo "Current directory: $(pwd)"
                        ls -la
                        ansible-playbook devopsdeploy.yml -vvv
                        '''
                    }
                }
            }
            post {
                always {
                    script {
                        bat "docker ps -a"
                        bat "docker logs ${CONTAINER_NAME} || echo 'Container not found'"
                    }
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Cleanup if needed
                bat "docker rm -f ${CONTAINER_NAME} || true"
            }
        }
    }
}
