set nocompatible

" Turn on Filetype
filetype plugin on

let mapleader = "\<Space>"

" add Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Pathogen support
execute pathogen#infect()

" GitGutter settings
set signcolumn=yes
let g:gitgutter_realtime = 750
let g:gitgutter_eager = 750
let g:gitgutter_map_keys=0
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^^'
let g:gitgutter_sign_modified_removed = '~-'

call gitgutter#highlight#define_highlights()
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=yellow
highlight GitGutterDelete ctermfg=red
highlight GitGutterChangeDelete ctermfg=yellow

" airline options
let g:airline_powerline_fonts = 1
function! AirlineInit()
  let g:airline_section_a = airline#section#create(['mode',' ','branch'])
  let g:airline_section_b = airline#section#create(['hunks'])
  let g:airline_section_x = ''
  let g:airline_section_y = airline#section#create(['filetype'])
  let g:airline_section_z = airline#section#create_right(['%l','%c'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_detect_whitespace=0
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9

" UtilSnips config
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

let g:AutoClosePreserveDotReg = 0

" Basic Visual and Editing Stuff
colorscheme lucario
set encoding=utf-8
set laststatus=2
set noshowmode
set timeoutlen=1000
set ttimeoutlen=0
set updatetime=750
set number
set history=1000
set gcr=a:blinkon0
set visualbell
set autoread
set showmode
set backspace=2
set autowrite
set nobackup
set noswapfile
set undolevels=1000
set nohidden
set noshowmode
autocmd BufLeave,FocusLost * silent! wall
noremap <silent> <C-s> :update<CR>
vnoremap <silent> <C-s> <C-c>:update<CR>
inoremap <silent> <C-s> <C-o>:update<CR>
noremap <Leader>r :%s/<C-r><C-w>//g<Left><Left>
map q: :q
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
noremap <Leader>w :bd<CR>
set clipboard=unnamed

syntax on

" Indentation

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set textwidth=0
set wrapmargin=0

set list listchars=tab:▸\ ,trail:·,eol:¬

set nowrap
set linebreak

noremap <Leader>nw :set wrap!<CR>

" Scrolling

set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Search
set incsearch
set hlsearch
set ignorecase
set smartcase

" Completion

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=node_modules*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" Moving lines up/down
nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
vnoremap <C-j> :m '>+1<CR>gv=gv
vnoremap <C-k> :m '<-2<CR>gv=gv

" hack for fixing airline in vim for hyper
" see https://github.com/zeit/hyper/issues/1037#issuecomment-269848444
set t_RV=