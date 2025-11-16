-- ============================================================================
-- NEOVIM CORE OPTIONS
-- ============================================================================

local opt = vim.opt

-- ============================================================================
-- GENERAL SETTINGS
-- ============================================================================
opt.encoding = "utf-8"            -- UTF-8 encoding
opt.fileencoding = "utf-8"        -- File encoding
opt.mouse = "a"                   -- Enable mouse in all modes
opt.clipboard = "unnamedplus"     -- Use system clipboard
opt.hidden = true                 -- Allow hidden buffers
opt.updatetime = 300              -- Faster completion (default 4000ms)
opt.timeoutlen = 500              -- Faster key sequence timeout
opt.completeopt = { "menu", "menuone", "noselect" }

-- ============================================================================
-- UI SETTINGS
-- ============================================================================
opt.number = true                 -- Show line numbers
opt.relativenumber = true         -- Relative line numbers
opt.cursorline = true             -- Highlight current line
opt.showcmd = true                -- Show command in bottom bar
opt.showmode = false              -- Don't show mode (lualine shows it)
opt.wildmenu = true               -- Visual autocomplete for command menu
opt.showmatch = true              -- Highlight matching brackets
opt.laststatus = 3                -- Global statusline (3 = global, 2 = always)
opt.ruler = true                  -- Show cursor position
opt.signcolumn = "yes"            -- Always show sign column
opt.termguicolors = true          -- Enable true colors
opt.background = "dark"           -- Dark background
opt.pumheight = 10                -- Popup menu height
opt.scrolloff = 8                 -- Lines to keep above/below cursor
opt.sidescrolloff = 8             -- Columns to keep left/right of cursor

-- ============================================================================
-- SEARCH SETTINGS
-- ============================================================================
opt.incsearch = true              -- Search as characters are entered
opt.hlsearch = true               -- Highlight search matches
opt.ignorecase = true             -- Case insensitive search
opt.smartcase = true              -- Case sensitive if uppercase present

-- ============================================================================
-- INDENTATION
-- ============================================================================
opt.autoindent = true             -- Auto indent
opt.smartindent = true            -- Smart indent
opt.tabstop = 4                   -- Tab width
opt.shiftwidth = 4                -- Indent width
opt.expandtab = true              -- Use spaces instead of tabs
opt.smarttab = true               -- Smart tab behavior

-- ============================================================================
-- SPLITS
-- ============================================================================
opt.splitbelow = true             -- Horizontal splits below
opt.splitright = true             -- Vertical splits to right

-- ============================================================================
-- FOLDING
-- ============================================================================
opt.foldmethod = "expr"           -- Use expression for folding
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Use Treesitter for folding
opt.foldlevel = 99                -- Open all folds by default
opt.foldenable = true             -- Enable folding

-- ============================================================================
-- BACKUP AND SWAP
-- ============================================================================
opt.backup = false                -- No backup files
opt.writebackup = false           -- No backup before overwriting
opt.swapfile = false              -- No swap files
opt.undofile = true               -- Enable persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undo"

-- ============================================================================
-- PERFORMANCE
-- ============================================================================
opt.lazyredraw = true             -- Redraw only when needed

-- ============================================================================
-- SPECIAL CHARACTERS
-- ============================================================================
opt.list = true                   -- Show special characters
opt.listchars = {
  tab = "→ ",
  trail = "·",
  extends = "›",
  precedes = "‹",
  nbsp = "␣",
}

-- ============================================================================
-- COMMAND LINE
-- ============================================================================
opt.cmdheight = 1                 -- Command line height
opt.shortmess:append("c")         -- Don't show completion messages

-- ============================================================================
-- WRAPPING
-- ============================================================================
opt.wrap = false                  -- No line wrapping
opt.linebreak = true              -- Break at word boundaries

-- ============================================================================
-- NEOVIM SPECIFIC
-- ============================================================================
vim.g.loaded_netrw = 1            -- Disable netrw (use nvim-tree instead)
vim.g.loaded_netrwPlugin = 1      -- Disable netrw plugin

-- ============================================================================
-- PYTHON PROVIDER
-- ============================================================================
-- Uncomment if you want to use specific Python paths
-- vim.g.python3_host_prog = '/usr/bin/python3'
