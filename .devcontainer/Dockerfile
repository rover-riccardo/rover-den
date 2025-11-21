# Base image with Ubuntu
FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Set non-interactive frontend for apt
ENV DEBIAN_FRONTEND=noninteractive

# Install system packages and dependencies
RUN apt-get update && apt-get -y install --no-install-recommends \
    build-essential \
    cmake \
    curl \
    wget \
    vim \
    nano \
    htop \
    tree \
    jq \
    postgresql-client \
    redis-tools \
    sqlite3 \
    ca-certificates \
    gnupg \
    git \
    zsh \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install Oh My Zsh for vscode user
USER vscode
RUN sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true

USER root
RUN chsh -s $(which zsh) vscode || true

# Install Python 3.12
RUN apt-get update \
    && apt-get -y install --no-install-recommends software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa -y \
    && apt-get update \
    && apt-get -y install --no-install-recommends \
    python3.12 \
    python3.12-venv \
    python3.12-dev \
    python3-pip \
    && update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1 \
    && update-alternatives --install /usr/bin/python python /usr/bin/python3.12 1 \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install uv (fast Python package installer) and Python packages
USER vscode
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && export PATH="/home/vscode/.local/bin:$PATH" \
ENV PATH=/home/vscode/.local/bin:$PATH

USER root

# Install Node.js (LTS) via nvm
USER vscode
ENV NVM_DIR=/home/vscode/.nvm
RUN mkdir -p $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install --lts \
    && nvm alias default lts/* \
    && nvm use default

# Add Node.js to PATH
ENV PATH=$NVM_DIR/versions/node/default/bin:$PATH

# Install common Node.js packages globally
RUN . $NVM_DIR/nvm.sh \
    && npm install -g \
    typescript \
    ts-node \
    nodemon \
    eslint \
    prettier \
    jest

USER root

# Install Go (multi-arch support)
ENV GO_VERSION=1.23.3
RUN ARCH="$(dpkg --print-architecture)" \
    && case "$ARCH" in \
        amd64) GOARCH='amd64' ;; \
        arm64) GOARCH='arm64' ;; \
        armhf) GOARCH='armv6l' ;; \
        *) echo "Unsupported architecture: $ARCH" && exit 1 ;; \
    esac \
    && wget -q https://go.dev/dl/go${GO_VERSION}.linux-${GOARCH}.tar.gz \
    && tar -C /usr/local -xzf go${GO_VERSION}.linux-${GOARCH}.tar.gz \
    && rm go${GO_VERSION}.linux-${GOARCH}.tar.gz
ENV PATH=/usr/local/go/bin:$PATH
ENV GOPATH=/home/vscode/go
ENV PATH=$GOPATH/bin:$PATH

# Install useful Go tools
USER vscode
RUN /usr/local/go/bin/go install golang.org/x/tools/gopls@latest \
    && /usr/local/go/bin/go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest

USER root

# Install Rust
USER vscode
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain stable --profile default
ENV PATH=/home/vscode/.cargo/bin:$PATH

# Install common Rust tools
RUN /home/vscode/.cargo/bin/rustup component add rustfmt clippy

USER root

# Install SDKMAN! and Java tools (multi-arch support)
USER vscode
ENV SDKMAN_DIR=/home/vscode/.sdkman
RUN curl -s "https://get.sdkman.io" | bash \
    && bash -c "source $SDKMAN_DIR/bin/sdkman-init.sh \
    && sdk install java 21.0.1-tem \
    && sdk install maven \
    && sdk install gradle"

# Set up SDKMAN! environment
ENV PATH=$SDKMAN_DIR/candidates/java/current/bin:$SDKMAN_DIR/candidates/maven/current/bin:$SDKMAN_DIR/candidates/gradle/current/bin:$PATH
ENV JAVA_HOME=$SDKMAN_DIR/candidates/java/current

# Set up workspace
WORKDIR /workspace

# Switch to vscode user
USER vscode

# Keep container running
CMD ["sleep", "infinity"]
