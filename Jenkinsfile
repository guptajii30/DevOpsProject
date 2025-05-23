pipeline {
    agent any
    
    environment {
        // Docker configurations
        DOCKER_IMAGE = 'javaimg'
        CONTAINER_NAME = 'java_container'
        
        // Workspace paths
        WIN_WORKSPACE = "${WORKSPACE}"
        CONTAINER_WORKSPACE = "/ansible"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${DOCKER_IMAGE} ."
                    bat "docker images"  // Verify image creation
                }
            }
        }
        
        stage('Deploy with Ansible') {
            steps {
                script {
                    docker.image('willhallonline/ansible:latest').inside(
                        "-v /var/run/docker.sock:/var/run/docker.sock " +
                        "-v ${WIN_WORKSPACE}:${CONTAINER_WORKSPACE}"
                    ) {
                        sh """
                        echo "=== DEBUG INFORMATION ==="
                        echo "Current directory: \$(pwd)"
                        echo "Workspace contents:"
                        ls -la ${CONTAINER_WORKSPACE}
                        echo "========================"
                        cd ${CONTAINER_WORKSPACE}
                        ansible-playbook devopsdeploy.yml -vvv
                        """
                    }
                }
            }
            post {
                always {
                    script {
                        echo "=== DEPLOYMENT VERIFICATION ==="
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
                echo "=== CLEANUP ==="
                bat "docker rm -f ${CONTAINER_NAME} || echo 'No container to remove'"
                bat "docker image prune -f || echo 'No images to prune'"
            }
        }
    }
}
