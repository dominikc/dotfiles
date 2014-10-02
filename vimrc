set nocompatible

filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'airblade/vim-gitgutter'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'danro/rename.vim'
Plugin 'ecomba/vim-ruby-refactoring'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'eparreno/vim-l9'
Plugin 'garbas/vim-snipmate'
Plugin 'gmarik/sudo-gui.vim'
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'guns/xterm-color-table.vim'
Plugin 'honza/vim-snippets'
Plugin 'jgdavey/vim-blockle'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'othree/vim-autocomplpop'
Plugin 'raimondi/delimitMate'
Plugin 'reedes/vim-colors-pencil'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'shougo/unite.vim'
Plugin 'shougo/vimfiler.vim'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/loremipsum'
Plugin 'vim-scripts/zoomwin'
Plugin 'yggdroot/indentLine'
Plugin 'zaiste/tmux.vim'

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
set background=dark
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_powerline_fonts = 1
let g:better_whitespace_filetypes_blacklist = ['unite', 'mkd', 'vimfiler', 'vimfiler:explorer']
let g:pencil_higher_contrast_ui = 1
let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
let g:vimfiler_as_default_explorer = 1

" Code folding
set foldenable
set foldlevelstart=5
set foldmethod=indent
nnoremap <space> za

colorscheme pencil

if has("gui_running")
  set guioptions=agit
  set guifont=Source\ Code\ Pro\ for\ Powerline
else
  let g:airline_theme = 'dark'
endif

" NORMAL mappings
nmap     <Leader>] gt
nmap     <Leader>[ gT
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
nnoremap B         ^
nnoremap E         $
nnoremap $         <nop>
nnoremap ^         <nop>
nnoremap <Leader>a :Ag
nnoremap <silent> <leader>p :ClearCtrlPCache<cr>\|:CtrlP<cr>

" VISUAL mappings
vmap <Enter> <Plug>(EasyAlign)
vmap i <C-n>i

" INSERT mappings
inoremap jk <esc>

" CtrlP
if executable("ag")
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_show_hidden = 1
endif

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
autocmd VimEnter * VimFilerExplorer
autocmd VimEnter * call SetHighlight()
autocmd FileType vimfiler setlocal nonumber
