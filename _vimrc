" Based on http://www.vi-improved.org/vimrc.html

" A variable needed later {
  let uname=substitute(system("uname"), "\n", "", "g")

" Basics {
    set nocompatible " explicitly get out of vi-compatible mode
    set noexrc " don't use local version of .(g)vimrc, .exrc
    "set background=dark " we plan to use a dark background
    "set cpoptions=$cF " mark word for replace
    set cpoptions=$aABceFsmq
    "              |||||||||
    "              ||||||||+-- When joining lines, leave the cursor 
    "              |||||||      between joined lines
    "              |||||||+-- When a new match is created (showmatch) 
    "              ||||||      pause for .5
    "              ||||||+-- Set buffer options when entering the 
    "              |||||      buffer
    "              |||||+-- :write command updates current file name
    "              ||||+-- Automatically add <CR> to the last line 
    "              |||      when using :@r
    "              |||+-- Searching continues at the end of the match 
    "              ||      at the cursor position
    "              ||+-- A backslash has no special meaning in mappings
    "              |+-- :write updates alternative file name
    "              +-- :read updates alternative file name
    syntax on " syntax highlighting on
    set gcr=n:blinkon0 " turn off cursor blink
" }

" General {
    filetype on
    filetype plugin indent on " load filetype plugins/indent settings
    set autochdir " always switch to the current file directory
    set backspace=indent,eol,start " make backspace a more flexible
    set backup " make backup files
    set backupdir=~/.vimfiles/backup " where to put backup files
    set clipboard+=unnamed " share windows clipboard
    set directory=~/.vimfiles/tmp " directory to place swap files in
    set fileformats=unix,dos,mac " support all three, in this order
    set hidden " you can change buffers without saving
    " (XXX: #VIM/tpope warns the line below could break things)
    "set iskeyword+=_,$,@,%,# " none of these are word dividers
    set iskeyword+=:,_
    set mouse=a " use mouse everywhere
    set noerrorbells " don't make noise
    set visualbell t_vb= " turn off error beep/flashes
    set whichwrap=b,s,h,l,<,>,~,[,] " everything wraps
    "             | | | | | | | | |
    "             | | | | | | | | +-- "]" Insert and Replace
    "             | | | | | | | +-- "[" Insert and Replace
    "             | | | | | | +-- "~" Normal
    "             | | | | | +-- <Right> Normal and Visual
    "             | | | | +-- <Left> Normal and Visual
    "             | | | +-- "l" Normal and Visual (not recommended)
    "             | | +-- "h" Normal and Visual (not recommended)
    "             | +-- <Space> Normal and Visual
    "             +-- <BS> Normal and Visual

    set wildmenu " turn on command line completion wild style
    " ignore these list file extensions
    set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,
                    \*.jpg,*.gif,*.png
    set wildmode=list:longest " turn on wild mode huge list

    " Remember more commands and search history
    " set history=1000

    " Tell vim to remember certain things when we exit
    "  '50    :  marks will be remembered for up to 50 previously edited files
    "  "100   :  will save up to 100 lines for each register
    "  :500   :  up to 500 lines of command-line history will be remembered
    "  %      :  saves and restores the buffer list
    "  n...   :  where to save the viminfo files
    set viminfo='50,\"100,:500,%,n~/.vimfiles/viminfo

    function! ResCur()
        if line("'\"") <= line("$")
            normal! g`"
            return 1
        endif
    endfunction

    augroup resCur
        autocmd!
        autocmd BufWinEnter * call ResCur()
    augroup END

" }

" Vim UI {
    set cursorcolumn " highlight the current column
    set cursorline " highlight current line
    set incsearch " BUT do highlight as you type you 
                  " search phrase
    set laststatus=2 " always show the status line
    set lazyredraw " do not redraw while running macros
    set linespace=0 " don't insert any extra pixel lines 
                    " betweens rows
    set list " we do what to show tabs, to ensure we get them 
             " out of my files
    set listchars=tab:>-,trail:- " show tabs and trailing 
    set matchtime=5 " how many tenths of a second to blink 
                    " matching brackets for
    set nostartofline " leave my cursor where it was
    "set nohlsearch " do not highlight searched for phrases
    set novisualbell " don't blink
    set number " turn on line numbers
    set numberwidth=5 " We are good up to 99999 lines
    set report=0 " tell us when anything is changed via :...
    set ruler " Always show current positions along the bottom
    set scrolloff=5 " Keep 5 lines (top/bottom) for scope
    set shortmess=aOstT " shortens messages to avoid 
                        " 'press a key' prompt
    set showcmd " show the command being typed
    set showmatch " show matching brackets
    "set sidescrolloff=10 " Keep 5 lines at the size
    set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
    "              | | | | |  |   |      |  |     |    |
    "              | | | | |  |   |      |  |     |    + current 
    "              | | | | |  |   |      |  |     |       column
    "              | | | | |  |   |      |  |     +-- current line
    "              | | | | |  |   |      |  +-- current % into file
    "              | | | | |  |   |      +-- current syntax in 
    "              | | | | |  |   |          square brackets
    "              | | | | |  |   +-- current fileformat
    "              | | | | |  +-- number of lines
    "              | | | | +-- preview flag in square brackets
    "              | | | +-- help flag in square brackets
    "              | | +-- readonly flag in square brackets
    "              | +-- rodified flag in square brackets
    "              +-- full path to file in the buffer
" }

" Text Formatting/Layout {
    set completeopt= " don't use a pop up menu for completions
    set expandtab " no real tabs please!
    set formatoptions=rq " Automatically insert comment leader on return, 
                         " and let gq format comments
    set ignorecase " case insensitive by default
    set infercase " case inferred by default
    set smartcase " if there are caps, go case-sensitive
    "set nowrap " do not wrap lines

    " http://vim.wikia.com/wiki/Word_wrap_without_line_breaks
    set wrap
    set linebreak
    set nolist
    " set textwidth=0  " prevent vim from automatically inserting linebreaks
    " set wrapmargin=0 " in newly entered text.

    set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
    set shiftwidth=4 " auto-indent amount when using cindent, 
                     " >>, << and stuff like that
    set softtabstop=4 " when hitting tab or backspace, how many spaces 
                      "should a tab be (see expandtab)
    set tabstop=8 " real tabs should be 8, and they will show with 
                  " set list on
" }

" Folding {
    set foldenable " Turn on Folding
    set foldmarker={,} " Fold C style code (only use this as default 
                       " if you use a high foldlevel)
    set foldmethod=marker " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still 
                      " fold manually)
    set foldopen=block,hor,mark,percent,quickfix,tag " what movements
                                                     " open folds 
    function SimpleFoldText() " {
        return getline(v:foldstart).' '
    endfunction " }
    set foldtext=SimpleFoldText() " Custom fold text function 
                                  " (cleaner than default)
" }

" Plugin Settings {
    let b:match_ignorecase = 1 " case is stupid
    let perl_extended_vars=1 " highlight advanced perl vars 
                             " inside strings

    " TagList settings {
        let Tlist_Auto_Open=0 " let the tag list open automagically
        let Tlist_Compact_Format = 1 " show small menu
        let Tlist_Ctags_Cmd = 'ctags' " location of ctags
        let Tlist_Enable_Fold_Column = 0 " do show folding tree
        let Tlist_Exist_OnlyWindow = 1 " if you are the last, kill 
                                       " yourself
        let Tlist_File_Fold_Auto_Close = 0 " fold closed other trees
        let Tlist_Sort_Type = "name" " order by 
        let Tlist_Use_Right_Window = 1 " split to the right side
                                       " of the screen
        let Tlist_WinWidth = 40 " 40 cols wide, so i can (almost always)
                                " read my functions
        " Language Specifics {
            " just functions and classes please
        "    let tlist_aspjscript_settings = 'asp;f:function;c:class' 
            " just functions and subs please
        "    let tlist_aspvbs_settings = 'asp;f:function;s:sub' 
            " don't show variables in freaking php
        "    let tlist_php_settings = 'php;c:class;d:constant;f:function' 
            " just functions and classes please
        "    let tlist_vb_settings = 'asp;f:function;c:class' 
        " }
    " }
" }

" Mappings {
    map <F2> <ESC>:NERDTreeToggle<RETURN>
    " ROT13 - fun
    " map <F12> ggVGg?

    " space / shift-space scroll in normal mode
    "noremap <S-space> <C-b>
    "noremap <space> <C-f>

    "Make Arrow Keys Useful Again {
    "map <down> <ESC>:bn<RETURN>
    "map <left> <ESC>:NERDTreeToggle<RETURN>
    "map <right> <ESC>:Tlist<RETURN>
    "map <up> <ESC>:bp<RETURN>
    " }
    " That awful mixed mode with the half-tabs-are-spaces:
    "map \M <Esc>:set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>

    " Mini tabs, small "m":
    "map \m <Esc>:set expandtab tabstop=2 shiftwidth=2<CR>

    " Think "little tabs" and "big tabs":
    "map \t <Esc>:set expandtab tabstop=4 shiftwidth=4<CR>
    "map \T <Esc>:set expandtab tabstop=8 shiftwidth=8<CR>
" }

" Autocommands {
    " Python {
        autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
        "This is what I use for Python:
        autocmd BufEnter,BufNewFile *.py set ai sw=4 ts=4 sta et fo=croql
    " }

    autocmd FileType * set ai sts=2 tabstop=4|set shiftwidth=4 et
" }

" GUI Settings {
if has("gui_running")
    " Basics {
        set background=dark " we plan to use a dark background
        colorscheme metacosm " my color scheme (only works in GUI)
        if &bg == 'dark'
            hi CursorLine gui=NONE guibg=#333333 
        else
            hi CursorLine gui=NONE
            guibg=#CCCCCC
        endif
        hi! link CursorColumn CursorLine
    
        " Font Switching Binds {
          "map <F8> <ESC>:set guifont=Consolas:h8<CR>
          "map <F9> <ESC>:set guifont=Consolas:h10<CR>
          "map <F8> <ESC>:set guifont=Consolas:h12<CR>
          map <F9> <ESC>:set guifont=Consolas:h16<CR>
          map <F10> <ESC>:set guifont=Consolas:h18<CR>
        " }

        set columns=117 " 32(nertree) + 80 + 5 columns on the left
        if has("macunix")
          " Mac specific {
            set guifont=Consolas:h16 " My favorite font
            set guioptions=ce
            "              ||
            "              |+-- use simple dialogs rather than pop-ups
            "              +  use GUI tabs, not console style tabs
          " }
        endif
        if uname == "Linux"
            " Linux specific {
            set guifont=Monospace\ 12
            " }
            map <F9> <ESC>:set guifont=Monospace\ 12<CR>
            map <F10> <ESC>:set guifont=Monospace\ 14<CR>
        endif
        set guioptions-=T " Hide toolbar
        set lines=55
        set mousehide " hide the mouse cursor when typing
    " }

endif
" }

" set autoindent
" vim: set sw=4 ts=4 et:
