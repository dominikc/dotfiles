call plug#begin()

" Syntax
Plug 'burnettk/vim-angular'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chrisbra/csv.vim'
Plug 'digitaltoad/vim-jade'
Plug 'elzr/vim-json'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'tejr/vim-tmux'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-rails'
Plug 'vim-ruby/vim-ruby'

" Editor
Plug 'editorconfig/editorconfig-vim'
Plug 'garbas/vim-snipmate' | Plug 'marcweber/vim-addon-mw-utils' | Plug 'tomtom/tlib_vim'
Plug 'honza/vim-snippets'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'

" UI / Commands
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jimsei/winresizer'
Plug 'mhinz/vim-startify'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'jnurmine/Zenburn'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'

if !empty(glob("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
end

call plug#end()

set background=dark
set colorcolumn=80
set cursorline
set diffopt=filler,vertical
set hidden
set hlsearch
set ignorecase
set lazyredraw
set nobackup
set noshowmode
set noswapfile
set nowrap
set nowritebackup
set number
set shiftround
set smartcase
set splitbelow
set splitright
set t_Co=256
set undodir=~/.vim/undodir
set undofile
set undolevels=1000
set wildmode=list:longest,full

" Override colors in ~/.vimrc.local
let g:GUI_COLOR = "base16-tomorrow"
let g:TERM_COLOR = "jellybeans"

let g:NERDTreeHijackNetrw = 0
let g:NERDTreeMinimalUI = 1
let g:airline#extensions#tabline#enabled = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols = {}
let g:ctrlp_reuse_window = 'startify'
let g:ctrlp_switch_buffer = 0
let g:gitgutter_map_keys = 0
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
let g:startify_change_to_dir = 0
let g:startify_list_order = ['dir', 'bookmarks', 'sessions']
let g:syntastic_haml_checkers=['haml_lint', 'haml']
let g:syntastic_html_checkers=['']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_ruby_checkers=['rubocop', 'mri']

nmap gs :Ag<Space>

autocmd QuickFixCmdPost *grep* cwindow

nmap <Leader>e :NERDTreeToggle<CR>
nmap <Leader>a :Ag<Space>
nmap <Leader>rs :call RunNearestSpec()<CR>
nmap <Leader>rr :call RunCurrentSpecFile()<CR>
nmap [c <Plug>GitGutterPrevHunk
nmap ]c <Plug>GitGutterNextHunk
vmap <Enter> <Plug>(EasyAlign)
nnoremap <CR> :

if has("nvim")
  tmap <Esc> <C-\><C-n>
end

autocmd FileType css,scss,html setlocal iskeyword+=-

if executable("ag")
  set grepprg=ag\ --vimgrep
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

if !empty(glob("~/.vimrc.local"))
  source ~/.vimrc.local
end

if has("gui_running")
  set guioptions=agite
  set guifont=Fira\ Mono:h13
  set linespace=1
  execute 'colorscheme' g:GUI_COLOR
else
  execute 'colorscheme' g:TERM_COLOR
endif
