# 🚀 Rover Den

A comprehensive, development container environment that comes pre-configured with the most useful packages and tools for software development across multiple programming languages and platforms.

## Features

### Supported Languages & Runtimes

- **Node.js** (LTS via nvm) - JavaScript/TypeScript runtime with npm
- **Python** (3.12) - With uv for fast package management, pip, venv support
- **Go** (1.23.3) - With standard toolchain and GOPATH configured
- **Java** (21) - Microsoft OpenJDK with Maven and Gradle
- **Rust** (stable) - Complete toolchain with cargo, rustfmt, and clippy

### Development Tools

- **nvm** - Node Version Manager for managing multiple Node.js versions
- **uv** - Fast Python package installer and resolver
- **Git** - Latest version from PPA with full configuration support
- **Docker-in-Docker** - Build and run containers within the devcontainer (with Docker Compose v2)
- **jq** - Command-line JSON processor
- **Shell** - Zsh with Oh My Zsh for an enhanced terminal experience
- **Database Clients** - PostgreSQL, Redis, and SQLite clients pre-installed
- **Build Tools** - CMake, GCC, and other essential compilation tools
- **Utilities** - curl, wget, vim, nano, htop, tree, and more

### Pre-installed Packages

#### Python

- uv (fast Python package installer and resolver)
- requests, pytest, ruff, mypy
- ipython, jupyter, numpy, pandas

#### Node.js

- typescript, ts-node, nodemon
- eslint, prettier, jest

#### Go

- gopls (language server)
- golangci-lint

#### Rust

- rustfmt, clippy

## Getting Started

### Option 1: Build from Source

1. Clone this repository:

   ```bash
   git clone <repository-url>
   cd rover-den
   ```

2. Open in VS Code:

   ```bash
   code .
   ```

3. When prompted, click "Reopen in Container" or use the command palette (F1) and select "Dev Containers: Reopen in Container"

4. Wait for the container to build and initialize (first time may take several minutes)

5. You'll be greeted with the Rover Den banner showing all installed tools and versions!

6. Start coding! The environment is ready with all tools pre-installed.

### Option 2: Use Pre-built Image

You can use the pre-built multi-architecture image from GitHub Container Registry:

1. Update your `.devcontainer/devcontainer.json` to use the pre-built image:

   ```json
   {
     "image": "ghcr.io/USERNAME/rover-den:latest"
     // ... rest of configuration
   }
   ```

2. Open in VS Code and reopen in container - it will pull the pre-built image instead of building

### Building and Publishing the Image

The repository includes a GitHub Actions workflow that automatically builds and publishes the devcontainer image to GHCR.

**To trigger a build:**

1. **Via Git Tag:**

   ```bash
   git tag v1.0.0
   git push origin v1.0.0
   ```

2. **Via GitHub Actions UI:**
   - Go to Actions tab
   - Select "Build and Push Devcontainer" workflow
   - Click "Run workflow"
   - Enter version tag (e.g., `v1.0.0`)

The workflow will build for both `amd64` and `arm64` architectures and push to `ghcr.io/USERNAME/REPO:VERSION` and `ghcr.io/USERNAME/REPO:latest`.

### Port Forwarding

The following ports are automatically forwarded:

- 3000 - Common for Node.js apps (e.g., React, Express)
- 5000 - Common for Python apps (e.g., Flask)
- 8000 - Common for Python apps (e.g., Django)
- 8080 - Common for various web servers

## Customization

### Adding More Tools

Edit `.devcontainer/post-create.sh` to add additional packages or tools that should be installed during container creation.

### Changing VS Code Settings

Modify the `customizations.vscode.settings` section in `.devcontainer/devcontainer.json`.

### Adding VS Code Extensions

Add extension IDs to the `customizations.vscode.extensions` array in `.devcontainer/devcontainer.json`.

## Tips

- The container runs as the `vscode` user by default
- Your local workspace is mounted at `/workspace`
- Docker commands work inside the container (Docker-in-Docker)
- Git credentials are automatically forwarded from your host machine
- Extensions and settings are preserved across container rebuilds

## Troubleshooting

### Container fails to build

- Ensure Docker Desktop is running
- Try "Dev Containers: Rebuild Container" from the command palette

### Extensions not loading

- Reopen the container or reload the VS Code window
- Check that the Dev Containers extension is installed and up to date

### Slow performance

- Allocate more resources to Docker Desktop in settings
- Consider using a .dockerignore file for large projects

## License

MIT
