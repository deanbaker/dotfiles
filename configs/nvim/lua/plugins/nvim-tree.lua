-- ============================================================================
-- NVIM-TREE CONFIGURATION (File Explorer)
-- ============================================================================

return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        group_empty = true,
        highlight_git = true,
        icons = {
          show = {
            git = true,
            folder = true,
            file = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
        custom = { "^.git$", "^.DS_Store$", "^__pycache__$", "node_modules" },
      },
      git = {
        enable = true,
        ignore = false,
      },
      actions = {
        open_file = {
          quit_on_open = false,
          window_picker = {
            enable = true,
          },
        },
      },
    })

    -- Keymaps
    local keymap = vim.keymap
    keymap.set("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>nf", "<cmd>NvimTreeFindFile<cr>", { desc = "Find file in explorer" })
    keymap.set("n", "<leader>nc", "<cmd>NvimTreeCollapse<cr>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>nr", "<cmd>NvimTreeRefresh<cr>", { desc = "Refresh file explorer" })
  end,
}
