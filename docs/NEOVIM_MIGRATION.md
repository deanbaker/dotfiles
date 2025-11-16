# Neovim Migration Guide

This guide covers the complete migration from Vim to Neovim with a modern Lua-based configuration.

## Table of Contents
1. [Overview](#overview)
2. [What Changed](#what-changed)
3. [Installation](#installation)
4. [Configuration Structure](#configuration-structure)
5. [Plugin Comparison](#plugin-comparison)
6. [Key Mappings](#key-mappings)
7. [LSP Setup](#lsp-setup)
8. [Troubleshooting](#troubleshooting)
9. [Next Steps](#next-steps)

---

## Overview

Your new Neovim setup uses:
- **Lua configuration** instead of VimScript
- **Native LSP** instead of CoC.nvim
- **Lazy.nvim** instead of vim-plug (faster, lazy-loading)
- **Treesitter** for better syntax highlighting
- **Mason** for automatic LSP server installation
- **nvim-cmp** for completion (replaces CoC completion)

### Why Neovim?

- **Better Performance**: Native LSP and Lua are faster than VimScript
- **Modern Plugins**: Access to cutting-edge Lua plugins
- **Better Defaults**: Sensible defaults out of the box
- **Active Development**: More active development than Vim
- **Async Everything**: Built-in async support

---

## What Changed

### Vim → Neovim Plugin Migration

| Old (Vim)          | New (Neovim)           | Notes                                    |
|--------------------|------------------------|------------------------------------------|
| vim-plug           | lazy.nvim              | Faster, lazy-loading, better UI          |
| CoC.nvim           | Native LSP + nvim-cmp  | Built-in, no Node.js dependency          |
| NERDTree           | nvim-tree              | Lua-based, faster                        |
| FZF                | Telescope              | More powerful, better UI                 |
| vim-airline        | lualine                | Lua-based, more customizable             |
| vim-gitgutter      | gitsigns.nvim          | Lua-based, more features                 |
| vim-polyglot       | Treesitter             | Better syntax highlighting               |
| ALE                | Native LSP             | Built-in diagnostics                     |
| auto-pairs         | nvim-autopairs         | Lua-based, Treesitter integration        |
| vim-commentary     | Comment.nvim           | Lua-based                                |
| vim-surround       | nvim-surround          | Lua-based                                |

### Configuration Location

| Vim                | Neovim                          |
|--------------------|---------------------------------|
| `~/.vimrc`         | `~/.config/nvim/init.lua`       |
| `~/.vim/`          | `~/.config/nvim/`               |
| `~/.vim/plugged/`  | `~/.local/share/nvim/lazy/`     |

---

## Installation

### 1. Install Neovim

```bash
# Already added to Brewfile
brew install neovim
```

### 2. Symlink Configuration

```bash
# The setup.sh script handles this automatically
mkdir -p ~/.config
ln -sf ~/dotfiles/configs/nvim ~/.config/nvim
```

### 3. First Launch

```bash
# Open Neovim - plugins will auto-install
nvim
```

On first launch:
1. **Lazy.nvim** will auto-install
2. All plugins will be downloaded and installed
3. **Treesitter** will install language parsers
4. **Mason** will be available for LSP servers

### 4. Install Language Servers

```vim
:Mason
```

In Mason, press `i` to install servers. Recommended:
- `pyright` (Python)
- `typescript-language-server` (JS/TS)
- `lua-language-server` (Lua)
- `jdtls` (Java)
- `kotlin-language-server` (Kotlin)
- `json-lsp` (JSON)
- `yaml-language-server` (YAML)
- `bash-language-server` (Bash)
- `dockerfile-language-server` (Docker)

Or install automatically (already configured in `lua/plugins/lsp.lua`):
```vim
:MasonInstallAll
```

---

## Configuration Structure

```
~/.config/nvim/
├── init.lua                    # Main entry point
├── lua/
│   ├── core/
│   │   ├── options.lua         # Neovim options (set commands)
│   │   ├── keymaps.lua         # Key mappings
│   │   ├── autocmds.lua        # Autocommands
│   │   └── lazy.lua            # Lazy.nvim bootstrap
│   └── plugins/
│       ├── colorscheme.lua     # Gruvbox theme
│       ├── telescope.lua       # Fuzzy finder
│       ├── nvim-tree.lua       # File explorer
│       ├── treesitter.lua      # Syntax highlighting
│       ├── lsp.lua             # LSP configuration
│       ├── nvim-cmp.lua        # Autocompletion
│       ├── lualine.lua         # Statusline
│       ├── git.lua             # Git integration
│       └── utils.lua           # Utility plugins
```

### How Plugins Work

Each file in `lua/plugins/` is automatically loaded by Lazy.nvim. Each file returns a table (or array of tables) describing a plugin:

```lua
return {
  "author/plugin-name",
  config = function()
    -- Plugin configuration
  end,
}
```

---

## Plugin Comparison

### File Explorer

**Old (NERDTree):**
```vim
:NERDTreeToggle
<leader>n
```

**New (nvim-tree):**
```vim
:NvimTreeToggle
<leader>n         " Toggle
<leader>nf        " Find current file
<leader>nc        " Collapse all
<leader>nr        " Refresh
```

### Fuzzy Finder

**Old (FZF):**
```vim
<leader>ff        " Find files
<leader>fr        " Ripgrep
<leader>fb        " Buffers
```

**New (Telescope):**
```vim
<leader>ff        " Find files
<leader>fg        " Git files
<leader>fr        " Live grep
<leader>fb        " Find buffers
<leader>fh        " Help tags
<leader>fl        " Find in current buffer
<leader>fo        " Recent files
<leader>fc        " Find string under cursor
```

### LSP (Code Intelligence)

**Old (CoC):**
```vim
gd                " Go to definition
gr                " Find references
K                 " Show documentation
<leader>rn        " Rename
<leader>ac        " Code action
[g / ]g           " Navigate diagnostics
```

**New (Native LSP):**
```vim
gd                " Go to definition (Telescope)
gD                " Go to declaration
gr                " Find references (Telescope)
gi                " Go to implementation
gt                " Go to type definition
K                 " Show documentation
<leader>rn        " Rename
<leader>ac        " Code action
<leader>d         " Show diagnostics
<leader>dl        " Show line diagnostics
[g / ]g           " Navigate diagnostics
<leader>rs        " Restart LSP
```

### Git

**Old (vim-fugitive + vim-gitgutter):**
```vim
<leader>gs        " Git status
<leader>gc        " Git commit
<leader>gp        " Git push
]h / [h           " Navigate hunks
```

**New (vim-fugitive + gitsigns):**
```vim
<leader>gs        " Git status
<leader>gc        " Git commit
<leader>gp        " Git push
<leader>gl        " Git log
<leader>gd        " Git diff
<leader>gb        " Git blame
]h / [h           " Navigate hunks
<leader>hs        " Stage hunk
<leader>hr        " Reset hunk
<leader>hp        " Preview hunk
<leader>hb        " Blame line
<leader>htb       " Toggle line blame
<leader>hd        " Diff this
```

---

## Key Mappings

### Leader Key
- **Leader**: `Space`

### File Operations
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>w`   | Save file                 |
| `<leader>q`   | Quit                      |
| `<leader>x`   | Save and quit             |

### Navigation
| Key           | Action                    |
|---------------|---------------------------|
| `<C-h/j/k/l>` | Navigate splits/panes     |
| `<C-q>`       | Cycle windows             |
| `<C-d>`       | Scroll down (centered)    |
| `<C-u>`       | Scroll up (centered)      |
| `n`           | Next search (centered)    |
| `N`           | Prev search (centered)    |

### Buffers
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>bn`  | Next buffer               |
| `<leader>bp`  | Previous buffer           |
| `<leader>bd`  | Delete buffer             |

### Splits
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>sv`  | Vertical split            |
| `<leader>sh`  | Horizontal split          |

### Code Editing
| Key           | Action                    |
|---------------|---------------------------|
| `gcc`         | Comment line              |
| `gc`          | Comment (visual/motion)   |
| `<A-j>`       | Move line down            |
| `<A-k>`       | Move line up              |
| `<` / `>`     | Indent (visual mode)      |

### Terminal
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>t`   | Open terminal             |
| `<leader>tv`  | Vertical terminal         |
| `<Esc>`       | Exit terminal mode        |

### Utilities
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>/`   | Clear search highlight    |
| `<leader>ln`  | Toggle relative numbers   |
| `<leader>so`  | Source current file       |

### Diagnostics (Trouble)
| Key           | Action                    |
|---------------|---------------------------|
| `<leader>xx`  | Toggle Trouble            |
| `<leader>xw`  | Workspace diagnostics     |
| `<leader>xd`  | Document diagnostics      |
| `<leader>xq`  | Quickfix                  |

---

## LSP Setup

### How Native LSP Works

1. **Mason** installs language servers
2. **nvim-lspconfig** configures them
3. **nvim-cmp** provides completion
4. **Treesitter** provides syntax highlighting

### Checking LSP Status

```vim
:LspInfo              " Show attached LSP clients
:Mason                " Open Mason UI
:checkhealth          " Check Neovim health
```

### Installing New Language Servers

```vim
:Mason                " Open Mason
# Press 'i' to install
# Press 'u' to update
# Press 'X' to uninstall
```

Or add to `lua/plugins/lsp.lua`:

```lua
ensure_installed = {
  "pyright",
  "your-new-server",
},
```

### Corporate Network Issues

If you're on a corporate network, LSP servers might fail to install. Solutions:

1. **Set proxy**:
   ```bash
   export HTTP_PROXY=http://proxy:port
   export HTTPS_PROXY=http://proxy:port
   ```

2. **Manual installation**:
   - Find server in `:Mason`
   - Note the installation command
   - Run manually with proxy settings

3. **Use system-installed servers**:
   ```lua
   -- In lua/plugins/lsp.lua, remove from ensure_installed
   -- Install via system package manager instead
   brew install pyright
   ```

---

## Troubleshooting

### Plugins Not Installing

```vim
:Lazy sync            " Sync all plugins
:Lazy clean           " Remove unused plugins
:Lazy update          " Update all plugins
```

### LSP Not Working

```vim
:LspInfo              " Check LSP status
:Mason                " Check installed servers
:checkhealth lsp      " Check LSP health
```

### Treesitter Errors

```vim
:TSUpdate             " Update parsers
:TSInstall <language> " Install specific parser
:checkhealth treesitter
```

### Slow Startup

```vim
:Lazy profile         " Show plugin loading times
```

### Configuration Not Loading

```vim
:messages             " Show error messages
:checkhealth          " Check overall health
```

### Keybindings Not Working

```vim
:verbose map <key>    " Check what key is mapped to
:WhichKey             " Show all leader mappings
```

---

## Next Steps

### 1. Customize Colors

Edit `lua/plugins/colorscheme.lua`:
```lua
contrast = "hard",    -- Hard contrast
transparent_mode = true, -- Transparent background
```

### 2. Add More Language Servers

Edit `lua/plugins/lsp.lua` and add to `ensure_installed`.

### 3. Install Additional Plugins

Create new file in `lua/plugins/` or add to existing:
```lua
return {
  "author/plugin-name",
  config = function()
    -- Setup
  end,
}
```

### 4. Customize Keymaps

Edit `lua/core/keymaps.lua`:
```lua
keymap.set("n", "<leader>custom", ":YourCommand<CR>", { desc = "Description" })
```

### 5. Add Language-Specific Settings

Edit `lua/core/autocmds.lua`:
```lua
autocmd("FileType", {
  pattern = "your-language",
  callback = function()
    vim.opt_local.tabstop = 2
  end,
})
```

---

## Differences from Vim Config

### What's Better in Neovim

1. **Faster startup** - Lazy loading with lazy.nvim
2. **Better LSP** - Native, no Node.js required
3. **Better syntax highlighting** - Treesitter
4. **Better fuzzy finder** - Telescope with previews
5. **Automatic setup** - Mason auto-installs LSP servers
6. **Modern plugins** - Access to Lua ecosystem
7. **Better defaults** - Sensible defaults out of box

### What's Different

1. **Configuration language** - Lua instead of VimScript
2. **Plugin manager** - lazy.nvim instead of vim-plug
3. **LSP** - Native instead of CoC
4. **File explorer** - nvim-tree instead of NERDTree
5. **No manual CoC extension install** - Mason handles it

### What's the Same

1. **Key mappings** - Almost identical
2. **Workflow** - Same editing experience
3. **Tmux integration** - Still works perfectly
4. **Git workflow** - vim-fugitive still used
5. **Leader key** - Still Space

---

## Quick Reference Card

### Most Used Commands

```vim
# File Navigation
<leader>ff        Find files
<leader>fr        Live grep
<leader>n         Toggle file tree

# LSP
gd                Go to definition
gr                Find references
K                 Show docs
<leader>rn        Rename
<leader>ac        Code action

# Git
<leader>gs        Git status
]h / [h           Next/prev hunk
<leader>hp        Preview hunk

# Editing
gcc               Comment line
<leader>w         Save
<leader>q         Quit
```

---

## Additional Resources

- [Neovim Docs](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- [Treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

---

## Reverting to Vim

If you need to revert to Vim temporarily:

```bash
# Your Vim config is still at ~/dotfiles/configs/.vimrc
vim
```

Both Vim and Neovim configurations coexist peacefully.
