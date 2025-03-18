FROM node:slim

# Add OCI labels for the image
LABEL org.opencontainers.image.source="https://github.com/mcp-ui/sandbox-docker"
LABEL org.opencontainers.image.description="Docker image with Node.js and uv package manager"
LABEL org.opencontainers.image.licenses="MIT"

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies, uv, and clean up in a single layer to reduce image size
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    git \
    wget \
    python3 \
    python3-pip \
    ca-certificates \
    # Install uv
    && curl -LsSf https://astral.sh/uv/install.sh | sh \
    && echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc \
    # Clean up
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/* /var/tmp/*

# Add .local/bin to PATH (where uv installs by default)
ENV PATH="/root/.local/bin:/root/.cargo/bin:${PATH}"

# Verify installations
RUN node --version && \
    uv --version

WORKDIR /app

CMD ["bash"]
