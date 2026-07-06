if 1 then return {} end

return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "basedpyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({ capabilities = capabilities })

 --       lspconfig.julials.setup({
 --         capabilities = capabilities,
 --         cmd = {
 --           "julia",
 --           "--startup-file=no",
 --           "--history-file=no",
 --           "--quiet",
 --           "--project=@nvim-lspconfig",
 --           "-e", [[
 --             using LanguageServer
 --             runserver()
 --           ]]
 --         },
 --         filetypes = { "julia" },
 --         root_dir = require("lspconfig.util").find_git_ancestor,
 --       })

      lspconfig.basedpyright.setup({
        capabilities = capabilities,
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode= "off",
              diagnosticSeverityOverrides = {
                reportUnusedImport = "none",
                reportPrivateUsage = "none",
                reportUnusedVariable = "none",
                reportOptionalMemberAccess = "none",
              }
            }
          },
          python = {}
        }
      })

      vim.keymap.set('n', '<leader>i', vim.lsp.buf.hover, {})
      vim.keymap.set('n', '<leader>d', vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
    end
  }
}
