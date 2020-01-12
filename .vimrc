scriptencoding utf-8

"-------
"PLUGINS
"-------
"Specify a directory for plugins
call plug#begin('~/.vim/plugged')
  "fzf
  Plug 'junegunn/fzf.vim'
  Plug 'tweekmonster/fzf-filemru'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

  "Look & feel
  Plug 'vim-airline/vim-airline'

  "Editing aids
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'terryma/vim-multiple-cursors'

  "UndoTree (Enable with :UndotreeToggle)
  Plug 'mbbill/undotree'

  "Git (macros and gutter bar icons)
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  "Work things
  "==============
  "Terraform
  Plug 'hashivim/vim-terraform'

  "Typescript support (syntax and macros)
  "Plug 'leafgarland/typescript-vim'
  "Plug 'Quramy/tsuquyomi'

  "Fun things
  "=============
  "c++
  Plug 'w0rp/ale'
  Plug 'cpiger/NeoDebug'

  "Haskell
  "Plug 'eagletmt/ghcmod-vim'
  "Plug 'Shougo/vimproc', {'do' : 'make'}

  "Elm
  "Plug 'elmcast/elm-vim'

  "glsl
  Plug 'petrbroz/vim-glsl'

  "Pico8
  Plug 'evanrelf/vim-pico8-color'
  Plug 'ssteinbach/vim-pico8-syntax' " optional

call plug#end()

"--------
"SETTINGS
"--------
set nocompatible                      "Unleash vim features by disabling compatibility with vi

"From the book Practical Vim, When this plugin is enabled,
"the % command can jump between matching pairs of keywords.
runtime macros/matchit.vim

"Enables filetype detection (loading $VIMRUNTIME/filetype.vim)
"plus enabling loading plugin files and indentation rules file
"for the detected filetype
filetype plugin indent on

syntax on                             "Enable syntax highlighting

set encoding=utf-8
set gdefault                          "Assume the /g flag on :s substitutions to replace all matches in a line
set mouse=a                           "Selecting with mouse enters in Visual Mode automatically
set nomousehide                       "Don't hide the mouse cursor while typing
set relativenumber                    "Shows relative numbers from the current line to jump to
set number                            "Along with the previous setting, displays the current line number
set icon                              "Shows an * on the tab when the file has changes
set cwh=4                             "Height of the command line window
set noswapfile                        "Turn off swap files
set udf                               "Automatically save and restore undo history (UnDo File)
set undodir=~/.vim/undos              "Undo history files (.*.un~) are stored in this diretory
set undolevels=10000                  "Levels of undo
set undoreload=10000                  "Save whole buffer for undo when reloading (:e! or FileChangedShell)
set backupdir=~/.vim/backs            "Backups directory
set lpl                               "Automatically load plugin scripts when starting up
set foldmethod=manual                 "Visual select and use zf to create folds

set backspace=indent,eol,start        "http://vi.stackexchange.com/a/2163
set whichwrap=b,s,<,>,[,],h,l         "makes BACKSPACE,SPACE,arrows,h and l wrap around
set list listchars=tab:»\ ,trail:·    "shows TABS and trailing spaces as » and · respectively
set listchars+=extends:→              "Show an arrow if the line continues rightwards
set listchars+=precedes:←             "Show an arrow if the line continues leftwards
set iskeyword+=-                      "Treats hyphens as part of the word e.g., some-test█ instead of some█-test
set showcmd                           "Show size of visual selection

set cinkeys=0{,0},0),:,0#,!^F,o,O,e,${,$}  "a list of keys for insert mode that cause reindenting
set cindent                                "set cinoptions=>2,e-2,m1

set laststatus=2                      "Always display the status line
set showtabline=2                     "Always show Tabs
set splitbelow                        "Open new split panes to right and bottom, which feels more natural
set splitright                        ""
set diffopt+=vertical                 "Always use vertical diffs
set autoread                          "Auto reload changed files
set wildmenu                          "Tab autocomplete in command mode
set clipboard=unnamed                 "Bullshit to make copy/paste work for High Sierra when vim is run inside tmux
set lazyredraw                        "Don't redraw screen when running macros
set ttyfast                           "Send more characters in fast terminals
set nowrap                            "Don't wrap long lines
set noerrorbells novisualbell         "Turn off visual and audible bells
set timeoutlen=1000 ttimeoutlen=0     "Remove timeout when hitting escape
set tabstop=2
set softtabstop=0                     "Soft tab stop disabled
set shiftwidth=2
set shiftround
set nosmarttab                        "Tabstop and shifwidth have the same width, no need for this
set expandtab                         "Inserts space characters whenever the tab key is pressed
set hls                               "HighLight Search
set textwidth=0                       "No auto-wrap after certain column
set wrapmargin=0
set colorcolumn=+1                    "Make it obvious where 80 characters is

"Status line configuration (which will be used instead if vim-airline fails to run or is not installed)
set statusline+=\ %F                  "Path to the file (all the following are only useful if you don't have powerline)
set statusline+=\ %m                  "Modified flag
set statusline+=\ %y                  "Filetype
set statusline+=%=                    "Switch to the right side
set statusline+=col:\ %c\ \|\ \       "Current column
set statusline+=%l                    "Current line
set statusline+=/%L                   "Total lines

set ruler                             "Shows the coordinates and the current halfway command in Visual mode
set wildmode=list:longest,full        "Make cmdline tab completion similar to bash
set wildmenu                          "Enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~,*.class   "Stuff to ignore when tab completing
set incsearch                         "Incremental search (shows matchings as you type after pressing '/')
"set cursorcolumn
set cursorline                        "Highlights the current line


