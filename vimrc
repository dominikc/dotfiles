call plug#begin()
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" Syntax
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tejr/vim-tmux'
Plug 'vim-ruby/vim-ruby'

" Editor
Plug 'AndrewRadev/splitjoin.vim'
Plug 'chrisbra/NrrwRgn'
Plug 'dietsche/vim-lastplace'
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate'
Plug 'gregsexton/MatchTag'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'justinmk/vim-sneak'
Plug 'marcweber/vim-addon-mw-utils'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tomtom/tlib_vim'

" Text objects
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tmhedberg/matchit'
Plug 'wellle/targets.vim'

" UI / Commands
Plug 'airblade/vim-gitgutter'
Plug 'aquach/vim-http-client'
Plug 'bling/vim-airline'
Plug 'calebsmith/vim-lambdify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'edkolev/tmuxline.vim'
Plug 'gabesoft/vim-ags'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'keithbsmiley/investigate.vim'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'myusuf3/numbers.vim'
Plug 'rking/ag.vim'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'morhetz/gruvbox'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'

" Window Management
Plug 'jimsei/winresizer'
Plug 'regedarek/ZoomWin'
Plug 'wesQ3/vim-windowswap'

call plug#end()

set number
set hlsearch
set ignorecase
set smartcase
set nowrap
set cursorline
set colorcolumn=80
set noshowmode
set lazyredraw
set listchars=tab:▸\ ,trail:·,eol:¬
set diffopt=filler,vertical
set noswapfile
set nobackup
set nowritebackup
set scrolloff=5
set shiftround
set splitbelow
set splitright
set t_Co=256
set undodir=~/.vim/undodir
set undofile
set undolevels=1000

nnoremap <silent> <Leader>/ :nohlsearch<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

autocmd QuickFixCmdPost *grep* cwindow

nmap <Leader>a :Ag<Space>
nmap <Leader>T :TagbarToggle<CR>
nmap <Leader>rs :call RunNearestSpec()<CR>
nmap <Leader>rr :call RunCurrentSpecFile()<CR>
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk
nmap <Leader>z :UndotreeShow<CR>
nmap <Leader>Z :UndotreeHide<CR>
vmap <Enter> <Plug>(EasyAlign)

nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gb :Gblame<CR>
nnoremap <space>wh <C-w>h
nnoremap <space>wj <C-w>j
nnoremap <space>wk <C-w>k
nnoremap <space>wl <C-w>l
nnoremap <space>w- <C-w>s
nnoremap <space>w/ <C-w>v
nnoremap <space>wc <C-w>c
nnoremap <space>ww <C-w>w
nnoremap <space>bn :bnext<CR>
nnoremap <space>bp :bprevious<CR>
nnoremap <space>bb <C-^>
nnoremap <space>/ :Ag<Space>

let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:buffergator_viewport_split_policy = "B"
let g:buffergator_autoupdate = 1
let g:buffergator_hsplit_size = 10
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_switch_buffer = 0
let g:gitgutter_map_keys = 0
let g:neocomplete#enable_at_startup = 1
let g:numbers_exclude = ['tagbar', 'startify', 'undo', 'netrw']
let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
let g:sneak#streak = 1
let g:startify_change_to_dir = 0
let g:startify_list_order = ['dir', 'bookmarks', 'sessions']
let g:syntastic_html_checkers=['']
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = 'minimal'

autocmd FileType css,scss,html setlocal iskeyword+=-

if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

if has("gui_running")
  set guioptions=agite
  set guifont=Fira\ Mono:h13
  set background=dark
  set linespace=1
  colorscheme base16-tomorrow
else
  set background=dark
  try
    colorscheme jellybeans
  catch /^Vim\%((\a\+)\)\=:E185/
  endtry
endif
