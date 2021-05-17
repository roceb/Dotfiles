"        _
" __   _(_)_ __ ___  _ __ ___
" \ \ / / | '_ ` _ \| '__/ __|
"  \ V /| | | | | | | | | (__
"   \_/ |_|_| |_| |_|_|  \___|

syntax on
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set nu
set relativenumber
set smartcase
set nowrap
set ignorecase
set signcolumn=yes
set scrolloff=8
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set guicursor=
set completeopt=menuone,noselect

" Setting color line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'tpope/vim-fugitive'
Plug 'mbbill/undotree'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'liuchengxu/vim-which-key'

call plug#end()

" Themes
colors zenburn
let g:airline_theme='violet'

let g:mapleader = "\<Space>"
set timeoutlen=500

" Navigation
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Fzf stuff
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Window managing
let g:netrw_browse_split = 2
let g:netrw_winsize = 25
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Lexplore <bar> :vertical resize 30<CR>

" Go Shortcuts
autocmd FileType go map <buffer> <F12> :GoTest<CR>
autocmd FileType go imap <buffer> <F12> :GoTest<CR>
autocmd FileType go map <buffer> <F10> :GoBuild<CR>
autocmd FileType go imap <buffer> <F10> :GoBuild<CR>
autocmd FileType go map <buffer> <F1> :GoRun<CR>
autocmd FileType go map <buffer> <F1> :GoRun<CR>
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" Run Script
nmap <leader>r :! ./%<CR>

" Tab managing
nnoremap <leader>e :tabe<Space>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>[ :tabprev<CR>
nnoremap <leader>] :tabnext<CR>

" FuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>


inoremap {<CR> {<CR>}<ESC>O

" File manipulation
nmap <leader>fp :Prettier<CR>

" Import Lua files
lua require('luaconfig')
" GoTo code navigation.
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>     compe#confirm('<CR>') 
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })
