FROM willhallonline/ansible:latest

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io
