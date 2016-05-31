" http://vim.wikia.com/wiki/Indenting_source_code
set nocompatible

"set mouse=a
"set clipboard+=autoselect
"set guioptions+=a

syntax on
colorscheme monokai

" Set hardtabs, using 4 spaces
set tabstop=4
set shiftwidth=4

set nu


set incsearch
set hlsearch
"set paste

"set colorcolumn=80

" Filetype detection:
filetype plugin indent on
filetype plugin on

" Nice menu for opening files from vim
set wildmenu

map <F3> :set list!<CR>
set listchars=tab:╶─,trail:·,eol:¬,extends:>,precedes:<,

" Prevent cursor from reaching bottom/top of window
set scrolloff=7

set exrc
set secure
