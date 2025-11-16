-- ============================================================================
-- NEOVIM KEYMAPS
-- ============================================================================

local keymap = vim.keymap

-- ============================================================================
-- LEADER KEY
-- ============================================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ============================================================================
-- GENERAL MAPPINGS
-- ============================================================================
-- Quick save and quit
keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap.set("n", "<leader>x", ":x<CR>", { desc = "Save and quit" })

-- Clear search highlighting
keymap.set("n", "<leader>/", ":nohlsearch<CR>", { desc = "Clear search highlight" })

-- Better escape (optional - uncomment if you want jk to escape insert mode)
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- ============================================================================
-- WINDOW NAVIGATION
-- ============================================================================
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
keymap.set("n", "<C-q>", "<C-W>w", { desc = "Cycle windows" })

-- Window resizing
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Increase window width" })

-- ============================================================================
-- BUFFER NAVIGATION
-- ============================================================================
keymap.set("n", "<leader>bn", ":bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", ":bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<leader>bd", ":bdelete<CR>", { desc = "Delete buffer" })

-- ============================================================================
-- SPLIT MANAGEMENT
-- ============================================================================
keymap.set("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
keymap.set("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })

-- ============================================================================
-- MOVE LINES
-- ============================================================================
keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- ============================================================================
-- INDENTATION
-- ============================================================================
keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- ============================================================================
-- BETTER PASTE
-- ============================================================================
-- Don't yank when pasting over selection
keymap.set("v", "p", '"_dP', { desc = "Paste without yanking" })

-- ============================================================================
-- TERMINAL MODE
-- ============================================================================
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Terminal: move left" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Terminal: move down" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Terminal: move up" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Terminal: move right" })

-- Open terminal
keymap.set("n", "<leader>t", ":terminal<CR>", { desc = "Open terminal" })
keymap.set("n", "<leader>tv", ":vertical terminal<CR>", { desc = "Open vertical terminal" })

-- ============================================================================
-- BETTER NAVIGATION
-- ============================================================================
-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })
keymap.set("n", "n", "nzzzv", { desc = "Next search result and center" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result and center" })

-- ============================================================================
-- PLUGIN KEYMAPS (will be overridden by plugin configs if needed)
-- ============================================================================

-- File explorer (nvim-tree) - defined in plugin config
-- keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })

-- Fuzzy finder (Telescope) - defined in plugin config
-- keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })

-- Git (vim-fugitive)
keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })
keymap.set("n", "<leader>gc", ":Git commit<CR>", { desc = "Git commit" })
keymap.set("n", "<leader>gp", ":Git push<CR>", { desc = "Git push" })
keymap.set("n", "<leader>gl", ":Git log<CR>", { desc = "Git log" })
keymap.set("n", "<leader>gd", ":Gdiff<CR>", { desc = "Git diff" })
keymap.set("n", "<leader>gb", ":Git blame<CR>", { desc = "Git blame" })

-- ============================================================================
-- UTILITY
-- ============================================================================
-- Toggle line numbers
keymap.set("n", "<leader>ln", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
end, { desc = "Toggle relative line numbers" })

-- Source current file
keymap.set("n", "<leader>so", ":source %<CR>", { desc = "Source current file" })
