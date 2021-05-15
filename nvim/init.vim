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
set noshowmatch
set nohlsearch
set expandtab
set incsearch
set termguicolors
set t_Co=256
set completeopt=menuone,noselect

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Setting color line
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" Plugins

call plug#begin('~/.vim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
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

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

highlight Comment cterm=italic gui=italic

" Themes
colors zenburn
let g:airline_theme='violet'

let g:mapleader = "\<Space>"
set timeoutlen=300

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
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25

nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Lexplore <bar> :vertical resize 30<CR>

" Run Script
nmap <leader>r :! ./%<CR>
nmap <leader>gt :w<CR>:! go test<CR>

" Tab managing
nnoremap <leader>e :tabe<Space>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>[ :tabprev<CR>
nnoremap <leader>] :tabnext<CR>

" fuGITive
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

inoremap {<CR> {<CR>}<ESC>O

" File manipulation
nmap <leader>fp :Prettier<CR>

nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

" Import Lua files
lua require('luaconfig')
" GoTo code navigation.
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>     compe#confirm('<CR>') 
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" shortcut
nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
nnoremap <Leader>ee oif err != nil {<CR>log.Fatalf("%+v\n", err)<CR>}<CR><esc>kkI<esc>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
command! Vimrc execute "tabe $MYVIMRC"
command! Source execute "source $MYVIMRC"


fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()