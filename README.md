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

### Option 1: Using VS Code

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

### Option 2: Using DevContainer CLI

You can use the DevContainer CLI to build and run the container without VS Code:

1. Install the DevContainer CLI:
   ```bash
   npm install -g @devcontainers/cli
   ```

2. Build and open the container:
   ```bash
   devcontainer up --workspace-folder .
   ```

3. Execute commands in the container:
   ```bash
   devcontainer exec --workspace-folder . bash
   ```

4. Stop the container:
   ```bash
   docker stop <container-name>
   ```

### Option 3: Using GitHub Codespaces

Use this devcontainer directly in GitHub Codespaces:

1. **Via GitHub Web UI:**
   - Go to your repository on GitHub
   - Click the green "Code" button
   - Select "Codespaces" tab
   - Click "Create codespace on main"

2. **Via GitHub CLI:**
   ```bash
   # Install GitHub CLI if not already installed
   # brew install gh  # macOS
   # sudo apt install gh  # Ubuntu/Debian

   # Create a codespace
   gh codespace create --repo USERNAME/rover-den

   # List codespaces
   gh codespace list

   # Connect to codespace in VS Code
   gh codespace code

   # Or SSH into codespace
   gh codespace ssh
   ```

3. The codespace will automatically use the devcontainer configuration and be ready in minutes!

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

## License

MIT
