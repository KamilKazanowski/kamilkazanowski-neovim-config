return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({})

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp_ok, cmp = pcall(require, "cmp")
    if cmp_ok then
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end

    local Rule = require("nvim-autopairs.rule")

     -- $$ do latexa
    npairs.add_rule(
      Rule("$", "$", "tex")
        :with_pair(function(opts)
          local prev = opts.line:sub(opts.col - 1, opts.col)
          return prev ~= "$$"
        end)
        :with_move(function(opts)
          return opts.char == "$"
        end)
    )
  end,
}
