set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Essentials & dependencies
Plugin 'eparreno/vim-l9'
Plugin 'flazz/vim-colorschemes'
Plugin 'gmarik/vundle'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'shougo/unite.vim'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-unimpaired'

" Syntax
Plugin 'burnettk/vim-angular'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'mattn/emmet-vim'
Plugin 'moll/vim-node'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-haml'
Plugin 'zaiste/tmux.vim'

" UI
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'othree/vim-autocomplpop'
Plugin 'shougo/vimfiler.vim'

" Ruby
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'geekjuice/vim-spec'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Editing
Plugin 'junegunn/vim-easy-align'
Plugin 'lokaltog/vim-easymotion'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'yggdroot/indentLine'

" Commands
Plugin 'chrisbra/NrrwRgn'
Plugin 'kana/vim-textobj-user'
Plugin 'nelstrom/vim-textobj-rubyblock'
Plugin 'rking/ag.vim'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'

" vimrc
filetype plugin indent on

set number
set hlsearch
set ignorecase
set smartcase
set noswapfile
set nobackup
set nowritebackup
set nowrap
set cursorline
set colorcolumn=80
set laststatus=2
set noshowmode
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:better_whitespace_filetypes_blacklist = ['unite', 'mkd', 'vimfiler', 'vimfiler:explorer']
let g:gitgutter_map_keys = 0
let g:indentLine_fileTypeExclude = ['json']
let g:mocha_coffee_command = "Dispatch ./node_modules/.bin/mocha {spec}"
let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
let g:syntastic_html_checkers=['']
let g:vimfiler_as_default_explorer = 1

" Code folding
"set foldenable
"set foldlevelstart=5
"set foldmethod=indent

set t_Co=256
let g:rehash256 = 1
colorscheme molokai

if has("gui_running")
  set guioptions=agit
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
else
  let g:airline_theme = "dark"
endif

" NORMAL mappings
nmap     <Leader>t :call RunCurrentSpecFile()<CR>
nmap     <Leader>e :VimFilerExplorer<CR>
nmap     <Leader>T :TagbarToggle<CR>
nmap     <Leader>G :Goyo<CR>
nmap     <Leader>g :GundoToggle<CR>
nmap     <Leader>l <Plug>(easymotion-lineforward)
nmap     <Leader>j <Plug>(easymotion-j)
nmap     <Leader>k <Plug>(easymotion-k)
nmap     <Leader>h <Plug>(easymotion-linebackward)
nmap     /         <Plug>(easymotion-sn)
nmap     n         <Plug>(easymotion-next)
nmap     N         <Plug>(easymotion-prev)
nmap     s         <Plug>(easymotion-s2)
nmap     ]c        <Plug>GitGutterNextHunk
nmap     [c        <Plug>GitGutterPrevHunk
nnoremap B         ^
nnoremap E         $
nnoremap <Leader>a :Ag
nnoremap <silent>  <leader>p :ClearCtrlPCache<cr>\|:CtrlP<cr>
nnoremap <silent> <Leader>/ :nohlsearch<CR>
nnoremap Q <nop>
nnoremap K <nop>
nmap T :tabe<CR>

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>


" VISUAL mappings
vmap <Enter> <Plug>(EasyAlign)
vmap I <C-n>i

" INSERT mappings
inoremap jk <esc>

" CtrlP
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_show_hidden = 1
endif

" xmpfilter
autocmd FileType ruby nmap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>R <Plug>(xmpfilter-run)

" AutoCmd
autocmd FileType vimfiler setlocal nonumber
autocmd QuickFixCmdPost *grep* cwindow
