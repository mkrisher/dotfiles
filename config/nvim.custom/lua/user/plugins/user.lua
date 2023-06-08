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
    as = "nightfox",
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
    "tpope/vim-rails",
    -- lazy-load on a command
    cmd = "Rails",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  "tpope/vim-abolish",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  "vim-scripts/Align",
  "folke/todo-comments.nvim",
  "keith/rspec.vim",
}