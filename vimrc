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
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'garbas/vim-snipmate'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'
Plugin 'plasticboy/vim-markdown'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-haml'
Plugin 'zaiste/tmux.vim'

" UI
Plugin 'airblade/vim-gitgutter'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'jgdavey/vim-blockle'
Plugin 'junegunn/goyo.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mhinz/vim-startify'
Plugin 'othree/vim-autocomplpop'
Plugin 'shougo/vimfiler.vim'
Plugin 'vim-scripts/zoomwin'

" Ruby
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'

" Editing
Plugin 'junegunn/vim-easy-align'
Plugin 'lokaltog/vim-easymotion'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'raimondi/delimitMate'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'yggdroot/indentLine'

" Commands
Plugin 'chrisbra/NrrwRgn'
Plugin 'gregsexton/gitv'
Plugin 'kana/vim-textobj-user'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/loremipsum'
Plugin 'vim-textobj-rubyblock'

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
set showbreak=⇇

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:better_whitespace_filetypes_blacklist = ['unite', 'mkd', 'vimfiler', 'vimfiler:explorer']
let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
let g:vimfiler_as_default_explorer = 1
let g:gitgutter_map_keys = 0
let g:speeddating_no_mappings = 1

" Code folding
"set foldenable
"set foldlevelstart=5
"set foldmethod=indent

set t_Co=256
set background=dark
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai


if has("gui_running")
  set guioptions=agit
  set guifont=Source\ Code\ Pro\ for\ Powerline:h14
else
  let g:airline_theme = 'dark'
endif

" NORMAL mappings
nmap     <Leader>t :call RunCurrentSpecFile()<CR>
nmap     <Leader>s :call RunNearestSpec()<CR>
nmap     <Leader>e :VimFilerExplorer<CR>
nmap     <Leader>T :TagbarToggle<CR>
nmap     <Leader>G :Goyo<CR>
nmap     <Leader>l <Plug>(easymotion-lineforward)
nmap     <Leader>j <Plug>(easymotion-j)
nmap     <Leader>k <Plug>(easymotion-k)
nmap     <Leader>h <Plug>(easymotion-linebackward)
nmap     /         <Plug>(easymotion-sn)
nmap     n         <Plug>(easymotion-next)
nmap     N         <Plug>(easymotion-prev)
nmap     s         <Plug>(easymotion-s2)
nmap     <C-X>     <Plug>SpeedDatingUp
nmap     <C-C>     <Plug>SpeedDatingDown
nmap     d<C-C>    <Plug>SpeedDatingNowUTC
nmap     d<C-X>    <Plug>SpeedDatingNowLocal
nnoremap B         ^
nnoremap E         $
nnoremap <Leader>a :Ag
nnoremap <silent>  <leader>p :ClearCtrlPCache<cr>\|:CtrlP<cr>
nnoremap Q         <nop>
nnoremap <silent> <Leader>/ :nohlsearch<CR>

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

let g:ctrlp_reuse_window = 'startify'

" Highlights
function! SetHighlight()
  highlight DiffAdd               ctermfg=NONE  ctermbg=22
  highlight DiffDelete            ctermfg=NONE  ctermbg=124
  highlight DiffChange            ctermfg=NONE  ctermbg=53
  highlight PmenuSel              ctermfg=black ctermbg=green term=reverse
  highlight GitGutterAdd          ctermbg=black ctermfg=green
  highlight GitGutterChange       ctermbg=black ctermfg=yellow
  highlight GitGutterDelete       ctermbg=black ctermfg=red
  highlight GitGutterChangeDelete ctermbg=black ctermfg=blue
  highlight SignColumn            ctermbg=black
endfunction

" AutoCmd
autocmd VimEnter * call SetHighlight()
autocmd FileType vimfiler setlocal nonumber

autocmd FileType ruby nmap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)
autocmd FileType ruby xmap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)
autocmd FileType ruby imap <buffer> <Leader><tab> <Plug>(xmpfilter-mark)

autocmd FileType ruby nmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <Leader>R <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <Leader>R <Plug>(xmpfilter-run)

let g:rbpt_colorpairs = [
      \ ['darkred',     'DarkOrchid3'],
      \ ['brown',       'RoyalBlue3'],
      \ ['Darkblue',    'SeaGreen3'],
      \ ['darkgray',    'DarkOrchid3'],
      \ ['darkgreen',   'firebrick3'],
      \ ['darkcyan',    'RoyalBlue3'],
      \ ['darkred',     'SeaGreen3'],
      \ ['darkgreen',   'RoyalBlue3'],
      \ ['brown',       'firebrick3'],
      \ ['gray',        'RoyalBlue3'],
      \ ['black',       'SeaGreen3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['darkmagenta', 'DarkOrchid3'],
      \ ['Darkblue',    'firebrick3'],
      \ ['darkcyan',    'SeaGreen3'],
      \ ['red',         'firebrick3'],
      \ ]

let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 1

if exists("*RainbowParenthesesToggle")
  au VimEnter * RainbowParenthesesToggle
  au Syntax * RainbowParenthesesLoadRound
  au Syntax * RainbowParenthesesLoadSquare
  au Syntax * RainbowParenthesesLoadBraces
endif
