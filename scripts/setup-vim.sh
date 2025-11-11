#!/bin/bash
# Vim Setup Script
# This script installs necessary dependencies for your Vim configuration

set -e

echo "=================================="
echo "Vim Development Environment Setup"
echo "=================================="
echo ""

# Check if Homebrew is installed (macOS)
if [[ "$OSTYPE" == "darwin"* ]]; then
    if ! command -v brew &> /dev/null; then
        echo "❌ Homebrew not found. Please install it first:"
        echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
        exit 1
    fi
    echo "✓ Homebrew found"
fi

# Install fzf
echo ""
echo "Installing fzf (fuzzy finder)..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install fzf
    $(brew --prefix)/opt/fzf/install --all
else
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --all
fi
echo "✓ fzf installed"

# Install ripgrep
echo ""
echo "Installing ripgrep (fast search)..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ripgrep
else
    echo "Please install ripgrep manually for your system"
fi
echo "✓ ripgrep installed"

# Install Node.js (required for CoC)
echo ""
echo "Checking Node.js..."
if ! command -v node &> /dev/null; then
    echo "Installing Node.js..."
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew install node
    else
        echo "Please install Node.js manually from https://nodejs.org/"
        exit 1
    fi
else
    echo "✓ Node.js already installed ($(node --version))"
fi

# Install Python tools
echo ""
echo "Installing Python development tools..."
pip3 install --user flake8 pylint black isort 2>/dev/null || echo "⚠ Python tools installation failed (may need to install manually)"

# Install Java tools (optional)
echo ""
echo "Checking Java..."
if command -v java &> /dev/null; then
    echo "✓ Java found ($(java -version 2>&1 | head -n 1))"
else
    echo "⚠ Java not found. Install JDK for Java development."
fi

# Install Kotlin tools (optional)
echo ""
echo "Checking Kotlin..."
if [[ "$OSTYPE" == "darwin"* ]]; then
    brew install ktlint 2>/dev/null || echo "⚠ ktlint installation skipped"
fi

# Install vim-plug
echo ""
echo "Installing vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "✓ vim-plug installed"

# Install Nerd Fonts (optional but recommended for icons)
echo ""
echo "Would you like to install Nerd Fonts for better icons? (y/n)"
read -r response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
        brew tap homebrew/cask-fonts
        brew install --cask font-hack-nerd-font
        echo "✓ Nerd Fonts installed"
        echo "⚠ Remember to set your terminal font to 'Hack Nerd Font'"
    else
        echo "Please install Nerd Fonts manually from https://www.nerdfonts.com/"
    fi
fi

echo ""
echo "=================================="
echo "Setup Complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Open Vim: vim"
echo "2. Install plugins: :PlugInstall"
echo "3. Restart Vim"
echo ""
echo "Optional: Install additional language servers in Vim:"
echo "  :CocInstall coc-pyright    (Better Python support)"
echo "  :CocInstall coc-java       (Java support)"
echo ""
echo "Key mappings cheat sheet:"
echo "  <Space>      = Leader key"
echo "  <Space>n     = Toggle file tree"
echo "  <Space>ff    = Find files"
echo "  <Space>fr    = Search in files"
echo "  gd           = Go to definition"
echo "  K            = Show documentation"
echo "  <Space>rn    = Rename symbol"
echo ""
echo "Happy coding! 🚀"
