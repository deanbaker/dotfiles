# Vim Configuration Migration Guide

## What Changed

Your dotfiles repository has been updated to include a comprehensive Vim IDE configuration.

## New Files Added

```
dotfiles/
├── configs/
│   └── .vimrc                    # NEW: Full Vim IDE configuration
├── scripts/
│   └── setup-vim.sh              # NEW: Vim setup automation
└── docs/
    ├── vim-cheatsheet.md         # NEW: Complete keybindings reference
    └── MIGRATION_GUIDE.md        # NEW: This file
```

## Updated Files

### Brewfile
Added Vim-related packages:
- `vim` - Vim editor
- `fzf` - Fuzzy finder
- `ripgrep` - Fast search
- `node` - Required for CoC.nvim (LSP)
- `python` - Required for linting tools
- `font-hack-nerd-font` - Icons for Vim

### setup.sh
Added:
- Symlink creation for `.vimrc`
- Automatic Vim setup via `setup-vim.sh`

### README.md
- Updated with Vim configuration details
- Added Vim features section
- Added troubleshooting for Vim

## Migration Steps

### Option 1: Fresh Install (Recommended for New Machines)

```bash
cd ~/dotfiles
git pull origin main
./setup.sh
```

This will:
1. Install all Homebrew packages (including new Vim tools)
2. Link all dotfiles including `.vimrc`
3. Run Vim setup automatically

### Option 2: Manual Update (For Existing Setup)

If you already have the dotfiles installed:

```bash
cd ~/dotfiles
git pull origin main

# Install new Brew packages
brew bundle --file=./Brewfile

# Link the new .vimrc
ln -sf ~/dotfiles/configs/.vimrc ~/.vimrc

# Run Vim setup
bash ~/dotfiles/scripts/setup-vim.sh

# Open Vim and install plugins
vim
# Then in Vim: :PlugInstall
```

### Option 3: Selective Install (Just Vim)

If you only want the Vim configuration:

```bash
cd ~/dotfiles
git pull origin main

# Install Vim dependencies
brew install vim fzf ripgrep node python

# Link .vimrc
ln -sf ~/dotfiles/configs/.vimrc ~/.vimrc

# Run Vim setup
bash ~/dotfiles/scripts/setup-vim.sh

# Install Vim plugins
vim
# Then in Vim: :PlugInstall
```

## Post-Installation

### 1. Verify Vim Setup

Open Vim and check:
```vim
:PlugStatus        " Check plugin installation
:CocInfo           " Check CoC status
:checkhealth       " If using Neovim
```

### 2. Install Language Servers (Optional)

For better language support:
```vim
:CocInstall coc-pyright    " Python
:CocInstall coc-java       " Java
```

### 3. Configure Terminal Font (Optional)

For best icon display:
1. Open your terminal preferences
2. Set font to "Hack Nerd Font" or "Hack Nerd Font Mono"
3. Size: 12-14pt recommended

### 4. Learn the Keybindings

See [vim-cheatsheet.md](vim-cheatsheet.md) for complete reference.

Quick essentials:
- `<Space>` = Leader key
- `<Space>n` = Toggle file tree
- `<Space>ff` = Find files
- `gd` = Go to definition
- `K` = Show documentation

## Backing Up Your Old Config

If you had a previous `.vimrc`:

```bash
# Backup old config
cp ~/.vimrc ~/.vimrc.backup.$(date +%Y%m%d)

# Compare with new config
vimdiff ~/.vimrc.backup.* ~/dotfiles/configs/.vimrc
```

## Rollback Instructions

If you want to revert to your old Vim setup:

```bash
# Remove symlink
rm ~/.vimrc

# Restore backup
cp ~/.vimrc.backup.YYYYMMDD ~/.vimrc

# Or use vanilla Vim
rm ~/.vimrc
```

## Troubleshooting

### Plugins Not Installing

```bash
# Ensure vim-plug is installed
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Open Vim and run
:PlugInstall
```

### CoC Not Working

```bash
# Ensure Node.js is installed
node --version

# If not, install via Homebrew
brew install node

# Reinstall CoC
vim
:CocInstall coc-json coc-tsserver coc-python
```

### FZF Not Found

```bash
# Install fzf
brew install fzf

# Run fzf install
$(brew --prefix)/opt/fzf/install --all
```

### Ripgrep Not Found

```bash
brew install ripgrep
```

### Python Tools Not Working

```bash
# Install Python linting tools
pip3 install --user flake8 pylint black isort
```

## Customization

### Changing Theme

Edit `~/dotfiles/configs/.vimrc`:
```vim
" Change from gruvbox to another theme
colorscheme solarized
" or
colorscheme monokai
```

### Disabling Plugins

Comment out unwanted plugins in `.vimrc`:
```vim
" Plug 'preservim/nerdtree'  " Disable NERDTree
```

Then run `:PlugClean` in Vim.

### Adding New Plugins

Add to `.vimrc` under the `call plug#begin()` section:
```vim
Plug 'author/plugin-name'
```

Then run `:PlugInstall` in Vim.

## Questions?

- Check [vim-cheatsheet.md](vim-cheatsheet.md) for keybindings
- Run `:help` in Vim for built-in documentation
- Check plugin documentation: `:help <plugin-name>`

## Commit These Changes

```bash
cd ~/dotfiles
git add .
git commit -m "Add comprehensive Vim IDE configuration"
git push origin main
```

Now your Vim setup is version controlled and portable! 🚀
