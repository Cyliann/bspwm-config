return {
  plugins = {
      "simrat39/rust-tools.nvim",
      "andweeb/presence.nvim",
      "jose-elias-alvarez/typescript.nvim",
      { "olimorris/onedarkpro.nvim", lazy = false },
      { "nyoom-engineering/oxocarbon.nvim", lazy = false },
      { "notken12/base46-colors", lazy = false },
      { "nvim-treesitter/nvim-treesitter-context", lazy = false },
      { "ThePrimeagen/vim-be-good" },
      { "lambdalisue/suda.vim", lazy = false },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = { "rust_analyzer", "tsserver" }
        },
      },
  },

  lsp = {
    setup_handlers = {
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end
    },
  },

  mappings = {
    i = {
      -- go to  beginning and end
      ["<C-b>"] = { "<ESC>^i", desc = "beginning of line" },
      ["<C-e>"] = { "<End>", desc = "end of line" },

      -- navigate within insert mode
      ["<C-h>"] = { "<Left>", desc = "move left" },
      ["<C-l>"] = { "<Right>", desc = "move right" },
      ["<C-j>"] = { "<Down>", desc = "move down" },
      ["<C-k>"] = { "<Up>", desc = "move up" },
    },
  
    n = {
      -- Switch buffers
      L = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc = "Next buffer" },
      H = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc = "Previous buffer" },

      -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
      -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
      -- empty mode is same as using <cmd> :map
      -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
      ["<expr> j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down" },
      ["<expr> k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up" },

      ["<C-d>"] = { "<C-d>zz"},
      ["<C-u>"] = { "<C-u>zz"},

      -- Use ";" as command mode
      [";"] = { ":" },
    },

    v = {
      -- Use ";" as command mode
      [";"] = { ":" },
    },

    x = {
      -- Dellete text when pasting instead of overwriting register
      ["p"] = { '"_dP' },
    },
  },

  options = {
      g = {
        mapleader = " ", -- sets vim.g.mapleader
        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
        cmp_enabled = true, -- enable completion at start
        autopairs_enabled = true, -- enable autopairs at start
        diagnostics_enabled = true, -- enable diagnostics at start
        status_diagnostics_enabled = true, -- enable diagnostics in statusline
        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
        suda_smart_edit = 1;
      }, 

      opt = {
        foldenable = false,
        foldexpr = "nvim_treesitter#foldexpr()",
        foldmethod = "expr",
        guifont = { "FiraCode Nerd Font", ":h14" },
      },
    },
}
