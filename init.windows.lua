-- Editor setup
local opt = vim.opt
opt.syntax = "on"
opt.number = true
opt.relativenumber = true
opt.autoindent = true
opt.ignorecase = true
opt.smartcase = true
opt.clipboard:append({ "unnamedplus" })

-- Keymap setup
vim.g.mapleader = " "

local mode_nv = { "n", "v" }
local mode_v = { "v" }
local mode_i = { "i" }
local nmappings = {
    { from = ";",  to = ":" },
    { from = ">",  to = ">>" },
    { from = "<",  to = "<<" },
    { from = "q;", to = "q:" },
}

for _, mapping in ipairs(nmappings) do
  vim.keymap.set(mapping.mode or "n", mapping.from, mapping.to, { noremap = true })
end


-- Lazy setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local PLUGIN_PROXY = ""
local plugins = {
  {
    "ggandor/leap.nvim",
    keys = {"s",'S'},
    config = function()
      vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
      vim.keymap.set('n',             'S', '<Plug>(leap-from-window)')
    end
  },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },
  {
    "echasnovski/mini.comment",
    version = false,
    config = function()
      require("mini.comment").setup()
    end
  },
  {
    "echasnovski/mini.jump",
    verison = false,
    config = function()
      require("mini.jump").setup({
        mappings = {
          forward = "f",
          backward = "F",
          forward_till = "t",
          backward_till = "T",
          repeat_jump = "",
        }
      })
    end
  },
  {
    "nvimdev/hlsearch.nvim",
    event = "BufRead",
    cond = (not vim.g.vscode),
    config = function()
      require("hlsearch").setup()
    end
  },
  {
    "drop-stones/im-switch.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      -- your configurations
      set_default_im_events = { "VimEnter", "InsertLeave", "CmdlineLeave" },
      -- save_im_events = {},
      -- set_previous_im_events = {},
    	windows = {
    		enabled = true,
    	},
    }
  }
}

require("lazy").setup({
  plugins
})


if vim.g.vscode then
  -- vscode neovim
else
  -- native neovim
end
