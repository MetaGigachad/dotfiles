local function trim(s)
  return s:match("^%s*(.-)%s*$")
end

local function arc_diff(opts)
  opts = opts or {}
  local compare_target = opts.merge_base_with or 'HEAD'

  local file = vim.api.nvim_buf_get_name(0)
  local repo_root = trim(vim.fn.system('arc rev-parse --show-toplevel'))

  if vim.v.shell_error ~= 0 or repo_root == '' then
    vim.api.nvim_err_writeln('Not inside a git repository')
    return
  end

  local relative_path_cmd = string.format(
    'realpath --relative-to=%s %s',
    vim.fn.shellescape(repo_root),
    vim.fn.shellescape(file)
  )
  local relative_path = trim(vim.fn.system(relative_path_cmd))
  if vim.v.shell_error ~= 0 or relative_path == '' then
    vim.api.nvim_err_writeln('Error calculating relative file path')
    return
  end

  -- If comparing with the merge base, determine it
  if opts.merge_base_with then
    compare_target = trim(vim.fn.system('arc merge-base HEAD ' .. vim.fn.shellescape(opts.merge_base_with)))
    if vim.v.shell_error ~= 0 or compare_target == '' then
      vim.api.nvim_err_writeln('Cannot determine merge-base with branch: ' .. opts.merge_base_with)
      return
    end
  end

  -- Open vertical split and populate buffer with git version
  vim.cmd('vert new')
  local git_cmd = string.format('arc show %s:%s', compare_target, vim.fn.shellescape(relative_path))
  vim.cmd(string.format('read !%s', git_cmd))

  if vim.v.shell_error ~= 0 then
    vim.api.nvim_err_writeln('Failed to get file from commit ' .. compare_target .. ': ' .. relative_path)
    vim.cmd 'bd!'
    return
  end

  -- Set buffer options for readonly git version buffer
  vim.bo.buftype = 'nofile'
  vim.bo.bufhidden = 'wipe'
  vim.bo.swapfile = false
  vim.bo.readonly = true
  vim.bo.modifiable = false
  vim.cmd(string.format('file %s:%s', compare_target, relative_path))

  -- Enable diff mode
  vim.cmd 'diffthis'
  vim.cmd 'wincmd p'
  vim.cmd 'diffthis'
end

if ARCADIA_MODE then
  local map = vim.keymap.set
  local opts = { noremap = true, silent = true }
  map("n", "<leader>ad", arc_diff, opts)
  map("n", "<leader>aD", function() arc_diff({ merge_base_with = 'trunk' }) end, opts)
end
