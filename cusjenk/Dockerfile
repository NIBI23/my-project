# Use a Jenkins image as the base image
FROM jenkins/jenkins:lts

# Switch to root user for installations
USER root

# Install prerequisites and Docker
RUN apt-get update -y && \
    apt-get install -y apt-transport-https ca-certificates curl software-properties-common && \
    mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg && \
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian bullseye stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update -y && \
    apt-get install -y docker-ce docker-ce-cli containerd.io && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Add Jenkins user to Docker group
RUN usermod -aG docker jenkins

# Set Docker Host for Jenkins
ENV DOCKER_HOST=unix:///var/run/docker.sock

# Create Docker volume directory
RUN mkdir -p /var/lib/docker

# Expose Docker volume
VOLUME /var/lib/docker

# Switch back to Jenkins user
USER jenkins

