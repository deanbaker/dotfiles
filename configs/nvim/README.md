# Neovim Configuration

Modern Neovim configuration with Lua, native LSP, and Treesitter.

## Quick Start

```bash
# First launch (auto-installs plugins)
nvim

# Install language servers
:Mason

# Check health
:checkhealth
```

## Structure

```
nvim/
├── init.lua              # Entry point
├── lua/
│   ├── core/
│   │   ├── options.lua   # Neovim settings
│   │   ├── keymaps.lua   # Key mappings
│   │   ├── autocmds.lua  # Auto commands
│   │   └── lazy.lua      # Plugin manager bootstrap
│   └── plugins/
│       ├── colorscheme.lua   # Gruvbox theme
│       ├── telescope.lua     # Fuzzy finder
│       ├── nvim-tree.lua     # File explorer
│       ├── treesitter.lua    # Syntax highlighting
│       ├── lsp.lua           # Language servers
│       ├── nvim-cmp.lua      # Completion
│       ├── lualine.lua       # Statusline
│       ├── git.lua           # Git integration
│       └── utils.lua         # Utilities
└── README.md
```

## Key Features

- **Lazy.nvim**: Fast plugin loading
- **Native LSP**: No Node.js dependency
- **Mason**: Auto-install language servers
- **Treesitter**: Better syntax highlighting
- **Telescope**: Powerful fuzzy finder
- **nvim-cmp**: Intelligent completion
- **Gitsigns**: Git integration
- **Which-key**: Keybinding hints

## Leader Key

Leader: `Space`

## Essential Mappings

### Files
- `<Space>ff` - Find files
- `<Space>fr` - Live grep
- `<Space>n` - File tree

### LSP
- `gd` - Go to definition
- `gr` - Find references
- `K` - Documentation
- `<Space>rn` - Rename
- `<Space>ac` - Code action

### Git
- `<Space>gs` - Status
- `]h` / `[h` - Next/prev hunk
- `<Space>hp` - Preview hunk

## Customization

### Add Plugin
Create file in `lua/plugins/`:

```lua
return {
  "author/plugin",
  config = function()
    require("plugin").setup({})
  end,
}
```

### Change Settings
Edit `lua/core/options.lua`:

```lua
vim.opt.setting = value
```

### Add Keybinding
Edit `lua/core/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>x", ":Command<CR>", { desc = "Description" })
```

## Language Servers

Installed via `:Mason`:

- Python: `pyright`
- JavaScript/TypeScript: `typescript-language-server`
- Lua: `lua-language-server`
- Java: `jdtls`
- Kotlin: `kotlin-language-server`
- JSON: `json-lsp`
- YAML: `yaml-language-server`
- Bash: `bash-language-server`
- Docker: `dockerfile-language-server`

## Plugin Management

```vim
:Lazy           " Plugin UI
:Lazy sync      " Install/update
:Lazy clean     " Remove unused
:Lazy profile   " Show load times
```

## Troubleshooting

```vim
:checkhealth           " Check everything
:LspInfo               " LSP status
:Mason                 " Language servers
:TSUpdate              " Update parsers
:messages              " Error messages
```

## Documentation

- Quick start: `/docs/NEOVIM_QUICKSTART.md`
- Full guide: `/docs/NEOVIM_MIGRATION.md`
- Main repo: `/CLAUDE.md`

## Requirements

- Neovim 0.9+
- Git
- A [Nerd Font](https://www.nerdfonts.com/)
- ripgrep (for Telescope)
- Node.js (for some LSP servers)
- Language-specific tools (installed via Mason)
