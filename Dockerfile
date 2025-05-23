FROM python:3.10-slim

# Install required packages: Ansible, Docker CLI, and others
RUN apt-get update && apt-get install -y \
    docker.io \
    sshpass \
    git \
    curl \
    gnupg \
    && pip install ansible \
    && apt-get clean

# Set the working directory
WORKDIR /ansible

# Default command
ENTRYPOINT ["ansible-playbook"]
