-- ============================================================================
-- NEOVIM CONFIGURATION (init.lua)
-- ============================================================================
-- Modern Neovim setup with Lua, Native LSP, and Treesitter
-- Optimized for Java, Kotlin, Python, JavaScript development
-- ============================================================================

-- Load core configuration modules
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Bootstrap lazy.nvim plugin manager
require("core.lazy")
