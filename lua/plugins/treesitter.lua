return {
  "nvim-treesitter/nvim-treesitter",
  branch = 'master',
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
     -- instalacja i konfiguracja parserów do języków, w których piszę
    config.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "cpp", "python", "latex", "json", "julia", "html", "css" },
       -- wyłączenie kolorowania tekstu dla konkretnych języków
      highlight = {
        enable = true,
        disable = { "latex" }
      },
       -- wyłączenie wcięć tekstu dla konkretnych języków
      indent = {
        enable = true,
        disable = { "latex", "julia" }
      },
    })
  end
}
