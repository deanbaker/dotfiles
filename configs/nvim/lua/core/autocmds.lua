-- ============================================================================
-- NEOVIM AUTOCOMMANDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- ============================================================================
-- GENERAL AUTOCOMMANDS
-- ============================================================================

-- Highlight on yank
augroup("YankHighlight", { clear = true })
autocmd("TextYankPost", {
  group = "YankHighlight",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Return to last edit position when opening files
augroup("RestoreCursorPosition", { clear = true })
autocmd("BufReadPost", {
  group = "RestoreCursorPosition",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Remove trailing whitespace on save
augroup("TrimWhitespace", { clear = true })
autocmd("BufWritePre", {
  group = "TrimWhitespace",
  pattern = "*",
  command = [[%s/\s\+$//e]],
})

-- Auto-reload config when saving
augroup("AutoReloadConfig", { clear = true })
autocmd("BufWritePost", {
  group = "AutoReloadConfig",
  pattern = "*/nvim/**/*.lua",
  callback = function()
    vim.notify("Neovim config reloaded!", vim.log.levels.INFO)
    vim.cmd("source " .. vim.fn.stdpath("config") .. "/init.lua")
  end,
})

-- Close certain filetypes with 'q'
augroup("QuickClose", { clear = true })
autocmd("FileType", {
  group = "QuickClose",
  pattern = { "qf", "help", "man", "lspinfo", "checkhealth" },
  callback = function()
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = true, silent = true })
  end,
})

-- ============================================================================
-- LANGUAGE-SPECIFIC SETTINGS
-- ============================================================================

-- Python
augroup("PythonSettings", { clear = true })
autocmd("FileType", {
  group = "PythonSettings",
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- JavaScript/TypeScript
augroup("JavaScriptSettings", { clear = true })
autocmd("FileType", {
  group = "JavaScriptSettings",
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Java
augroup("JavaSettings", { clear = true })
autocmd("FileType", {
  group = "JavaSettings",
  pattern = "java",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Kotlin
augroup("KotlinSettings", { clear = true })
autocmd("FileType", {
  group = "KotlinSettings",
  pattern = "kotlin",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Lua
augroup("LuaSettings", { clear = true })
autocmd("FileType", {
  group = "LuaSettings",
  pattern = "lua",
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- ============================================================================
-- UI IMPROVEMENTS
-- ============================================================================

-- Show cursor line only in active window
augroup("CursorLine", { clear = true })
autocmd({ "InsertLeave", "WinEnter" }, {
  group = "CursorLine",
  callback = function()
    vim.opt_local.cursorline = true
  end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
  group = "CursorLine",
  callback = function()
    vim.opt_local.cursorline = false
  end,
})

-- Resize splits if window resized
augroup("ResizeSplits", { clear = true })
autocmd("VimResized", {
  group = "ResizeSplits",
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- ============================================================================
-- TERMINAL IMPROVEMENTS
-- ============================================================================

-- Start in insert mode when entering terminal
augroup("TerminalSettings", { clear = true })
autocmd("TermOpen", {
  group = "TerminalSettings",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.signcolumn = "no"
    vim.cmd("startinsert")
  end,
})
