# 🚀 Developer Environment Setup

Automated setup for a **Java/Kotlin/Node.js** development environment on macOS (with optional Linux/WSL2 support).  
Pre-configured with tools, dotfiles, and scripts for a seamless workflow.

![Terminal Preview](https://via.placeholder.com/800x400.png?text=Terminal+Preview+with+Zsh+%26+Vim) *(Optional: Add a screenshot later)*

## ✨ Features

- **One-Command Setup**: Run `./setup.sh` to install everything.
- **Brewfile**: All Homebrew packages (CLI tools, apps, fonts).
- **Dotfiles**: Pre-configured for Zsh, Git, Vim, Tmux, and more.
- **Modular**: Easy to add/remove tools or configurations.
- **IDE-Ready Vim**: Full-featured Vim setup with LSP, fuzzy finding, and Git integration.

## 🛠️ What's Included

| Category       | Tools/Configs                                                                 |
|----------------|------------------------------------------------------------------------------|
| **Core**       | Zsh, Oh My Zsh, Git, Homebrew, SSH                                          |
| **Languages**  | Java (OpenJDK), Kotlin, Node.js (via NVM), Python                           |
| **Dev Tools**  | VS Code, IntelliJ IDEA, Docker, Kubernetes (kubectl, helm), Postgres, Redis |
| **Productivity**| Tmux, Vim (IDE-configured), Fira Code font, custom aliases/functions        |
| **Vim Setup**  | CoC.nvim (LSP), FZF, NERDTree, ALE linting, Git integration, Gruvbox theme  |

---

## 🚀 Quick Start

### 1. Clone the Repo
```bash
git clone https://github.com/dean-baker/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

### 2. Make setup executable and run
```bash
chmod +x setup.sh
./setup.sh
```

This will:
- Install Homebrew and all packages from Brewfile
- Set up Zsh with Oh My Zsh and plugins
- Configure Git
- Link all dotfiles (`.vimrc`, `.tmux.conf`, `.gitconfig`, etc.)
- Set up Vim with plugins and language servers
- Install Node.js via NVM

### 3. After Setup

1. **Restart your terminal**
2. **Open Vim** and run `:PlugInstall` to install all Vim plugins
3. **Restart Vim**
4. **Optional**: Install CoC language servers (may not work on corporate network):
   ```vim
   :CocInstall coc-pyright    " Better Python support
   :CocInstall coc-java       " Java support
   ```
   
   **Note for Block employees**: See [docs/COC_SETUP_BLOCK.md](docs/COC_SETUP_BLOCK.md) for CoC configuration on corporate network. Your Vim works great without CoC extensions!

---

## 📁 Repository Structure

```
dotfiles/
├── configs/           # Configuration files
│   ├── .vimrc        # Vim configuration
│   ├── .zshrc        # Zsh configuration
│   ├── .tmux.conf    # Tmux configuration
│   ├── .gitconfig    # Git configuration
│   ├── .aliases      # Shell aliases
│   └── .functions    # Shell functions
├── scripts/          # Setup and utility scripts
│   └── setup-vim.sh  # Vim-specific setup
├── docs/             # Documentation
│   └── vim-cheatsheet.md  # Vim keybindings reference
├── Brewfile          # Homebrew packages
├── setup.sh          # Main setup script
└── README.md         # This file
```

---

## 🎯 Vim Configuration Highlights

Your Vim setup includes:

### File Navigation
- **NERDTree**: File explorer (`<Space>n`)
- **FZF**: Fuzzy file finder (`<Space>ff`)
- **Ripgrep**: Fast project-wide search (`<Space>fr`)

### Code Intelligence
- **CoC.nvim**: LSP-based autocomplete and navigation
- Go to definition (`gd`)
- Show documentation (`K`)
- Rename symbols (`<Space>rn`)
- Find references (`gr`)

### Language Support
- Java, Kotlin, Python, JavaScript/TypeScript
- Syntax highlighting via vim-polyglot
- Linting via ALE
- Auto-formatting support

### Git Integration
- **vim-fugitive**: Git commands in Vim
- **vim-gitgutter**: See changes in gutter
- Quick git status (`<Space>gs`)

### Tmux Integration
- Seamless navigation between Vim and tmux panes
- Use `<Ctrl-h/j/k/l>` to move between splits

See [docs/vim-cheatsheet.md](docs/vim-cheatsheet.md) for complete keybindings reference.

---

## 🔧 Customization

### Adding New Brew Packages
```bash
# Add to Brewfile, then run:
brew bundle --file=./Brewfile
```

### Updating Brewfile
```bash
# Update Brewfile with currently installed packages
brew bundle dump --file=Brewfile --force
```

### VS Code Extensions
```bash
# Backup VS Code extensions
code --list-extensions > vscode/extensions.txt

# Restore VS Code extensions
cat vscode/extensions.txt | xargs -L 1 code --install-extension
```

### Modifying Vim Configuration
Edit `configs/.vimrc` and the changes will be reflected in `~/.vimrc` (symlinked).

---

## 📚 Additional Resources

- [Vim Cheatsheet](docs/vim-cheatsheet.md) - Complete Vim keybindings reference
- [Oh My Zsh Documentation](https://github.com/ohmyzsh/ohmyzsh/wiki)
- [Tmux Cheat Sheet](https://tmuxcheatsheet.com/)
- [CoC.nvim Documentation](https://github.com/neoclide/coc.nvim)

---

## 🐛 Troubleshooting

### Vim plugins not working
```bash
# Open Vim and run:
:PlugInstall
:PlugUpdate
```

### CoC not working
```bash
# Check CoC status:
:CocInfo

# Reinstall CoC extensions:
:CocInstall coc-json coc-tsserver coc-python
```

### Homebrew issues
```bash
# Update Homebrew:
brew update
brew upgrade
brew doctor
```

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

## 🤝 Contributing

Feel free to fork this repository and customize it for your own use!
