return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "EdenEast/nightfox.nvim",
    -- as = "nightfox",
    config = function()
      require("nightfox").setup()
    end,
  },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "folke/twilight.nvim",
    lazy = false,
    enabled = true,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = true,
    event = { "WinNew" },
  },
  { "tpope/vim-rails",          ft = "ruby" },
  { "tpope/vim-abolish",        lazy = false },
  { "tpope/vim-surround",       lazy = false },
  { "tpope/vim-unimpaired",     lazy = false },
  { "vim-scripts/Align",        lazy = false },
  { "folke/todo-comments.nvim", lazy = false },
  { "keith/rspec.vim",          ft = "ruby" },
  { 'simrat39/rust-tools.nvim' }
}
