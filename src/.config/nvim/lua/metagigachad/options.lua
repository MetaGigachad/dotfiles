local options = {
    fileencoding = 'utf-8',
    swapfile = false,
    showmode = false,

    -- Splits
    splitbelow = true,
    splitright = true,

    -- Indent
    tabstop = 4,
    softtabstop = 4,
    shiftwidth = 4, expandtab = true,
    smartindent = true,

    -- Line numbers
    cursorline = true,
    number = true,
    numberwidth = 3,
    relativenumber = true,
    signcolumn = 'yes',

    -- Completion pop-up size
    pumheight = 12,
    pumwidth = 60,

    -- Spell check
    spell = false,
    spelllang = 'en_us,ru',

    -- Folds
    -- foldcolumn = '1',
    -- foldlevel = 99,
    -- foldlevelstart = 99,
    -- foldenable = true,
    -- fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]],

    -- Status bar
    laststatus = 3,

    -- Winbar
    winbar = '%=%f %m%=',
}

for key, val in pairs(options) do
    vim.opt[key] = val
end

vim.cmd [[let g:netrw_banner=0]]
