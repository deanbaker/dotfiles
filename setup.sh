#!/bin/bash

# Install Xcode CLI Tools
xcode-select --install

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshrc
source ~/.zshrc

# Install Brew packages
brew bundle --file=./Brewfile

# Set up NVM
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"' >> ~/.zshrc
echo '[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"' >> ~/.zshrc
source ~/.zshrc
nvm install --lts
nvm use --lts

# Configure Git
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
git config --global pull.rebase true

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sed -i '' 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker kubectl)/g' ~/.zshrc
source ~/.zshrc

# Link dotfiles
echo "Linking dotfiles..."
ln -sf ~/dotfiles/configs/.vimrc ~/.vimrc
ln -sf ~/dotfiles/configs/.zshrc ~/.zshrc
ln -sf ~/dotfiles/configs/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/configs/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/configs/.aliases ~/.aliases
ln -sf ~/dotfiles/configs/.functions ~/.functions

# Set up Neovim
echo "Setting up Neovim..."
mkdir -p ~/.config
ln -sf ~/dotfiles/configs/nvim ~/.config/nvim
echo "Neovim config symlinked. Run 'nvim' and wait for plugins to install on first launch."

# Set up Vim (legacy)
echo "Setting up Vim..."
bash ~/dotfiles/scripts/setup-vim.sh

echo "Setup complete! Restart your terminal."
echo "Next steps:"
echo "1. Open Neovim with 'nvim' - plugins will auto-install"
echo "2. In Neovim, run ':Mason' to install language servers"
echo "3. Restart Neovim after plugin installation completes"