set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle
call vundle#rc()

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
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'othree/vim-autocomplpop'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tomtom/tlib_vim'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-tbone'
Plugin 'tpope/vim-unimpaired'
Plugin 'vim-ruby/vim-ruby'

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

" misc
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip
map <Leader>] gt
map <Leader>[ gT

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

let g:nerdtree_tabs_open_on_console_startup = 1

au BufRead,BufNewFile *.hamlc set ft=haml

let g:rspec_command = "Dispatch bundle exec rspec {spec}"

map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>T :tabe<CR>
map <Leader>s :call RunNearestSpec()<CR>

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
