set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Plugin 'gmarik/vundle'

filetype plugin indent on

set number
set hlsearch
set ignorecase
set smartcase
set nowrap
set cursorline
set colorcolumn=80
set noshowmode
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

nnoremap B ^
nnoremap E $
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Q <nop>
nnoremap K i<CR><Esc>
nnoremap gV `[v`]
nnoremap T :tabe<CR>
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap jk <esc>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap ; :
vnoremap ; :

autocmd QuickFixCmdPost *grep* cwindow

Plugin 'tomasr/molokai'
  let g:rehash256 = 1
  colorscheme molokai

Plugin 'bling/vim-airline'
  let g:airline_theme = 'dark'
  let g:airline#extensions#tmuxline#enabled = 0
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#show_buffers = 0
  let g:airline#extensions#tabline#show_close_button = 0
  let g:airline#extensions#tabline#show_tab_type = 0

Plugin 'thoughtbot/vim-rspec'
  let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
  nmap <Leader>t :call RunCurrentSpecFile()<CR>
  nmap <Leader>s :call RunNearestSpec()<CR>

Plugin 'sjl/gundo.vim'
  nmap <Leader>g :GundoToggle<CR>

Plugin 'lokaltog/vim-easymotion'
  nmap / <Plug>(easymotion-sn)
  nmap n <Plug>(easymotion-next)
  nmap N <Plug>(easymotion-prev)
  nmap s <Plug>(easymotion-s2)

Plugin 'airblade/vim-gitgutter'
  nmap [c <Plug>GitGutterPrevHunk
  nmap ]c <Plug>GitGutterNextHunk

Plugin 'scrooloose/syntastic'
  let g:syntastic_html_checkers=['']

Plugin 'rking/ag.vim'
  nnoremap <Leader>a :Ag<Space>

Plugin 'majutsushi/tagbar'
  nmap <Leader>T :TagbarToggle<CR>

Plugin 'kien/ctrlp.vim'
  let g:ctrlp_switch_buffer = 0
  if executable("ag")
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  endif

Plugin 'junegunn/vim-easy-align'
  vmap <Enter> <Plug>(EasyAlign)

Plugin 'terryma/vim-multiple-cursors'
  vmap I <C-n>i

Plugin 'garbas/vim-snipmate'
  Plugin 'honza/vim-snippets'
  Plugin 'marcweber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'

Plugin 'shougo/vimfiler.vim'
  Plugin 'shougo/unite.vim'
  let g:vimfiler_as_default_explorer = 1
  nmap <Leader>e :VimFilerExplorer<CR>
  autocmd FileType vimfiler setlocal nonumber

Plugin 'nelstrom/vim-textobj-rubyblock'
  Plugin 'kana/vim-textobj-user'

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'vim-ruby/vim-ruby'
Plugin 'yggdroot/indentLine'

" Essentials ;)
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Disabled - no longer used
" Plugin 'chrisbra/NrrwRgn'
" Plugin 'edkolev/tmuxline.vim'
" Plugin 'eparreno/vim-l9'
" Plugin 'groenewege/vim-less'
" Plugin 'jgdavey/vim-blockle'
" Plugin 'pangloss/vim-javascript'
" Plugin 'zaiste/tmux.vim'
