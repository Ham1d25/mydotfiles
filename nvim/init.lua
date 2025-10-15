-- ==========================
-- Neovim Purple Theme Config
-- ==========================

-- SETTINGS
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- LEADER KEY
vim.g.mapleader = " "

-- BASIC KEYBINDINGS
local keymap = vim.keymap.set
keymap("n", "<leader>w", ":w<CR>", { desc = "Save file" })
keymap("n", "<leader>q", ":q<CR>", { desc = "Quit" })
keymap("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear highlights" })

-- PLUGIN MANAGER: lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- 🌃 Purple Theme
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      require("tokyonight").setup({
        style = "moon",  -- options: "storm", "moon", "night", "day"
        transparent = false,
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
        },
      })
      vim.cmd("colorscheme tokyonight")
    end,
  },

  -- 📁 File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({})
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    end,
  },

  -- 📊 Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = { theme = "tokyonight", section_separators = "", component_separators = "" },
      })
    end,
  },

  -- 🌈 Syntax & Highlighting
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- 💡 LSP Support
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim", config = true },
  { "williamboman/mason-lspconfig.nvim" },

  -- ✨ Completion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        snippet = { expand = function(args) require("luasnip").lsp_expand(args.body) end },
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
})

-- 🔧 LSP Setup
local lspconfig = require("lspconfig")
require("mason-lspconfig").setup({
  ensure_installed = { "pyright", "lua_ls", "tsserver" },
  handlers = {
    function(server_name)
      lspconfig[server_name].setup({})
    end,
  },
})

-- Optional UI tweaks for purple theme
vim.cmd([[
highlight LineNr guifg=#7aa2f7
highlight CursorLineNr guifg=#bb9af7 gui=bold
highlight Visual guibg=#3b4261
]])
