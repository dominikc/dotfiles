set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'bitc/vim-bad-whitespace'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chriskempson/base16-vim'
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
Plugin 'junegunn/vim-easy-align'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'loremipsum'
Plugin 'majutsushi/tagbar'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'mhinz/vim-signify'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/vim-autocomplpop'
Plugin 'raimondi/delimitMate'
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
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/ZoomWin'

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
set mouse=a
set background=dark

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:rspec_command = "Dispatch bundle exec rspec --format progress {spec}"
let g:airline#extensions#tmuxline#enabled = 0
let g:vimfiler_as_default_explorer = 1

if has("gui_running")
  set guioptions=agit
  colorscheme base16-monokai
  set guifont=Source\ Code\ Pro\ for\ Powerline
endif


" misc
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip
map <Leader>] gt
map <Leader>[ gT
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :tabe<CR>
map <Leader>s :call RunNearestSpec()<CR>
nmap <F8> :TagbarToggle<CR>
vmap <Enter> <Plug>(EasyAlign)
vmap i <C-n>i
map <Leader>e :VimFilerExplorer<CR>

" vim-easymotion
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
nmap s <Plug>(easymotion-s2)

highlight DiffAdd    ctermfg=NONE ctermbg=22
highlight DiffDelete ctermfg=NONE ctermbg=124
highlight DiffChange ctermfg=NONE ctermbg=53
highlight Pmenu      ctermfg=NONE ctermbg=233 term=reverse
highlight PmenuSel   ctermfg=233  ctermbg=green term=reverse

function SetCursorLine(insert)
  if a:insert
    highlight CursorLine ctermfg=NONE ctermbg=233 cterm=none
  else
    highlight CursorLine ctermfg=NONE ctermbg=NONE cterm=underline
  endif
endfunction

call SetCursorLine(0)
autocmd InsertEnter * call SetCursorLine(1)
autocmd InsertLeave * call SetCursorLine(0)
