------------------------------------------------------------------------
-- YES I VIBECODED THIS THING
-- 
-- please note that require("helpwindow").setup()
-- in init.lua is required for this to work
------------------------------------------------------------------------

local M = {}

function M.setup()
  ------------------------------------------------------------------------
  -- Opens the floating help window.
  ------------------------------------------------------------------------

  local function open_help_window()
    local width = math.floor(vim.o.columns * 0.7)
    local height = math.floor(vim.o.lines * 0.7)

    ----------------------------------------------------------------------
    -- Create scratch buffer.
    ----------------------------------------------------------------------

    local buf = vim.api.nvim_create_buf(false, true)

    vim.bo[buf].bufhidden = "wipe"
    vim.bo[buf].filetype = "text"

    ----------------------------------------------------------------------
    -- Buffer contents.
    ----------------------------------------------------------------------

    vim.api.nvim_buf_set_lines(buf, 0, -1, false, {
      "# Very helpful notes^^",
      "",
      "Generic Vim",
      "",
      "  :split             Open file in split view",
      "  Ctrl-W Ctrl-W      Switch between files opened in split view",
      "  :tabe              Open file as new tab",
      "  :tabn              Go to next tab",
      "  :tabp              Go to previous tab",
      "",
      "  :%s/w1/w2/g        Replace w1 with w2 in whole file",
      "  :'<,'>s/w1/w2/g    Replace w1 with w2 in selected text",
      "  Change g to gc to ask for confirmation of every change",
      "",
      "Telescope",
      "",
      "  ff                 Open FuzzyFind",
      "  fg                 Open Grep",
      "",
      "Vim slime",
      "",
      "  Ctrl-C Ctrl-C      Send text into another terminal",
      "",
      "Opencode",
      "",
      "  /init              Init opencode project",
      "  /undo              Undo changes made by AI",
      "",
      "  ,a                 Ask opencode",
      "  ,q                 Execute opencode action",
      "  ,t                 Toggle opencode window",
      "  ,<Tab>             Toggle opencode mode",
      "",
      "Spell check",
      "",
      "  :set spell!        Enable spell check",
      "  :set spelllang=pl  Change spell check language to polish",
      "",
      "  [s                 Go to next typo",
      "  ]s                 Go to previous typo",
      "  z=                 Open suggestions",
      "  zg                 Add to dictionary",
      "  zug                Remove from dictionary",
      "  zw                 Add to antidictionary",
      "  zuw                Remove from antidictionary",
      "",
      "Vimtex",
      "",
      "  :cc                Go to line where compilation error occured",
      "",
      "  ## Text words used with c for change and d for delete",
      "",
      "  se                 Surrounding environments",
      "  sc                 Surrounding commands",
      "  sd                 Surrounding delimiters",
      "  s$                 Surrounding math",
      "",
      "  ## Text words used with t for toggle",
      "",
      "  sc                 Surrounding commands",
      "  ss                 Surrounding environments",
      "  se                 Surrounding environments (to related)",
      "  s$                 Surrounding mathe",
      "  sd                 Surrounding delimiters",
      "  sf                 Surrounding fractions",
      "",
      "  ## Movement keybinds",
      "",
      "  [[                 Go to next section",
      "  ]]                 Go to previous section",
      "  [r                 Go to next beamer slide",
      "  ]r                 Go to previous beamer slide",
    })

    ----------------------------------------------------------------------
    -- Turn off ability to modify buffer.
    ----------------------------------------------------------------------

    vim.bo[buf].modifiable = false
    vim.bo[buf].readonly = true

    ----------------------------------------------------------------------
    -- Color buffer.
    ----------------------------------------------------------------------

    local ns = vim.api.nvim_create_namespace("helpwindow")

    -- Nagłówek
    vim.api.nvim_buf_add_highlight(buf, ns, "Title", 0, 0, -1)

    -- Tytuł sekcji Generic Vim
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 2, 0, -1)

    -- Komendy
    vim.api.nvim_buf_add_highlight(buf, ns, "Type", 4, 0, 9)
    for line = 6, 11 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Type", line, 2, 18)
    end

    -- Skrót Ctrl-W Ctrl-W
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 5, 0, 16)

    -- Komentarz
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 12, 8, 10)
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 12, 14, 16)

    -- Tytuł sekcji Telescope
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 14, 0, -1)

    -- Skróty klawiszowe
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 16, 0, 10)
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 17, 0, 10)

    -- Tytuł sekcji Vim slime
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 19, 0, -1)

    -- Skróty Ctrl-C Ctrl-C 
    vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", 21, 0, 15)

    -- Tytuł sekcji Opencode
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 23, 0, -1)

    -- Skróty klawiszowe
    for line = 25, 31 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", line, 0, 9)
    end

    -- Tytuł sekcji Spell check
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 33, 0, -1)

    -- Komendy
    vim.api.nvim_buf_add_highlight(buf, ns, "Type", 35, 0, 15)
    vim.api.nvim_buf_add_highlight(buf, ns, "Type", 36, 0, 19)

    -- Skróty klawiszowe
    for line = 38, 44 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", line, 2, 20)
    end

    -- Tytuł sekcji Vimtex
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 46, 0, -1)

    -- Komenda :cc
    vim.api.nvim_buf_add_highlight(buf, ns, "Type", 48, 2, 15)

    -- Tytuł podsekcji text words 1
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 50, 0, -1)

    -- Skróty klawiszowe
    for line = 52, 55 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", line, 2, 20)
    end

    -- Tytuł podsekcji text words 2
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 57, 0, -1)

    -- Skróty klawiszowe
    for line = 59, 64 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", line, 2, 20)
    end

    -- Tytuł podsekcji Movement keybinds
    vim.api.nvim_buf_add_highlight(buf, ns, "Special", 66, 0, -1)

    -- Skróty klawiszowe
    for line = 68, 71 do
      vim.api.nvim_buf_add_highlight(buf, ns, "Keyword", line, 2, 20)
    end

    ----------------------------------------------------------------------
    -- Open floating window.
    ----------------------------------------------------------------------

    local win = vim.api.nvim_open_win(buf, true, {
      relative = "editor",
      width = width,
      height = height,
      row = math.floor((vim.o.lines - height) / 2),
      col = math.floor((vim.o.columns - width) / 2),
      border = "solid",
      style = "minimal",
      title = " Cheatsheet ",
      title_pos = "center",
    })

    vim.wo[win].wrap = true

    ----------------------------------------------------------------------
    -- Close mappings.
    ----------------------------------------------------------------------

    local function close()
      if vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_close(win, true)
      end
    end

    vim.keymap.set("n", "q", close, { buffer = buf, silent = true })
    vim.keymap.set("n", "<Esc>", close, { buffer = buf, silent = true })
    vim.keymap.set("n", "<CR>", close, { buffer = buf, silent = true })
  end

  ------------------------------------------------------------------------
  -- User command.
  ----------------------------------------------------------------------

  vim.api.nvim_create_user_command("HelpWindow", open_help_window, {
    desc = "Open floating help window",
  })
end

return M
