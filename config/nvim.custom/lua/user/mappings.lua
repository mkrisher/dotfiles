-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

    -- splits
    ["\\"] = false,
    ["-"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<leader>s"] = { "<cmd>split<cr>", desc = "Horizontal Split" },
    ["<leader>v"] = { "<cmd>vsplit<cr>", desc = "Vertical Split" },

    -- moving lines
    ["<leader>j"] = { "<cmd>m+<cr>==", desc = "move line down" },
    ["<leader>k"] = { "<cmd>m-2<cr>==", desc = "move line up" },

    -- clear search highlights
    ["<leader> "] = { "<cmd>noh<cr>", desc = "remove search highlights" }
  },
  t = {
    -- setting a mapping to false will disable it
    ["\\"] = false,
  },
  v = {
    -- moving lines
    ["<leader>j"] = { "<cmd>m'>+<cr>gv=gv", desc = "move line down" },
    ["<leader>k"] = { "<ESC>m-2<cr>gv=gv", desc = "move line up" },

    -- indents
    ["<"] = { "<cmd><<cr>gv", desc = "indent left" },
    [">"] = { "<cmd>><cr>gv", desc = "indent right" }
  },
  i = {
    -- moving lines
    ["<leader>j"] = { "<ESC>m+<cr>==gi", desc = "move line down" },
    ["<leader>k"] = { "<ESC>m-2<cr>==gi", desc = "move line up" }
  }
}
