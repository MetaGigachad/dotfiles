local function dir_exists(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end
local function is_inside_dir(path)
  local cwd = vim.loop.cwd()
  while cwd ~= "/" do
    if cwd == path then
      return true
    end
    cwd = vim.fs.dirname(cwd)
  end
  return false
end
local arcadia_dir = os.getenv "HOME" .. "/arcadia"
ARCADIA_MODE = vim.fn.executable "arc" == 1 and dir_exists(arcadia_dir) and is_inside_dir(arcadia_dir)

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

  require("lazy").setup({ import = "custom.plugins", checker = { enabled = false } }, { change_detection = { notify = false } })
end

if os.getenv "IS_REMOTE" == "1" then
  require "custom.clipboard"
end
require "custom.utils"
