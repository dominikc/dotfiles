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
Plug 'jgdavey/vim-blockle'
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
  vmap <Enter> <Plug>(EasyAlign)
Plug 'marcweber/vim-addon-mw-utils'
Plug 'terryma/vim-multiple-cursors'
Plug 'tomtom/tlib_vim'

" Text objects
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'tmhedberg/matchit'

" UI / Commands
Plug 'airblade/vim-gitgutter'
  let g:gitgutter_map_keys = 0
  nmap [c <Plug>GitGutterPrevHunk
  nmap ]c <Plug>GitGutterNextHunk
Plug 'bling/vim-airline'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_tabs = 0
  let g:airline#extensions#tabline#buffer_nr_show = 1
Plug 'calebsmith/vim-lambdify'
Plug 'kien/ctrlp.vim'
  let g:ctrlp_switch_buffer = 0
  if executable("ag")
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    let g:ctrlp_use_caching = 0
  endif
Plug 'majutsushi/tagbar'
  nmap <Leader>T :TagbarToggle<CR>
Plug 'myusuf3/numbers.vim'
  let g:numbers_exclude = ['tagbar', 'gundo',  'netrw']
Plug 'nanotech/jellybeans.vim'
Plug 'rking/ag.vim'
  nnoremap <Leader>A :Ag<Space>
Plug 'scrooloose/syntastic'
  let g:syntastic_html_checkers=['']
  let g:syntastic_error_symbol = '✗✗'
  let g:syntastic_style_error_symbol = '✠✠'
  let g:syntastic_warning_symbol = '∆∆'
  let g:syntastic_style_warning_symbol = '≈≈'
Plug 'thoughtbot/vim-rspec'
  let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
  nmap <Leader>t :call RunCurrentSpecFile()<CR>
  nmap <Leader>s :call RunNearestSpec()<CR>

" Window Management
Plug 'christoomey/vim-tmux-navigator'
Plug 'jimsei/winresizer'
Plug 'regedarek/ZoomWin'
Plug 'wesQ3/vim-windowswap'

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
set t_Co=256

nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Q <nop>
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

call plug#end()
colorscheme jellybeans
