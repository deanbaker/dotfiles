-- ============================================================================
-- CLAUDE CODE INTEGRATION
-- ============================================================================
-- Integrates Claude Code AI assistant directly into Neovim
-- Requires: Claude Code CLI installed and folke/snacks.nvim

return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    config = function()
      require("claudecode").setup({
        -- Path to local Claude installation
        terminal_cmd = "/Users/dean/.claude/local/claude",

        -- Server configuration
        server = {
          -- Port range for WebSocket server
          port_start = 9800,
          port_end = 9820,
          -- Auto-start server when plugin loads
          auto_start = true,
          -- Logging level: "debug", "info", "warn", "error"
          log_level = "info",
        },

        -- Terminal configuration
        terminal = {
          -- Terminal split position: "left" or "right"
          position = "right",
          -- Width as percentage of total width
          width = 0.4,
          -- Use snacks.nvim for terminal (required)
          provider = "snacks",
        },

        -- Working directory configuration
        cwd = {
          -- Use git root as working directory (recommended for most projects)
          provider = "git_root",
          -- Alternative: use static path
          -- provider = "static",
          -- path = "/path/to/your/project",
        },

        -- Diff management
        diff = {
          -- Auto-close diff window after accept/deny
          auto_close = true,
          -- Diff split orientation: "horizontal" or "vertical"
          split = "vertical",
          -- Auto-focus diff window when opened
          auto_focus = true,
        },

        -- Selection tracking (sends visual selection context to Claude)
        selection = {
          -- Enable real-time selection tracking
          enabled = true,
          -- Debounce delay in milliseconds
          debounce = 200,
        },
      })

      -- Auto-command to make it easier to exit Claude terminal
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "*",
        callback = function()
          -- Use Ctrl-o to quickly exit terminal mode (easier than Esc)
          vim.keymap.set("t", "<C-o>", "<C-\\><C-n>", { buffer = true, desc = "Exit terminal mode" })
        end,
      })
    end,

    -- Keymaps for Claude Code
    keys = {
      -- Toggle Claude terminal
      {
        "<leader>cc",
        "<cmd>ClaudeCode<cr>",
        desc = "Toggle Claude Code terminal",
      },
      -- Smart focus/toggle with context awareness
      {
        "<leader>cf",
        "<cmd>ClaudeCodeFocus<cr>",
        desc = "Focus Claude Code terminal",
      },
      -- Select Claude model and launch
      {
        "<leader>cm",
        "<cmd>ClaudeCodeSelectModel<cr>",
        desc = "Select Claude model",
      },
      -- Send visual selection to Claude
      {
        "<leader>cs",
        "<cmd>ClaudeCodeSend<cr>",
        mode = "v",
        desc = "Send selection to Claude",
      },
      -- Add current file to Claude's context
      {
        "<leader>ca",
        "<cmd>ClaudeCodeAdd %<cr>",
        desc = "Add current file to Claude context",
      },
      -- Diff management
      {
        "<leader>cy",
        "<cmd>ClaudeCodeDiffAccept<cr>",
        desc = "Accept Claude's proposed changes",
      },
      {
        "<leader>cn",
        "<cmd>ClaudeCodeDiffDeny<cr>",
        desc = "Deny Claude's proposed changes",
      },
    },
  },
}
