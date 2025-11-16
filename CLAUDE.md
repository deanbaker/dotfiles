# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a macOS dotfiles repository for a Java/Kotlin/Node.js development environment. It uses Homebrew for package management and symlinks configuration files from `configs/` to the home directory.

**NEW**: This repository now includes a modern **Neovim** configuration with native LSP, Treesitter, and Lua-based plugins alongside the legacy Vim setup.

## Setup and Installation

### Initial Setup
```bash
chmod +x setup.sh
./setup.sh
```

The setup script:
1. Installs Xcode CLI Tools and Homebrew
2. Installs all packages from `Brewfile` (including Neovim)
3. Sets up NVM and installs Node.js LTS
4. Configures Git (requires manual user name/email update in script)
5. Installs Oh My Zsh with plugins (zsh-autosuggestions, zsh-syntax-highlighting)
6. Symlinks dotfiles from `configs/` to home directory
7. Symlinks Neovim config from `configs/nvim` to `~/.config/nvim`
8. Runs `scripts/setup-vim.sh` to configure Vim (legacy)

### Managing Homebrew Packages
```bash
# Install packages from Brewfile
brew bundle --file=./Brewfile

# Update Brewfile with currently installed packages
brew bundle dump --file=Brewfile --force
```

### Neovim Setup (Recommended)
After initial setup:
1. Open Neovim: `nvim`
2. Plugins auto-install on first launch (via lazy.nvim)
3. Run `:Mason` to install language servers
4. Restart Neovim

See `docs/NEOVIM_QUICKSTART.md` for quick start or `docs/NEOVIM_MIGRATION.md` for full documentation.

### Vim Setup (Legacy)
After initial setup, open Vim and run `:PlugInstall` to install all plugins. Restart Vim afterward.

## Repository Structure

```
dotfiles/
├── configs/                  # All configuration files (symlinked to ~/)
│   ├── nvim/                # Neovim configuration (Lua-based, modern)
│   │   ├── init.lua         # Main Neovim entry point
│   │   └── lua/
│   │       ├── core/        # Core settings (options, keymaps, autocmds)
│   │       └── plugins/     # Plugin configurations
│   ├── .vimrc               # Vim configuration (legacy, CoC, FZF, NERDTree)
│   ├── .zshrc               # Zsh configuration with Oh My Zsh
│   ├── .tmux.conf           # Tmux configuration (prefix: backtick)
│   ├── .gitconfig           # Git configuration
│   ├── .aliases             # Shell aliases (thefuck, lazygit, z)
│   └── .functions           # Shell functions
├── scripts/                 # Setup and utility scripts
│   ├── setup-vim.sh         # Installs Vim dependencies and vim-plug
│   └── install-vim-plugins.sh
├── docs/                    # Documentation
│   ├── NEOVIM_MIGRATION.md  # Complete Neovim migration guide
│   ├── NEOVIM_QUICKSTART.md # Quick start for Neovim
│   ├── vim-cheatsheet.md
│   ├── COC_SETUP_BLOCK.md   # CoC setup for corporate networks
│   ├── MIGRATION_GUIDE.md
│   └── SETUP_COMPLETE.md
├── Brewfile                 # Homebrew package definitions
├── setup.sh                 # Main setup script
└── README.md
```

## Configuration Files

### Symlink Architecture
The `setup.sh` script creates symlinks from `~/dotfiles/configs/*` to `~/`. To modify configurations, edit files in `configs/` directory:
- `configs/nvim/` → `~/.config/nvim` (Neovim)
- `configs/.vimrc` → `~/.vimrc` (Vim legacy)
- `configs/.zshrc` → `~/.zshrc`
- `configs/.tmux.conf` → `~/.tmux.conf`
- `configs/.gitconfig` → `~/.gitconfig`
- `configs/.aliases` → `~/.aliases`
- `configs/.functions` → `~/.functions`

