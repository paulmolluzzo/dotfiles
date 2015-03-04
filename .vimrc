" Turn on Filetype
filetype plugin on

" add Ctrl P
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Pathogen support
execute pathogen#infect()
let g:gitgutter_sign_column_always = 1
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

" Basic Visual and Editing Stuff
colorscheme lucario
set encoding=utf-8
set laststatus=2
set noshowmode
set ttimeoutlen=50
set updatetime=750
set number
set history=1000
set gcr=a:blinkon0
set visualbell
set autoread
set showmode
set backspace=2

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
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

