" Adds pathogen pluggin manager compatability
:set nocp
call pathogen#infect()
call pathogen#helptags()

" *** Color Scheme Stuff *** "
"colorscheme vividchalk
"colorscheme jellybeans
colorscheme molokai
"colorscheme solarized
"let g:solarized_termcolors=256
set background=dark
let g:rehash256=1

" NERDTree Stuff
nmap <leader>d :NERDTreeToggle<CR>

" Let NERDComplete and Eclim play nicely
let g:EclimCompletionMethod = 'omnifunc'

" Window switching 
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" delimateMate Stuff
let delimitMate_expand_cr = 1

" Matlab Stuff
source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m compiler mlint

" Arduino stuff
"Default: /Applications/Arduino.app/Contents/Resources/Java
let g:vim_arduino_library_path = "/Applications/Arduino.app/Contents/Resources/Java"
"Default: result of `$(ls /dev/tty.* | grep usb)`
let g:vim_arduino_serial_port = "/dev/tty.usbmodem1421"

" YouCompleteMe  stuff
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/.ycm_extra_config.py"

" Airline plugin stuff
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Miscellaneous for plugins
:Helptags
filetype plugin on

" Automatically match previous indentation level
:set autoindent

" Automatically indent the cursor when working with C-style syntax
:set smartindent

" Automatically turn tabs into spaces
set expandtab

" Settings for avoiding tabs in code.
set shiftwidth=3
set softtabstop=3
set tabstop=3

" Show cursor position
:set ruler

" Show line numbers
:set number

" Enable syntax highlighting
:syntax on

" Backspace through everything, like most programs
set backspace=indent,eol,start

" left and right arrow keys and h and l can go across lines
:set whichwrap+=<,>,h,l

" Turn off line wrapping
:set nowrap

" Enable mouse navigation
:set mouse=a

" Highlight search terms as you type
:set incsearch

" F4 to toggle search highlight
let hlstate=0
nnoremap <F4> :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>

" Make the smartcase below work
:set ignorecase

" Make searches case insensitive when containing only lowercase letters.
:set smartcase

" Set the font to Consolas in gvim
:set guifont=Consolas

" Enable cycling backwards and forwards through tabs with <F7> and <F8>
:map <F7> :tabp<CR>                     " :map <key> <keystrokes>
:map <F8> :tabn<CR>                     "

" Fix some typos when exiting. cmap maps in command mode.
:cmap Q q
:cmap W w

" Make files scroll together during a diff
:set scrollbind


" Make vim turn *off* expandtab for files named Makefile or makefile
" We need the tab literal
:autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab

" Show matching [] {} ()
:set showmode

" Automatically insert the comment character when you hit <enter> (r) or o/O (o)
" in a block comment
:set formatoptions+=ro 

" This option is only supported on vim 7.4 and above (technically 7.3.582 or so)
if v:version > 704
    " When joining two commented lines (J on two selected lines), eliminate 
    " leading characters such as # or // and indentation.
    :set formatoptions+=j
endif

if exists('+colorcolumn')
    " Highlight column 81
    :set colorcolumn=81

    " Make the column color blue
    highlight ColorColumn ctermbg=19
else
    " Put a red background on any text that goes beyond 80 characters
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" Set the gui background to black. The guifg changes the color of some
" text, probably anything that isn't picked up by the syntax highlighter.
highlight Normal guibg=black guifg=white

" Map jj as the esc out of insert mode
:imap jj <Esc>