### Neovim Configuration (Recommended)
The Neovim configuration is a modern, Lua-based setup with:
- **Leader key**: Space
- **Plugin manager**: lazy.nvim (faster than vim-plug)
- **LSP**: Native Neovim LSP (no Node.js dependency like CoC)
- **Completion**: nvim-cmp with multiple sources
- **File navigation**: nvim-tree, Telescope (better than FZF)
- **Syntax**: Treesitter (more accurate than vim-polyglot)
- **Linting**: Native LSP diagnostics
- **Git integration**: vim-fugitive, gitsigns.nvim
- **Tmux integration**: vim-tmux-navigator
- **Theme**: Gruvbox
- **LSP Installer**: Mason (auto-installs language servers)
- **Claude Code Integration**: Native Claude Code AI assistant integration via claudecode.nvim

Language servers (auto-installed via Mason):
- Python: pyright
- JavaScript/TypeScript: tsserver
- Lua: lua_ls
- Java: jdtls
- Kotlin: kotlin_language_server
- JSON: jsonls
- YAML: yamlls
- Bash: bashls
- Docker: dockerls

Language-specific settings:
- Python: 4-space tabs
- JavaScript/TypeScript: 2-space tabs
- Java/Kotlin: 4-space tabs
- Lua: 2-space tabs

### Vim Configuration (Legacy)
The `.vimrc` is configured as a full IDE with:
- **Leader key**: Space
- **Plugin manager**: vim-plug
- **LSP/Completion**: CoC.nvim (requires Node.js)
- **File navigation**: NERDTree, FZF, ripgrep
- **Linting**: ALE (configured for JavaScript, Python, Java, Kotlin)
- **Git integration**: vim-fugitive, vim-gitgutter
- **Tmux integration**: vim-tmux-navigator
- **Theme**: Gruvbox

Language-specific settings:
- Python: 4-space tabs
- JavaScript/TypeScript: 2-space tabs
- Java/Kotlin: 4-space tabs

CoC extensions must be installed manually (`:CocInstall coc-pyright`, `:CocInstall coc-java`, etc.) due to corporate network considerations.

### Zsh Configuration
Oh My Zsh with plugins:
- git
- zsh-autosuggestions
- zsh-syntax-highlighting
- docker
- kubectl

Key environment configurations:
- NVM directory: `$HOME/.nvm`
- Android SDK paths configured
- Custom PATH additions for various tools (Windsurf, LM Studio, etc.)

