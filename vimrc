set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-vinegar'

let mapleader=" "
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

nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Q <nop>
nnoremap gV `[v`]
nnoremap T :tabe<CR>
inoremap jk <esc>
nnoremap <leader>l :set list!<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

autocmd QuickFixCmdPost *grep* cwindow

Plugin 'w0ng/vim-hybrid'
Plugin 'morhetz/gruvbox'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
  let g:rehash256 = 1

Plugin 'bling/vim-airline'
  let g:airline_powerline_fonts = 1

if has("gui_running")
  set guioptions=agite
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
  set background=dark
  colorscheme base16-tomorrow
else
  set t_Co=256
  " set background=dark
  colorscheme hybrid
  let g:airline_theme = 'dark'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#show_tab_type = 0
endif

Plugin 'thoughtbot/vim-rspec'
  let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
  nmap <Leader>t :call RunCurrentSpecFile()<CR>
  nmap <Leader>s :call RunNearestSpec()<CR>

Plugin 'sjl/gundo.vim'
  nmap <Leader>g :GundoToggle<CR>

Plugin 'lokaltog/vim-easymotion'
  map <Leader><Leader> <Plug>(easymotion-prefix)
  map <Leader>j <Plug>(easymotion-j)
  map <Leader>k <Plug>(easymotion-k)
  nmap s <Plug>(easymotion-s2)

Plugin 'airblade/vim-gitgutter'
  let g:gitgutter_map_keys = 0
  nmap [c <Plug>GitGutterPrevHunk
  nmap ]c <Plug>GitGutterNextHunk

Plugin 'scrooloose/syntastic'
  let g:syntastic_html_checkers=['']
  let g:syntastic_check_on_open=1

Plugin 'rking/ag.vim'
  nnoremap <Leader>A :Ag<Space>

Plugin 'gabesoft/vim-ags'
  nnoremap <Leader>a :Ags<Space>

Plugin 'majutsushi/tagbar'
  nmap <Leader>T :TagbarToggle<CR>

Plugin 'kien/ctrlp.vim'
  let g:ctrlp_switch_buffer = 0
  if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
  endif

Plugin 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)


Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'marcweber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'

Plugin 'mhinz/vim-startify'
  let g:startify_list_order = ['dir', 'bookmarks', 'sessions']
  let g:startify_custom_header = map(split(system('fortune | cowsay'), '\n'), '"   ". v:val') + ['','']
  let g:startify_change_to_dir = 0
  let g:ctrlp_reuse_window = 'startify'

Plugin 'myusuf3/numbers.vim'
  let g:numbers_exclude = ['tagbar', 'startify', 'gundo',  'netrw']

" Syntax
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'othree/html5.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tejr/vim-tmux'
Plugin 'vim-ruby/vim-ruby'

" Text objects
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-entire'
Plugin 'nelstrom/vim-textobj-rubyblock'

" Editing
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'dietsche/vim-lastplace'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'gregsexton/MatchTag'
Plugin 'mattn/emmet-vim'
Plugin 'terryma/vim-multiple-cursors'

" UI
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'jimsei/winresizer'
Plugin 'regedarek/ZoomWin'
Plugin 'wesQ3/vim-windowswap'

" Sandbox
" Plugin 'szw/vim-ctrlspace'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'gcmt/taboo.vim'

if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif
