set noswapfile
set showmode

set splitbelow
set splitright

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent

set number
set relativenumber
set signcolumn=yes
set hlsearch

let g:mapleader=' '

nmap <C-p> "*p
vmap <C-p> "*p
nmap <C-y><C-y> "*yy
vmap <C-y> "*y

nmap <leader>h :nohlsearch<CR>;

nmap <C-d> <C-d>zz;
nmap <C-u> <C-u>zz;
nmap n nzzzv;
nmap N Nzzzv;

nmap <leader>bd :bdelete<CR>;
nmap <leader>bn :bn<CR>;
nmap <leader>bp :bp<CR>;

nmap <leader>e :Ex<CR>;
