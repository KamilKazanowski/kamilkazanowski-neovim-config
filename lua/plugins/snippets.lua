return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "kdheepak/cmp-latex-symbols",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end
        },
         -- ustawienie wyglądu okien
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
         -- ustawienie skrótów klawiszowych
        mapping = cmp.mapping.preset.insert({
          ['<C-d>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.scroll_docs(4)
            else
              fallback()
            end
          end, { "i", "c" }),

          ['<C-u>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.scroll_docs(-4)
            else
              fallback()
            end
          end, { "i", "c" }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ['<CR>'] = cmp.mapping.confirm({ select = false }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = 'luasnip' },
          { name = "path" },
          { name = 'buffer' },
        })
      })

      -- ustawienie własnych snippetów
      local s = luasnip.snippet
      local t = luasnip.text_node
      local i = luasnip.insert_node
      local fmt = require("luasnip.extras.fmt").fmt

      local latex_snippets = {
        s("usepackage", fmt([[\usepackage{{{}}}]], {
          i(1, "package"),
        })),
        s("documentclass", { t("\\documentclass{}") }),
      }

      local beamer_snippets = {
        s("frame", fmt(
            [[
            \begin{{frame}}{{{}}}
              {}
            \end{{frame}}
            ]],
          {
            i(1, "Tytuł"),
            i(2, "Treść"),
          })),
      }

      luasnip.add_snippets("tex", latex_snippets)
      luasnip.add_snippets("tex", beamer_snippets)

      local julia_packages = {
        s("DifferentialEquations", { t("DifferentialEquations") }),
        s("BenchmarkTools", { t("BenchmarkTools") }),
        s("ParameterizedFunctions", { t("ParameterizedFunctions") }),
        s("DiffEqCallbacks", { t("DiffEqCallbacks") }),
        s("Distributions", { t("Distributions") }),
        s("LinearAlgebra", { t("LinearAlgebra") }),
        s("Plots", { t("Plots") }),
        s("Makie", { t("Makie") }),
        s("CairoMakie", { t("CairoMakie") }),
        s("GLMakie", { t("GLMakie") }),
        s("Franklin", { t("Franklin") })
      }

      local greek_letters = {
        s("alpha", { t("α") }),
        s("Alpha", { t("Α") }),
        s("beta", { t("β") }),
        s("Beta", { t("Β") }),
        s("gamma", { t("γ") }),
        s("Gamma", { t("Γ") }),
        s("delta", { t("δ") }),
        s("Delta", { t("Δ") }),
        s("epsilon", { t("ε") }),
        s("Epsilon", { t("Ε") }),
        s("zeta", { t("ζ") }),
        s("Zeta", { t("Ζ") }),
        s("eta", { t("η") }),
        s("Eta", { t("Η") }),
        s("theta", { t("θ") }),
        s("Theta", { t("Θ") }),
        s("iota", { t("ι") }),
        s("Iota", { t("Ι") }),
        s("kappa", { t("κ") }),
        s("Kappa", { t("Κ") }),
        s("lambda", { t("λ") }),
        s("Lambda", { t("Λ") }),
        s("mu", { t("μ") }),
        s("Mu", { t("Μ") }),
        s("nu", { t("ν") }),
        s("Nu", { t("Ν") }),
        s("xi", { t("ξ") }),
        s("Xi", { t("Ξ") }),
        s("omicron", { t("ο") }),
        s("Omicron", { t("Ο") }),
        s("pi", { t("π") }),
        s("Pi", { t("Π") }),
        s("rho", { t("ρ") }),
        s("Rho", { t("Ρ") }),
        s("sigma", { t("σ") }),
        s("Sigma", { t("Σ") }),
        s("tau", { t("τ") }),
        s("Tau", { t("Τ") }),
        s("upsilon", { t("υ") }),
        s("Upsilon", { t("Υ") }),
        s("phi", { t("φ") }),
        s("Phi", { t("Φ") }),
        s("chi", { t("χ") }),
        s("Chi", { t("Χ") }),
        s("psi", { t("ψ") }),
        s("Psi", { t("Ψ") }),
        s("omega", { t("ω") }),
        s("Omega", { t("Ω") }),
      }

      luasnip.add_snippets("julia", greek_letters)
      luasnip.add_snippets("julia", julia_packages)
    end
  }
}
