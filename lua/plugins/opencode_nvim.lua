---@diagnostic disable: undefined-doc-name
return {
  "nickjvandyke/opencode.nvim",
  version = "*",
  dependencies = {
    {
      ---@module "snacks"
      "folke/snacks.nvim",
      optional = true,
      opts = {
        input = {},
        picker = {
          actions = {
            opencode_send = function(...) return require("opencode").snacks_picker_send(...) end,
          },
          win = {
            input = {
              keys = {
                ["<a-a>"] = { "opencode_send", mode = { "n", "i" } },
              },
            },
          },
        },
      },
    },
  },
  config = function()
    ---@type opencode.Opts
    vim.g.opencode_opts = {}

    vim.o.autoread = true

    local current = "build"

     -- ustawienie skrótów klawiszowych
    vim.keymap.set({ "n", "x" }, "<localleader>a",
      function()
        require("opencode").ask("@this: ",
          { submit = true })
      end,
      { desc = "Ask opencode…" }
    )

    vim.keymap.set({ "n", "x" }, "<localleader>q",
      function()
        require("opencode").select()
      end,
      { desc = "Execute opencode action…" }
    )

    vim.keymap.set({ "n", "x" }, "<localleader>t",
      function()
        require("opencode").toggle()
      end,
      { desc = "Toggle opencode" }
    )

    vim.keymap.set({"n", "x"},"<localleader><Tab>",
      function()
        local api = require("opencode.api")

        if current == "build" then
          api.agent_plan()
          current = "plan"
        else
          api.agent_build()
          current = "build"
        end
      end,
      { desc = "Toggle opencode mode" }
    )
  end,
}