"When enabled, ‘smartcase’ has the effect of canceling out the ‘ignorecase’ setting 
"any time that we include an uppercase character in our search pattern.
"(Always force case sensitivity/insensitivity in a search by including the \C or \c items)
set ignorecase smartcase

set nospell "Disables spellchecking. Manually invoke it by doing :set spell
            "(navigate between erros with [s and ]s. Show menu with z=)
            "In INSERT mode use <C-x>s to trigger an autocompletion that fixes mispelled words
set spelllang=en_au       "Spelling dictionary to English AU

"------------------------------
"KEYBOARDS CURSOR CONFIGURATION
"------------------------------
let &t_SI = "\<esc>[5 q"  "Blinking I-beam in insert mode
let &t_SR = "\<esc>[3 q"  "Blinking underline in replace mode
let &t_EI = "\<esc>[ q"   "Default cursor (usually blinking block) otherwise

"---------------------
"COLOUR CONFIGURATIONS
"---------------------

colorscheme koehler       "I've been using this colorscheme since 2007

"(background/foreground) for highlighted search terms
hi Search ctermbg=236
hi Search ctermfg=LightGray

"Make it more obvious which paren I'm on (highlights brackets)
hi MatchParen cterm=none ctermbg=black ctermfg=yellow

"Highlights column 80 as well as 120 and onwards
let &colorcolumn="80,".join(range(120,999),",")
highlight ColorColumn ctermbg=235 guibg=#cccccc

"Highlights current line
highlight CursorLine cterm=NONE ctermbg=235 guibg=#222222

"------------------------------------------
"AUTO-CMD (Commands that run upon an event)
"------------------------------------------
"Set indentation in Python to 2 spaces
autocmd Filetype python setlocal ts=2 sw=2 expandtab

"Set JSON file syntax support on file (buffer) load/new events
autocmd BufRead,BufNewFile *.json set filetype=json

"Make vim interpret .p8 files (pico8) as LUA
"autocmd BufRead,BufNewFile *.p8 set filetype=lua

"By default, vim thinks .md is Modula-2. Change it to MARKDOWN
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

"Don't automatically continue comments after newline
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro

"Without this, vim breaks in the middle of words when wrapping
autocmd FileType markdown setlocal nolist wrap lbr

"Run ctags on file save
"autocmd BufWritePost * call system("ctags")

"-----------------------
"FILETYPE CONFIGURATIONS
"-----------------------
"Adds the ':' as a keyword for LUA files (e.g., obj:func())
augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal iskeyword+=:
augroup END

"-----------
"KEYBINDINGS
"-----------
"Makes Ctrl+v, Ctrl+c and Ctrl+x more Windows like:
"https://superuser.com/a/189198
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

"Keybinds for moving between warnings and errors quickly (for the ALE plugin)
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

"Brings the error details for the current error under the cursor
nmap <silent> <C-i> <Plug>(ale_detail)

"Makes Ctrl+e/y scroll 10 lines
nnoremap <C-e> 10<C-e>
nnoremap <C-y> 10<C-y>

"-----------------
"LEADER KEY THINGS
"-----------------
let mapleader = "\<Space>"
"Sets a longer timeout after pressing <Leader>
set timeout timeoutlen=4000

"Typescript hints over symbols
"autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>

" Underline a line with equals (<h1> in Markdown documents) and put the cursor
" after the line.
"
"   Example Thing
"   =============
"
noremap <leader>= yypVr=j

" Underline a line with hyphens (<h2> in Markdown documents) and put the cursor
" after the line.
"
"   Example Thing
"   -------------
"
noremap <leader>- yypVr-j

" Reload ~/.vimrc
noremap <leader>rc :source ~/.vimrc<cr>

"----------------------
"PLUGINS CONFIGURATIONS
"----------------------

"Enable tabline for vim-airline
let g:airline#extensions#tabline#enabled = 1

"Enable powerline symbols in vim-airline status bar
let g:airline_powerline_fonts = 1

"Keep ALE's sign gutter open at all times
let g:ale_sign_column_always = 1

let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_sign_info = 'i '

let g:ale_sign_style_error = 'e '
let g:ale_sign_style_warning = 'w '

highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
highlight ALEStyleWarningSign ctermbg=NONE ctermfg=red
highlight ALEStyleWarningSign ctermbg=NONE ctermfg=yellow

call ale#Set('cpp_gcc_executable', 'g++')
call ale#Set('cpp_gcc_options', '-std=c++17')

"--------
"COMMANDS
"--------
"Formats JSON (requires jq installed)
com! Fj %!jq --indent 2 .

"Formats cpp code (requires astyle installed)
com! Fcpp :%!astyle -A2 --style=attach --convert-tabs --mode=c -s2

"---------
"gVIM CONF
"---------
set noeb vb t_vb=
if has("gui_running")
  set t_Co=256 " 256 colors in terminal
  set printoptions=paper:letter         " use letter as the print output format
  set guioptions-=T                     " turn off GUI toolbar (icons)
  set guioptions-=r                     " turn off GUI right scrollbar
  set guioptions-=L                     " turn off GUI left scrollbar
  " Highlight columns 80 and 120
  let &colorcolumn='80,120'
  highlight ColorColumn ctermbg=DarkGray guibg=#222222
  highlight CursorLine cterm=NONE ctermbg=DarkGray guibg=#222222

  if has("win32")
    set guifont=Terminus_\(TTF\)_for_Windows:h12:cANSI:qDRAFT
  else
    set guifont=Terminus\ \(TTF\)\ Medium\ 12
  endif
endif

highlight iCursor guifg=white guibg=green
set guicursor=n-v-c:block-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=r:blinkwait10
set guicursor+=r:hor10-iCursor
set guicursor+=i:blinkwait10
set guicursor+=i:ver13-iCursor
