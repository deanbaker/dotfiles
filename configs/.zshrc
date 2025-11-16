# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting docker kubectl)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Load custom configurations
[ -f ~/.aliases ] && source ~/.aliases
[ -f ~/.functions ] && source ~/.functions

# Neovim aliases - redirect vi/vim to nvim
alias vi="nvim"
alias vim="nvim"
alias vimdiff="nvim -d"

# NVM Configuration
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"

# Java Home Configuration
# export JAVA_HOME=$(/usr/libexec/java_home)

# Add local bin to PATH
export PATH="$HOME/.local/bin:$PATH"

# Added by Windsurf
export PATH="/Users/dean/.codeium/windsurf/bin:$PATH"

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias claude="/Users/dean/.claude/local/claude"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/dean/.lmstudio/bin"
# End of LM Studio CLI section

export GOOGLE_DRIVE_OAUTH_PATH=~/.config/goose/mcp-gdrive/gcp-oauth.keys.json
