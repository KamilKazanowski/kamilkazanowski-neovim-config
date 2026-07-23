return {
  "lervag/vimtex",
  lazy = false,
  config = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_method = 'latexmk'

     -- kiedy piszesz w latexu zawsze ignoruj ostrzeżenia (błędy też jeśli plik się kompiluje)
    vim.g.vimtex_quickfix_open_on_warning = 0

     -- ustawienie tworzenia katalogu build na pliki tymczasowe
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "build",
      options = {
        "-shell-escape",
        "-verbose",
        "-file-line-error",
        "-interaction=nonstopmode",
        "-synctex=1",
        "-output-directory=build",
      }
    }

    vim.keymap.set('n', '<localleader>v', ':VimtexView<CR>', { silent = true })
  end
}
