FROM ubuntu:latest

# Install Docker and Docker Compose
RUN apt-get update && apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release \
    && mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

# Create working directory
RUN mkdir -p /opt/wg

# Copy docker-compose file
COPY docker-compose.yml /opt/wg/docker-compose.yml

# Set working directory
WORKDIR /opt/wg

# Expose the WireGuard ports
EXPOSE 51820/udp
EXPOSE 51821/tcp

# Start Docker daemon and run docker compose
CMD service docker start && docker compose up

