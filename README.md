# sandbox-docker
Docker image for generic sandbox with Node.js and uv package manager.

## Features

- Latest Node.js
- [uv package manager](https://docs.astral.sh/uv/getting-started/installation/)

## Usage

You can pull the image from GitHub Container Registry:

```bash
docker pull ghcr.io/OWNER/sandbox-docker:latest
```

Replace `OWNER` with your GitHub username or organization name.

## GitHub Actions

This repository includes a GitHub Action workflow that automatically builds and pushes the Docker image to GitHub Container Registry whenever changes are pushed to the main branch.

## Building Locally

To build the Docker image locally:

```bash
docker build -t sandbox-docker .
```
