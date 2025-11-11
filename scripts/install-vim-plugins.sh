#!/bin/bash
# Install Vim plugins automatically

echo "=================================="
echo "Installing Vim Plugins"
echo "=================================="
echo ""

# Check if .vimrc exists
if [ ! -f ~/.vimrc ]; then
    echo "❌ .vimrc not found. Please link it first:"
    echo "   ln -sf ~/dotfiles/configs/.vimrc ~/.vimrc"
    exit 1
fi

# Check if vim-plug is installed
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "✓ vim-plug installed"
else
    echo "✓ vim-plug already installed"
fi

echo ""
echo "Installing Vim plugins..."
echo "This may take a few minutes..."
echo ""

# Install plugins non-interactively
vim +PlugInstall +qall

echo ""
echo "=================================="
echo "Vim Plugins Installed!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Open Vim: vim"
echo "2. Check plugin status: :PlugStatus"
echo "3. Install additional CoC extensions (optional):"
echo "   :CocInstall coc-pyright"
echo "   :CocInstall coc-java"
echo ""
echo "See ~/dotfiles/docs/vim-cheatsheet.md for keybindings"
echo ""