### Tmux Configuration
- **Prefix**: backtick (`) instead of default Ctrl-b
- Status bar positioned at top
- Mouse support enabled
- Minimal, clean status bar design

### Git Configuration
- Default branch: main
- Pull strategy: rebase
- Aliases: co (checkout), ci (commit), st (status), br (branch), hist (formatted log)

## Development Tools

### Languages and Runtimes
- Java: OpenJDK (via Homebrew cask)
- Kotlin: Compiler and ktlint
- Node.js: Managed via NVM
- Python: System Python with development tools (flake8, pylint, black, isort)

### Build Tools
- Gradle
- Maven
- Yarn (in addition to npm)

### DevOps Tools
- Docker Desktop
- Kubernetes: kubectl, kubectx, helm, k9s
- Database: PostgreSQL, Redis

### Utilities in .aliases
- `lg` → lazygit
- `ffs` → thefuck
- `thefuck` integration enabled
- `z` jump navigation enabled

## Key Neovim Mappings (Recommended)

All mappings use Space as the leader key.

File navigation:
- `<Space>ff` - Telescope find files
- `<Space>fr` - Telescope live grep (ripgrep)
- `<Space>fb` - Telescope buffers
- `<Space>n` - Toggle nvim-tree
- `<Space>nf` - Find current file in nvim-tree

Code navigation (Native LSP):
- `gd` - Go to definition (Telescope)
- `gD` - Go to declaration
- `gr` - Find references (Telescope)
- `gi` - Go to implementation
- `gt` - Go to type definition
- `K` - Show documentation
- `<Space>rn` - Rename symbol
- `<Space>ac` - Code action
- `[g` / `]g` - Navigate diagnostics
- `<Space>d` - Show diagnostics (Telescope)

Git:
- `<Space>gs` - Git status (fugitive)
- `<Space>gc` - Git commit
- `<Space>gp` - Git push
- `<Space>gl` - Git log
- `<Space>gd` - Git diff
- `<Space>gb` - Git blame
- `]h` / `[h` - Navigate git hunks
- `<Space>hp` - Preview hunk
- `<Space>hs` - Stage hunk
- `<Space>hr` - Reset hunk

Window navigation:
- `<C-h/j/k/l>` - Navigate splits (works with Tmux via vim-tmux-navigator)
- `<C-q>` - Cycle windows

Editing:
- `gcc` - Comment/uncomment line
- `gc` - Comment (visual mode or motion)

Plugin management:
- `:Lazy` - Open lazy.nvim UI
- `:Mason` - Open Mason LSP installer
- `:TSUpdate` - Update Treesitter parsers

Claude Code (AI Assistant):
- `<Space>cc` - Toggle Claude Code terminal
- `<Space>cf` - Focus Claude Code terminal with context
- `<Space>cm` - Select Claude model
- `<Space>cs` - Send visual selection to Claude (visual mode)
- `<Space>ca` - Add current file to Claude's context
- `<Space>cy` - Accept Claude's proposed changes
- `<Space>cn` - Deny Claude's proposed changes

Terminal mode navigation:
- `<Esc>` or `<C-o>` - Exit terminal mode (return to normal mode)
- Once in normal mode, use `<Space>` leader keys normally
- `<C-h/j/k/l>` - Navigate between windows from terminal mode

Claude Code commands:
- `:ClaudeCode` - Toggle Claude terminal
- `:ClaudeCodeFocus` - Smart focus with context
- `:ClaudeCodeSelectModel` - Choose model
- `:ClaudeCodeSend` - Send selection
- `:ClaudeCodeAdd <file>` - Add file to context
- `:ClaudeCodeDiffAccept` - Accept changes
- `:ClaudeCodeDiffDeny` - Reject changes

## Key Vim Mappings (Legacy)

File navigation:
- `<Space>n` - Toggle NERDTree
- `<Space>ff` - FZF file finder
- `<Space>fr` - Ripgrep search
- `<Space>nf` - Find current file in NERDTree

Code navigation (CoC):
- `gd` - Go to definition
- `gr` - Find references
- `K` - Show documentation
- `<Space>rn` - Rename symbol
- `[g` / `]g` - Navigate diagnostics

Git:
- `<Space>gs` - Git status
- `<Space>gc` - Git commit
- `<Space>gp` - Git push
- `]h` / `[h` - Navigate git hunks

Window navigation:
- `<C-h/j/k/l>` - Navigate splits (works with Tmux)
- `<C-q>` - Cycle windows

## Important Notes

1. **Neovim is Recommended**: The new Neovim setup provides better performance, native LSP, and modern features. It's maintained alongside the legacy Vim config for compatibility.

2. **Neovim Documentation**:
   - Quick start: `docs/NEOVIM_QUICKSTART.md`
   - Complete guide: `docs/NEOVIM_MIGRATION.md`

3. **Neovim Plugin Installation**: Plugins auto-install on first launch. Just run `nvim` and wait. Then run `:Mason` to install language servers.

4. **Corporate Network Considerations** (Vim): CoC language servers may not work on corporate networks. See `docs/COC_SETUP_BLOCK.md` for workarounds. Neovim's Mason may have similar issues - use system package manager as fallback.

5. **Git User Configuration**: The `setup.sh` script contains placeholder Git user name/email that should be updated before running.

6. **Vim Plugin Installation** (Legacy): Must manually run `:PlugInstall` in Vim after initial setup.

7. **Auto-formatting**:
   - Neovim: LSP provides formatting via `<Space>f` or `:Format`
   - Vim: ALE auto-fix on save is disabled by default (`g:ale_fix_on_save = 0`)

8. **Backup Files**: Both Vim and Neovim have backup, writebackup, and swap files disabled. Neovim uses persistent undo instead.

9. **Claude Code Integration**: The Neovim configuration includes native Claude Code integration via `claudecode.nvim`. Requirements:
   - Claude Code CLI must be installed (verify with `which claude` and `claude doctor`)
   - The plugin auto-starts the WebSocket server on Neovim launch
   - Uses port range 9800-9820 for MCP communication
   - Terminal opens on the right side (40% width) using snacks.nvim
   - All Claude Code keymaps are under the `<Space>c` prefix
