# Vim Configuration Cheat Sheet

## Installation Steps

1. **Run the setup script:**
   ```bash
   ~/setup-vim.sh
   ```

2. **Open Vim and install plugins:**
   ```bash
   vim
   ```
   Then in Vim, type:
   ```
   :PlugInstall
   ```

3. **Restart Vim**

4. **Install additional language servers (optional):**
   ```
   :CocInstall coc-pyright
   :CocInstall coc-java
   ```

## Key Mappings

### General
| Key | Action |
|-----|--------|
| `<Space>` | Leader key |
| `<Space>w` | Save file |
| `<Space>q` | Quit |
| `<Space>x` | Save and quit |
| `<Space>/` | Clear search highlighting |
| `<Space>ln` | Toggle relative line numbers |

### File Navigation
| Key | Action |
|-----|--------|
| `<Space>n` | Toggle NERDTree |
| `<Space>nf` | Find current file in NERDTree |
| `<Space>ff` | Find files (fuzzy) |
| `<Space>fg` | Find git files |
| `<Space>fb` | List open buffers |
| `<Space>fl` | Search lines in current file |
| `<Space>fr` | Ripgrep search in project |
| `<Space>fh` | Recent files history |

### Window Management
| Key | Action |
|-----|--------|
| `<Ctrl-h>` | Move to left window |
| `<Ctrl-j>` | Move to down window |
| `<Ctrl-k>` | Move to up window |
| `<Ctrl-l>` | Move to right window |
| `<Space>sv` | Split vertically |
| `<Space>sh` | Split horizontally |

### Buffer Management
| Key | Action |
|-----|--------|
| `<Space>bn` | Next buffer |
| `<Space>bp` | Previous buffer |
| `<Space>bd` | Delete buffer |

### Code Navigation (CoC)
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gy` | Go to type definition |
| `gi` | Go to implementation |
| `gr` | Find references |
| `K` | Show documentation |
| `[g` | Previous diagnostic |
| `]g` | Next diagnostic |
| `<Space>d` | Show all diagnostics |

### Code Editing
| Key | Action |
|-----|--------|
| `<Space>rn` | Rename symbol |
| `<Space>f` | Format code |
| `<Space>ac` | Code action |
| `<Space>qf` | Quick fix |
| `<Tab>` | Trigger/navigate completion |
| `<Shift-Tab>` | Navigate completion backward |
| `<Ctrl-Space>` | Trigger completion |

### Linting (ALE)
| Key | Action |
|-----|--------|
| `<Space>aj` | Next lint error |
| `<Space>ak` | Previous lint error |
| `<Space>af` | Auto-fix lint errors |

### Git Integration
| Key | Action |
|-----|--------|
| `<Space>gs` | Git status |
| `<Space>gc` | Git commit |
| `<Space>gp` | Git push |
| `<Space>gl` | Git log |
| `<Space>gd` | Git diff |
| `<Space>gb` | Git blame |
| `]h` | Next git hunk |
| `[h` | Previous git hunk |

### Terminal
| Key | Action |
|-----|--------|
| `<Space>t` | Open terminal |
| `<Space>tv` | Open vertical terminal |
| `<Esc>` | Exit terminal mode |

### Visual Mode
| Key | Action |
|-----|--------|
| `<` | Indent left (stays in visual) |
| `>` | Indent right (stays in visual) |
| `<Alt-j>` | Move line down |
| `<Alt-k>` | Move line up |

## Plugin Features

### NERDTree (File Explorer)
- `m` - Show menu (create, delete, move files)
- `i` - Open file in horizontal split
- `s` - Open file in vertical split
- `t` - Open file in new tab
- `R` - Refresh tree
- `?` - Toggle help

### FZF (Fuzzy Finder)
- `<Ctrl-j>/<Ctrl-k>` - Navigate results
- `<Ctrl-t>` - Open in new tab
- `<Ctrl-x>` - Open in horizontal split
- `<Ctrl-v>` - Open in vertical split

### vim-commentary
- `gcc` - Comment/uncomment line
- `gc` (visual) - Comment/uncomment selection
- `gcap` - Comment paragraph

### vim-surround
- `cs"'` - Change surrounding " to '
- `ds"` - Delete surrounding "
- `ysiw"` - Surround word with "
- `yss)` - Surround entire line with ()

## Language-Specific Tools

### Python
- **Linters:** flake8, pylint
- **Formatters:** black, isort
- **LSP:** coc-pyright (`:CocInstall coc-pyright`)

### JavaScript/TypeScript
- **Linter:** eslint
- **Formatter:** prettier
- **LSP:** coc-tsserver (auto-installed)

### Java
- **Linter:** checkstyle, javac
- **Formatter:** google-java-format
- **LSP:** coc-java (`:CocInstall coc-java`)

### Kotlin
- **Linter:** ktlint
- **Formatter:** ktlint

## Troubleshooting

### CoC not working
```vim
:CocInfo
:checkhealth  " If using Neovim
```

### Update plugins
```vim
:PlugUpdate
:PlugUpgrade  " Update vim-plug itself
```

### Check CoC extensions
```vim
:CocList extensions
```

### Install missing CoC extension
```vim
:CocInstall coc-<extension-name>
```

## Customization Tips

1. **Change theme:** Edit `colorscheme gruvbox` in .vimrc
   - Try: `solarized`, `monokai`, `dracula`, `nord`

2. **Auto-fix on save:** Set `let g:ale_fix_on_save = 1` in .vimrc

3. **Disable relative numbers:** Remove `set relativenumber` from .vimrc

4. **Change leader key:** Modify `let mapleader = " "` to your preference

## Useful Commands

```vim
:PlugInstall          " Install plugins
:PlugUpdate           " Update plugins
:PlugClean            " Remove unused plugins
:CocInstall <ext>     " Install CoC extension
:CocUninstall <ext>   " Uninstall CoC extension
:CocList extensions   " List CoC extensions
:CocConfig            " Edit CoC config
:ALEInfo              " Show ALE info
:help <topic>         " Get help on any topic
```

## Additional Resources

- Vim documentation: `:help`
- CoC documentation: `:help coc-nvim`
- Plugin GitHub pages for specific plugin help
- Vim cheat sheet: https://vim.rtorr.com/

## Tips for Quick File Edits

For quick edits from terminal, your Vim is now powerful enough for both:
1. **Quick edits:** Just open the file normally - syntax highlighting and basic features work immediately
2. **IDE mode:** Use `<Space>n` for file tree, `<Space>ff` for fuzzy find, and code navigation features

The configuration is optimized to be fast on startup while providing IDE features when needed!
