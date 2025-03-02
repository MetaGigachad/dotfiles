local function dir_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

ARCADIA_MODE = vim.fn.executable("arc") == 1 and dir_exists(os.getenv("HOME") .. "/arcadia")

if vim.g.vscode then
  require "custom.vscode.keymaps"
else
  vim.g.mapleader = " "
  vim.g.maplocalleader = ","

  local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
  if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    }
  end
  vim.opt.rtp:prepend(lazypath)

  require("lazy").setup({ import = "custom.plugins" }, { change_detection = { notify = false } })
end

require "custom.clipboard"
require "custom.utils"
