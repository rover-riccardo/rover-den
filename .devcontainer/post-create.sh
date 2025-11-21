#!/bin/bash

# Post-create script for devcontainer setup
echo "Setting up development environment..."

# Make banner script executable if it exists
if [ -f /workspaces/rover-den/.devcontainer/banner.sh ]; then
    chmod +x /workspaces/rover-den/.devcontainer/banner.sh
fi

# Add banner to shell startup
if ! grep -q "banner.sh" "$HOME/.zshrc"; then
    echo "" >> "$HOME/.zshrc"
    echo "# Display welcome banner" >> "$HOME/.zshrc"
    echo "if [ -f /workspaces/rover-den/.devcontainer/banner.sh ]; then" >> "$HOME/.zshrc"
    echo "    /workspaces/rover-den/.devcontainer/banner.sh" >> "$HOME/.zshrc"
    echo "fi" >> "$HOME/.zshrc"
fi

echo "Development environment setup complete!"

# Display banner for the first time if it exists
if [ -f /workspaces/rover-den/.devcontainer/banner.sh ]; then
    /workspaces/rover-den/.devcontainer/banner.sh
fi
