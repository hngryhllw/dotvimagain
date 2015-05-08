""""""""""""""""""""""""""""""""""""""""
" PATHOGEN
""""""""""""""""""""""""""""""""""""""""
:set nocp
call pathogen#infect()
call pathogen#helptags()
:Helptags
filetype plugin on

""""""""""""""""""""""""""""""""""""""""
" COLOR SETTINGS
""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
:syntax on
set background=dark
"set t_Co=256

" CHOSE A COLOR HERE
"colorscheme vividchalk
"colorscheme jellybeans
"colorscheme molokai
colorscheme gruvbox
"colorscheme solarized

" Color settings for tabline
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" function to switch background colors
func! SolarD()
   set background=dark
endfu
com! SOLARD call SolarD()
func! SolarL()
   set background=light
endfu
com! SOLARL call SolarL()

""""""""""""""""""""""""""""""""""""""""
" PLUGIN SPECIFIC
""""""""""""""""""""""""""""""""""""""""
" NERDTree
nmap <leader>d :NERDTreeToggle<CR>

" vimoutliner stuff
filetype plugin indent on

" Let NERDComplete and Eclim play nicely
let g:EclimCompletionMethod = 'omnifunc'

" delimateMate
let delimitMate_expand_cr = 1

" Matlab
"source $VIMRUNTIME/macros/matchit.vim
autocmd BufEnter *.m compiler mlint

" YouCompleteMe
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_config.py"

""""""""""""""""""""""""""""""""""""""""
" KEY MAPPINGS
""""""""""""""""""""""""""""""""""""""""
" Window switching 
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-l> :wincmd l<CR>

" Map jj as the esc out of insert mode
:imap jj <Esc>

" Word processing http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode() 
   setlocal formatoptions=1 
   setlocal noexpandtab 
   map j gj 
   map k gk
   setlocal spell spelllang=en_us 
   "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
   set complete+=s
   set formatprg=par
   setlocal wrap 
   setlocal linebreak 
endfu 
com! WP call WordProcessorMode()

" cmus functions
nnoremap <leader>b :call Next()<cr>
nnoremap <leader>z :call Previous()<cr>
nnoremap <leader>c :call Pause()<cr>
nnoremap <leader>p :call Play()<cr>

" Backspace through everything, like most programs
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""
" TAB AND INDENTATION
""""""""""""""""""""""""""""""""""""""""
" Settings for avoiding tabs in code.
set expandtab
set shiftwidth=3              " Spaces >> shifts code
set softtabstop=3             " Num spaces tab key creates
set tabstop=3                 " Length of tab
"
" Replace tabs for filetypes where they're needed
:autocmd BufNewFile,BufRead [Mm]akefile* set noexpandtab softtabstop=0
:autocmd BufNewFile,BufRead *.otl set noexpandtab softtabstop=0
"
" Automatically match previous indentation level
:set autoindent

" Automatically indent the cursor when working with C-style syntax
:set smartindent

""""""""""""""""""""""""""""""""""""""""
" DISPLAY
""""""""""""""""""""""""""""""""""""""""
" Show cursor position
:set ruler

" Show line numbers
:set number

if exists('+colorcolumn')
    " Highlight column 81
    :set colorcolumn=81

    " Make the column color blue
    highlight ColorColumn ctermbg=19
else
    " Put a red background on any text that goes beyond 80 characters
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

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

" Make files scroll together during a diff
"":set scrollbind

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


