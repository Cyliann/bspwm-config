return {
  colorscheme = "onedark",
  plugins = {
    "simrat39/rust-tools.nvim",
    "andweeb/presence.nvim",
    "jose-elias-alvarez/typescript.nvim",
    { "adishourya/base46", lazy = false },
    { "nvim-treesitter/nvim-treesitter-context", lazy = false },
    { "lambdalisue/suda.vim", lazy = false },
    { "rose-pine/neovim", lazy = false },
    { "mg979/vim-visual-multi", lazy = false },
    {
      "olexsmir/gopher.nvim",
      ft = "go",
      config = function(_, opts) require("gopher").setup(opts) end,
      build = function() vim.cmd [[silent! GoInstallDeps]] end,
    },
    {
      "iamcco/markdown-preview.nvim",
      run = "cd app && npm install",
      setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
      ft = { "markdown" },
    },
    {
      "williamboman/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "rust_analyzer", "tsserver", "wgsl_analyzer" },
      },
    },
    {
      "nvim-treesitter/nvim-treesitter",
      opts = {
        rainbow = {
          enable = true,
          highlight_middle = true,
          max_file_lines = nil,
        },
      },
    },
    {
      "L3MON4D3/LuaSnip",
      config = function(plugin, opts)
        -- include the default astronvim config that calls the setup call
        require "plugins.configs.luasnip"(plugin, opts)
        -- load snippets paths
        require("luasnip.loaders.from_vscode").lazy_load {
          -- this can be used if your configuration lives in ~/.config/nvim
          -- if your configuration lives in ~/.config/astronvim, the full path
          -- must be specified in the next line
          paths = { "./lua/user/snippets" },
        }
      end,
    },
    {
      "goolord/alpha-nvim",
      opts = function(_, opts) -- override the options using lazy.nvim
        local header = {
          [[           ██╗   ██╗██╗███╗   ███╗            ]],
          [[           ██║   ██║██║████╗ ████║            ]],
          [[           ██║   ██║██║██╔████╔██║            ]],
          [[           ╚██╗ ██╔╝██║██║╚██╔╝██║            ]],
          [[            ╚████╔╝ ██║██║ ╚═╝ ██║            ]],
          [[             ╚═══╝  ╚═╝╚═╝     ╚═╝            ]],
          [[                                              ]],
          [[   ███████╗██╗   ██╗ ██████╗██╗  ██╗███████╗  ]],
          [[   ██╔════╝██║   ██║██╔════╝██║ ██╔╝██╔════╝  ]],
          [[   ███████╗██║   ██║██║     █████╔╝ ███████╗  ]],
          [[   ╚════██║██║   ██║██║     ██╔═██╗ ╚════██║  ]],
          [[   ███████║╚██████╔╝╚██████╗██║  ██╗███████║  ]],
          [[   ╚══════╝ ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝  ]],
        }
        opts.section.header.val = header -- change the header section value
      end,
    },
  },

  lsp = {
    setup_handlers = {
      tsserver = function(_, opts) require("typescript").setup { server = opts } end,
      rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
    },
    config = {
      wgsl_analyzer = function(err, result, ctx, config)
        return {
          success = true,
          customImports = { _dummy_ = "dummy" },
          shaderDefs = {},
          trace = {
            extension = false,
            server = false,
          },
          inlayHints = {
            enabled = true,
            typeHints = true,
            parameterHints = true,
            structLayoutHints = true,
            typeVerbosity = "inner",
          },
          diagnostics = {
            typeErrors = true,
            nagaParsingErrors = true,
            nagaValidationErrors = true,
            nagaVersion = "main",
          },
        }
      end,
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
      ["L"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["H"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },

      -- Allow moving the cursor through wrapped lines with j, k, <Up> and <Down>
      -- http://www.reddit.com/r/vim/comments/2k4cbr/problem_with_gj_and_gk/
      -- empty mode is same as using <cmd> :map
      -- also don't use g[j|k] when in operator pending mode, so it doesn't alter d, y or c behaviour
      ["<expr> j"] = { 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', desc = "move down" },
      ["<expr> k"] = { 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', desc = "move up" },

      ["<C-d>"] = { "<C-d>zz" },
      ["<C-u>"] = { "<C-u>zz" },

      -- Use ";" as command mode
      [";"] = { ":" },

      ["<leader>m"] = { "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle markdown preview" },

      ["s"] = { ":%s/", desc = "Search and replace" },
      ["<leader>E"] = { ":cd %:p:h<cr>", desc = "Change workdir to current open file" },

      -- Gopher
      ["<leader>G"] = { name = "Gopher" },
      ["<leader>Ge"] = { "<cmd>GoIfErr<cr>", desc = "Inline Go if err" },
      ["<leader>Gj"] = { "<cmd>GoTagAdd<cr>", desc = "Add JSON tags for Go struct" },
      ["<leader>Gt"] = { "<cmd>GoTestAdd<cr>", desc = "Generate test for current function" },
      ["<leader>GT"] = { "<cmd>GoTestAll<cr>", desc = "Generate tests for all functions" },
    },

    v = {
      -- Use ";" as command mode
      [";"] = { ":" },

      ["s"] = { ":s/", desc = "Search and replace" },
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
      suda_smart_edit = 1,
      autochdir = true,
    },

    opt = {
      foldenable = false,
      foldexpr = "nvim_treesitter#foldexpr()",
      foldmethod = "expr",
      guifont = { "FiraCode Nerd Font", ":h14" },
      scrolloff = 10,
      -- iskeyword = { '_', '-', '/', '.' },
    },
  },
}
