 -- wyświetlanie diagnostyki w bieżącej linijce
vim.diagnostic.config({
  virtual_text = { current_line = true }
})

 -- ustawienie skrótów klawiszowych
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf }

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, opts)
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
  end,
})

 -- włączenie i konfiguracja LSP
vim.lsp.enable({"lua_ls"})
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

vim.lsp.enable({"julials"})
