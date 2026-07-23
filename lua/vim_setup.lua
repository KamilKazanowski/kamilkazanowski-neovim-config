 -- ustawienie języka angielskiego
vim.cmd("language en_US")

 -- ustawienie tabu na dwie spacje
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

 -- ustawienie split by pojawiał się w dolnej lub prawej części ekranu
vim.opt.splitbelow = true
vim.opt.splitright = true

 -- ustawienie trybu visual block by można było się w nim swobodnie poruszać
vim.opt.virtualedit = "block"

 -- ustawienie 24-bitowych kolorów RGB
vim.opt.termguicolors = true

 -- ustawienie mapleader i localleader
vim.g.mapleader = " "
vim.g.maplocalleader = ","

 -- ustawienie zawijania tekstu dla bardzo długich linijek - zachowanie wcięć i zawijanie po słowach
vim.opt.breakindent = true
vim.opt.linebreak = true

 -- ustawienie numeracji linijek i względnej numberacji
vim.opt.number = true
vim.opt.relativenumber = true

 -- podświetl linijkę, w której znajduje się kursor
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

 -- ustawienie j i k w zawiniętych linijkach
vim.keymap.set({'n', 'o', 'x'}, 'j', 'gj')
vim.keymap.set({'n', 'o', 'x'}, 'k', 'gk')

 -- ustawienie by x nie nadpisywało rejestru
vim.keymap.set({ "n", "x" }, "x", '"_x')

 -- ustawienie by zamiana tekstu przez wklejenie nie nadpisywała rejestru
vim.keymap.set("x", "p", '"_dP')

 -- wyrzucenie skrótów które mnie denerwują
vim.keymap.set("n", "J", "")
