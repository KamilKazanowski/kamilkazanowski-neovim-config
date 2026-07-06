return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,

  config = function()
     -- ustawienie skrótów klawiszowych
    vim.keymap.set('n', '<leader>n', ':Neotree<CR>', { silent = true })
    vim.keymap.set('n', '<leader>v', ':Neotree %:p:h<CR>', { silent = true })
    vim.keymap.set('n', '<leader>c', ':Neotree close<CR>', { silent = true })

    require("neo-tree").setup({
      filesystem = {
         -- ustawienie plików, które nie będą wyświetlane w neotree
        filtered_items = {
          hide_by_name = {
            "node_modules",
            ".git",
            "build",
            "AGENTS.md"
          },
          hide_by_pattern = {
            "*.pdf",
            "*.mp4"
          }
        },
      },
      default_component_configs = {
         -- ustawienie wyglądu neotree
        name = {
          trailing_slash = false,
          use_filtered_colors = true,
          use_git_status_colors = false,
          highlight = "NeoTreeFileName",
        },
         -- ustawienie symboli git status
        git_status = {
          symbols = {
            added = "✚",
            modified = "",
            deleted = "✖",
            renamed = "󰁕",
            untracked = "",
            ignored = "",
            unstaged = "󰄱",
            staged = "",
            conflict = "",
          }
        }
      }
    })
  end
}
