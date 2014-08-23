set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

"Plugin 'mileszs/ack.vim'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'danro/rename.vim'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'edkolev/tmuxline.vim'
Plugin 'ervandew/supertab'
Plugin 'gmarik/vundle'
Plugin 'groenewege/vim-less'
Plugin 'honza/vim-snippets'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'mhinz/vim-signify'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 't9md/vim-ruby-xmpfilter'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-bundler'
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


"let g:session_autosave = 'no'

" macvim
if (has('gui_macvim'))
  set guifont=Sauce\ Code\ Powerline:h14
  set guioptions-=L
  set showtabline=2
  set guioptions-=r
  set clipboard=unnamed
  let g:airline_powerline_fonts = 1
  "let g:session_autosave = 'yes'
endif

let g:airline#extensions#tabline#enabled = 1

let g:airline_powerline_fonts = 1

" misc
set wildignore+=*/tmp/*,*/vendor/*,*/public/*,*.so,*.swp,*.zip
map <Leader>d :vsp<CR>
map <Leader>w :sp<CR>
map <Leader>q :q<CR>
map <Leader>t :tabe<CR>
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

" nerdcommenter
map <C-/> <Leader>ci
imap <C-/> <C-o><Leader>ci

" vim-nerdtree-tabs
map <D-Bslash> :NERDTreeTabsToggle<CR>
let g:nerdtree_tabs_open_on_gui_startup = 0

" vim-rails
let g:Tlist_Ctags_Cmd = '/usr/local/bin/ctags --fields=+l'
"autocmd BufWritePost,FileWritePost,FileAppendPost *.rb :call AutoCtags()
function! AutoCtags()
  silent execute rails#app().tags_command()
endfunction

" youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']

" ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"

" vim-ruby-xmpfilter
autocmd FileType ruby nmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby xmap <buffer> <D-r> <Plug>(xmpfilter-run)
autocmd FileType ruby imap <buffer> <D-r> <Plug>(xmpfilter-run)
au BufRead,BufNewFile *.hamlc set ft=haml
