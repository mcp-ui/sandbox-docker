# sandbox-docker
Docker images for generic sandbox with Node.js and uv package manager.

## Available Images

This repository provides two Docker images:

### Base Image (Default)
- Node.js (slim version)
- [uv package manager](https://docs.astral.sh/uv/getting-started/installation/)
- Python 3 and git for development
- Optimized for size (440MB)

### Chrome Image
- All features of the base image
- Chromium browser and WebDriver
- Larger size (~1.1GB)

## Usage

You can pull either image from GitHub Container Registry:

```bash
# Base image
docker pull ghcr.io/mcp-ui/sandbox-docker:latest

# Chrome image
docker pull ghcr.io/mcp-ui/sandbox-docker-chrome:latest
```

## GitHub Actions

This repository includes GitHub Action workflows that automatically build and push both Docker images to GitHub Container Registry whenever changes are pushed to the main branch.

## Building Locally

To build the Docker images locally:

```bash
# Build base image
docker build -t sandbox-docker .

# Build Chrome image
docker build -t sandbox-docker-chrome -f Dockerfile.chrome .
```
