return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter").setup()

    -- Instalacja parserów używanych języków
    require("nvim-treesitter").install({
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "cpp",
      "python",
      "json",
      "julia",
      "html",
      "css",
    })

    -- Włączenie kolorowania składni
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "cpp",
        "python",
        "json",
        "julia",
        "html",
        "css",
      },
      callback = function(ev)
        vim.treesitter.start(ev.buf)
      end,
    })

    -- Wyłączenie kolorowania dla LaTeX
    -- oraz wyłączenie wcięć Tree-sitter dla Julii
    -- (LaTeX nie jest tutaj w ogóle uruchamiany przez Tree-sitter)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "julia" },
      callback = function()
        vim.bo.indentexpr = ""
      end,
    })
  end,
}
