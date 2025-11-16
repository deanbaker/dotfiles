# Neovim Quick Start Guide

## Installation (3 Steps)

### 1. Install Neovim
```bash
brew install neovim
```

### 2. Symlink Config
```bash
mkdir -p ~/.config
ln -sf ~/dotfiles/configs/nvim ~/.config/nvim
```

### 3. First Launch
```bash
nvim
# Wait for plugins to install (automatic)
# Then run: :Mason
# Press 'i' on servers you want to install
```

## Essential Keybindings

### File Navigation
```
<Space>ff     Find files
<Space>fr     Search in files (ripgrep)
<Space>fb     Find buffers
<Space>n      Toggle file tree
```

### LSP (Code Intelligence)
```
gd            Go to definition
gr            Find references
K             Show documentation
<Space>rn     Rename symbol
<Space>ac     Code actions
[g / ]g       Navigate errors
```

### Git
```
<Space>gs     Git status
<Space>gc     Git commit
<Space>gp     Git push
]h / [h       Next/prev git change
<Space>hp     Preview change
```

### Editing
```
gcc           Comment line
<Space>w      Save
<Space>q      Quit
<C-h/j/k/l>   Navigate splits
```

## Plugin Management

### Lazy.nvim Commands
```vim
:Lazy             " Open Lazy UI
:Lazy sync        " Install/update plugins
:Lazy clean       " Remove unused plugins
:Lazy profile     " Show loading times
```

### Mason Commands (LSP Servers)
```vim
:Mason            " Open Mason UI
:MasonInstall <server>
:MasonUninstall <server>
:MasonUpdate      " Update all
```

### Treesitter Commands (Syntax)
```vim
:TSUpdate         " Update all parsers
:TSInstall <lang> " Install parser
:TSUninstall <lang>
```

## Health Checks

```vim
:checkhealth           " Check everything
:checkhealth lsp       " Check LSP
:checkhealth treesitter
```

## Recommended Language Servers

Install via `:Mason` (press `i` to install):

- **Python**: `pyright`
- **JavaScript/TypeScript**: `typescript-language-server`
- **Lua**: `lua-language-server`
- **Java**: `jdtls`
- **Kotlin**: `kotlin-language-server`
- **JSON**: `json-lsp`
- **YAML**: `yaml-language-server`
- **Bash**: `bash-language-server`
- **Docker**: `dockerfile-language-server`

## Troubleshooting

### Plugins not loading?
```vim
:Lazy sync
```

### LSP not working?
```vim
:LspInfo          " Check what's running
:Mason            " Check installed servers
```

### Syntax highlighting broken?
```vim
:TSUpdate
```

### Config changes not applying?
Restart Neovim or run:
```vim
:source ~/.config/nvim/init.lua
```

## Configuration Files

```
~/.config/nvim/
├── init.lua              # Main config
├── lua/core/
│   ├── options.lua       # Settings
│   ├── keymaps.lua       # Keybindings
│   └── autocmds.lua      # Auto commands
└── lua/plugins/          # All plugins
```

## Customization

### Change Theme Contrast
Edit `configs/nvim/lua/plugins/colorscheme.lua`:
```lua
contrast = "hard",  -- or "soft" or ""
```

### Add Custom Keybinding
Edit `configs/nvim/lua/core/keymaps.lua`:
```lua
keymap.set("n", "<leader>key", ":Command<CR>", { desc = "Description" })
```

### Install New Plugin
Create file in `configs/nvim/lua/plugins/myplugin.lua`:
```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup()
  end,
}
```

## Key Differences from Vim

✅ **Better**: Native LSP (faster, no Node.js)
✅ **Better**: Treesitter syntax (more accurate)
✅ **Better**: Lazy loading (faster startup)
✅ **Better**: Telescope (better search UI)
✅ **Same**: All your keybindings
✅ **Same**: Workflow and muscle memory

## Getting Help

```vim
:help <topic>         " Built-in help
:Telescope help_tags  " Search help
:WhichKey             " Show keybindings
```

## Full Documentation

See `/Users/dean/dotfiles/docs/NEOVIM_MIGRATION.md` for complete guide.
