" https://github.com/junegunn/vim-plug
" ru this before if working on a new computer in one line:
" curl -fLO $HOME/.config/nvim/autoload/plug.vim --create-dirs \
" https://raw.githubuser.content.com/junegunn/vim-plug/master/plug.vim

syntax on

set ma
set exrc
set guicursor=
set relativenumber
set nohlsearch
set hidden
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=4
set expandtab
set smartindent
set nu
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=10
set noshowmode
set backspace=indent,eol,start
set signcolumn=yes
set ruler
set colorcolumn=80
set cmdheight=2
set updatetime=50
set shortmess+=c
set mouse=a

highlight ColorColumn ctermbg=0 guibg=lightgrey

" plugin installations
call plug#begin('~/.config/nvim/plugged')

Plug 'sbdchd/neoformat'
Plug 'morhetz/gruvbox'

Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'

Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'

Plug 'junegunn/fzf'
Plug 'vim-utils/vim-man'
Plug 'ctrlpvim/ctrlp.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'

Plug 'godlygeek/tabular'
Plug 'scrooloose/syntastic'

" some language servers aren't working properly
" need to figure out keybindings for this plug
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'kiteco/vim-plugin'

call plug#end()

" theme
colorscheme gruvbox
set background=dark

" grep
if executable('rg')
    let g:rg_derive_root='true'
endif

" format on save
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" ctrlp
let g:crtlp_user_command_ = ['.git/', 'git --git-dir=$s/.git ls-files -oc --exlclude-standard']
let g:ctrlp_use_caching=0

" kite support
let g:kite_supported_languages = ['*']
let g:kite_tab_complete=1
set completeopt+=menuone
set completeopt+=noselect
set completeopt+=preview
autocmd CompleteDone * if !pumvisible() | pclose | endif
set belloff+=ctrlg
let g:kite_previous_placeholder = '<C-H>'
let g:kite_next_placeholder = '<C-L>'

" map + window misc
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g_netrw_winsize=25

" hotkey map
"
" move between panes
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" TREES
" show history changes
nnoremap <leader>u :UndotreeShow<CR>
" show directory tree
nnoremap <leader>t :NERDTreeFocus<CR>

" window split
nnoremap <leader>pv :wincmd V<bar> :Ex <bar> :vertical resize 30<CR>

" repgrep
nnoremap <leader>ps :Rg<SPACE>

" source new version
nnoremap <leader> b: source %<CR>

" Back tab
nnoremap <Leader>Tab :e#<CR>

" lua telescope
noremap <leader>pq :lua require('telescope.builtin').find_files()<cr>

" resize active pane
nnoremap <silent> <Leader>. :vertical resize +5<CR>
nnoremap <silent> <Leader>, :vertical resize -5<CR>n
