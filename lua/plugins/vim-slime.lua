return {
  "jpalardy/vim-slime",
  config = function()
    vim.g.slime_target = "kitty"
    vim.g.slime_default_config = {
      window_id = 2,
      listen_on = os.getenv("KITTY_LISTEN_ON"),
    }
  end
} -- jeśli szukasz skrótu to jest to Ctrl-C Ctrl-C :)
