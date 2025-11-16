-- ============================================================================
-- LSP CONFIGURATION (Native LSP)
-- ============================================================================

return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
    },
    config = function()
      local cmp_nvim_lsp = require("cmp_nvim_lsp")
      local keymap = vim.keymap

      -- Enable keybinds for available LSP server
      local on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true, buffer = bufnr }

        -- Set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ac", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>d", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>dl", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[g", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]g", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end

      -- Used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Configure diagnostic signs
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- ======================================================================
      -- LANGUAGE SERVER CONFIGURATIONS USING vim.lsp.config
      -- ======================================================================

      -- Default LSP configuration
      local default_config = {
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Python (pyright)
      vim.lsp.config.pyright = vim.tbl_extend("force", default_config, {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
      })

      -- TypeScript/JavaScript (tsserver)
      vim.lsp.config.tsserver = vim.tbl_extend("force", default_config, {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
      })

      -- Lua (lua_ls)
      vim.lsp.config.lua_ls = vim.tbl_extend("force", default_config, {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true,
              },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Java (jdtls)
      vim.lsp.config.jdtls = vim.tbl_extend("force", default_config, {
        cmd = { "jdtls" },
        filetypes = { "java" },
        root_markers = { "pom.xml", "build.gradle", "build.gradle.kts", ".git" },
      })

      -- Kotlin (kotlin_language_server)
      vim.lsp.config.kotlin_language_server = vim.tbl_extend("force", default_config, {
        cmd = { "kotlin-language-server" },
        filetypes = { "kotlin" },
        root_markers = { "settings.gradle", "settings.gradle.kts", ".git" },
      })

      -- JSON (jsonls)
      vim.lsp.config.jsonls = vim.tbl_extend("force", default_config, {
        cmd = { "vscode-json-language-server", "--stdio" },
        filetypes = { "json", "jsonc" },
        root_markers = { ".git" },
      })

      -- YAML (yamlls)
      vim.lsp.config.yamlls = vim.tbl_extend("force", default_config, {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose" },
        root_markers = { ".git" },
      })

      -- Bash (bashls)
      vim.lsp.config.bashls = vim.tbl_extend("force", default_config, {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "bash" },
        root_markers = { ".git" },
      })

      -- Docker (dockerls)
      vim.lsp.config.dockerls = vim.tbl_extend("force", default_config, {
        cmd = { "docker-langserver", "--stdio" },
        filetypes = { "dockerfile" },
        root_markers = { ".git" },
      })

      -- Enable language servers (they will auto-start when opening relevant files)
      vim.lsp.enable({
        "pyright",
        "tsserver",
        "lua_ls",
        "jdtls",
        "kotlin_language_server",
        "jsonls",
        "yamlls",
        "bashls",
        "dockerls",
      })
    end,
  },

  -- Mason: LSP, DAP, Linter, Formatter installer
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },

  -- Mason LSP config bridge
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- Auto-install these language servers
        ensure_installed = {
          "pyright",                -- Python
          "ts_ls",                  -- TypeScript/JavaScript (renamed from tsserver)
          "lua_ls",                 -- Lua
          "jdtls",                  -- Java
          "kotlin_language_server", -- Kotlin
          "jsonls",                 -- JSON
          "yamlls",                 -- YAML
          "bashls",                 -- Bash
          "dockerls",               -- Docker
        },
        automatic_installation = true,
      })
    end,
  },
}
