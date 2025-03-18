FROM node:latest

# Add OCI labels for the image
LABEL org.opencontainers.image.source="https://github.com/mcp-ui/sandbox-docker"
LABEL org.opencontainers.image.description="Docker image with Node.js and uv package manager"
LABEL org.opencontainers.image.licenses="MIT"

# Install dependencies needed for uv, common dev tools, and Chromium
RUN apt-get update && apt-get install -y \
    curl \
    git \
    wget \
    gnupg \
    build-essential \
    python3 \
    python3-pip \
    zip \
    unzip \
    chromium \
    chromium-driver \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libx11-xcb1 \
    libxcb-dri3-0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# Set Chromium environment variables
ENV CHROME_BIN=/usr/bin/chromium
ENV CHROME_PATH=/usr/lib/chromium/
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true

# Install uv and add to PATH
RUN curl -LsSf https://astral.sh/uv/install.sh | sh && \
    echo 'export PATH="$HOME/.cargo/bin:$PATH"' >> ~/.bashrc

# Add .local/bin to PATH (where uv installs by default)
ENV PATH="/root/.local/bin:/root/.cargo/bin:${PATH}"

# Verify installations
RUN node --version && \
    uv --version && \
    chromium --version

WORKDIR /app

CMD ["bash"]
