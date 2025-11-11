# CoC.nvim Setup for Block Employees

## Issue

CoC.nvim extensions fail to auto-install at Block due to the corporate npm registry configuration. You'll see errors like:

```
[coc.nvim] Error on install coc-tsserver: SyntaxError: Unexpected token '<'
```

This happens because CoC tries to download from the public npm registry, but Block's network redirects to the internal Artifactory registry.

## Solution

**Don't auto-install extensions.** Instead, install them manually when needed.

## Working with CoC at Block

### Option 1: Use Vim Without LSP (Recommended for Quick Edits)

Your Vim setup works great without CoC extensions! You still get:
- ✅ Syntax highlighting (vim-polyglot)
- ✅ Linting (ALE)
- ✅ File navigation (NERDTree, FZF)
- ✅ Git integration
- ✅ All other features

**This is perfect for quick file edits and most development work.**

### Option 2: Install CoC Extensions When Needed

For advanced IDE features (autocomplete, go-to-definition), install extensions manually:

#### JavaScript/TypeScript
```vim
:CocInstall coc-tsserver
:CocInstall coc-eslint
:CocInstall coc-prettier
```

#### Python
```vim
:CocInstall coc-pyright
```

#### Java
```vim
:CocInstall coc-java
```

#### JSON
```vim
:CocInstall coc-json
```

**Note:** These may still fail due to registry issues. If they do, use Option 3.

### Option 3: Use Language Servers Directly (Advanced)

Instead of CoC extensions, you can configure CoC to use language servers installed on your system.

#### Example: Python with pyright

1. Install pyright globally:
   ```bash
   npm install -g pyright
   ```

2. Configure CoC to use it:
   ```vim
   :CocConfig
   ```

3. Add this configuration:
   ```json
   {
     "languageserver": {
       "python": {
         "command": "pyright-langserver",
         "args": ["--stdio"],
         "filetypes": ["python"]
       }
     }
   }
   ```

### Option 4: Use ALE for Everything (Simplest)

ALE (Asynchronous Lint Engine) is already configured and works great! It provides:
- Linting for all languages
- Auto-fixing
- No network dependencies

**For most development at Block, ALE + syntax highlighting is sufficient.**

## Recommended Workflow

### For Quick Edits
Just use Vim as-is. Everything works without CoC extensions.

### For Development
1. Use ALE for linting (already configured)
2. Use FZF for file navigation (`<Space>ff`)
3. Use ripgrep for searching (`<Space>fr`)
4. Use Git integration (`<Space>gs`)

### For Advanced IDE Features
Try installing CoC extensions when needed, but don't expect them to work reliably on the corporate network.

## Alternative: Use VS Code or IntelliJ

For full IDE features with LSP support, consider:
- **VS Code** - Already in your Brewfile
- **IntelliJ IDEA** - Already in your Brewfile

These handle the corporate network better and have built-in language support.

## Checking CoC Status

```vim
:CocInfo          " Check CoC status
:CocList extensions  " List installed extensions
:CocUninstall <ext>  " Remove an extension
```

## Troubleshooting

### Extensions won't install
This is expected at Block. Use Option 1 (Vim without LSP) or Option 4 (ALE only).

### CoC errors on startup
The configuration has been updated to not auto-install extensions. Restart Vim and the errors should be gone.

### Want autocomplete without CoC?
Vim has built-in completion:
- `<Ctrl-n>` - Next completion
- `<Ctrl-p>` - Previous completion
- `<Ctrl-x><Ctrl-o>` - Omni completion (language-aware)

## Summary

**Your Vim setup is fully functional without CoC extensions!**

You have:
- ✅ Syntax highlighting for all languages
- ✅ Linting with ALE
- ✅ File navigation with FZF and NERDTree
- ✅ Git integration
- ✅ All productivity features

CoC extensions are **optional** and only needed for advanced LSP features like:
- Go to definition across files
- Intelligent autocomplete
- Refactoring tools

For most work, the current setup is more than sufficient!
