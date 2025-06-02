# 🚀 Developer Environment Setup

Automated setup for a **Java/Kotlin/Node.js** development environment on macOS (with optional Linux/WSL2 support).  
Pre-configured with tools, dotfiles, and scripts for a seamless workflow.

![Terminal Preview](https://via.placeholder.com/800x400.png?text=Terminal+Preview+with+Zsh+%26+Neovim) *(Optional: Add a screenshot later)*

## ✨ Features

- **One-Command Setup**: Run `./setup.sh` to install everything.
- **Brewfile**: All Homebrew packages (CLI tools, apps, fonts).
- **Dotfiles**: Pre-configured for Zsh, Git, VS Code, Tmux, and more.
- **Modular**: Easy to add/remove tools or configurations.

## 🛠️ What’s Included

| Category       | Tools/Configs                                                                 |
|----------------|------------------------------------------------------------------------------|
| **Core**       | Zsh, Oh My Zsh, Git, Homebrew, SSH                                          |
| **Languages**  | Java (OpenJDK), Kotlin, Node.js (via NVM), Python                           |
| **Dev Tools**  | VS Code, IntelliJ IDEA, Docker, Kubernetes (kubectl, helm), Postgres, Redis |
| **Productivity**| Tmux, Neovim, Fira Code font, custom aliases/functions                      |

---

## 🚀 Quick Start

### 1. Clone the Repo
```bash
git clone https://github.com/dean-baker/dotfiles.git ~/dotfiles
cd ~/dotfiles


# 2. Make setup executable and run

chmod +x setup.sh
./setup.sh
```

# Keep things up to date
## Update Brewfile with currently installed packages
brew bundle dump --file=Brewfile --force

## Backup VS Code extensions
code --list-extensions > vscode/extensions.txt

## Restore VS Code extensions
cat vscode/extensions.txt | xargs -L 1 code --install-extension