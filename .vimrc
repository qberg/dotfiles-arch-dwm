"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500
set mouse-=a

let mapleader = " "

" Enable fast terminal connection.
set ttyfast

" Use the system clipboard as the default register.

set clipboard=unnamed

if has('unnamedplus')
    set clipboard+=unnamedplus
endif

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png
    set wildignore+=.DS_Store,.git,.hg,.svn
    set wildignore+=*~,*.sw?,*.tmp
endif

set number	" Number stuff
set relativenumber

set ruler 	" Always show current position


set listchars=trail:.,tab:▸\ ,eol:¬,extends:❯,precedes:❮
set backspace=eol,start,indent " Configure backspace so it acts as it should act
set whichwrap+=<,>,h,l

set ignorecase " Ignore case when searching

set smartcase " When searching try to be smart about cases

set hlsearch " Highlight search results

set incsearch " Makes search act like search in modern browsers

set lazyredraw " Don't redraw while executing macros (good performance config)

set magic " For regular expressions turn magic on
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

" set cursorline          " highlight current line
" hi CursorLine cterm=NONE ctermbg=darkyellow ctermfg=white
" hi CursorColumn cterm=NONE ctermbg=darkyellow ctermfg=white
" autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
" autocmd WinLeave * setlocal nocursorcolumn
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline
let &t_EI = "\033[2 q" 
let &t_SI = "\033[5 q" 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set wildmenu            " visual autocomplete for command menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set the spellchecking language.
if has('syntax')
    set spelllang=en_us
endif

" Limit syntax highlighting.
" This avoids the very slow redrawing when files contain long lines.
if has('syntax')
    set synmaxcol=2500
endif

set t_Co=256

try
    colorscheme elford
catch
endtry

set background=dark

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
" set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c

set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Don't use arrow keys
nnoremap <Up>          :echom "--> k <-- "<CR>
nnoremap <Down>        :echom "--> j <-- "<CR>
nnoremap <Right>       :echom "--> l <-- "<CR>
nnoremap <Left>        :echom "--> h <-- "<CR>

inoremap <Up>     <C-o>:echom "--> k <-- "<CR>
inoremap <Down>   <C-o>:echom "--> j <-- "<CR>
inoremap <Right>  <C-o>:echom "--> l <-- "<CR>
inoremap <Left>   <C-o>:echom "--> h <-- "<CR>

nnoremap ; :

" move vertically by visual line
nnoremap j gj
nnoremap k gk

noremap <C-j> <C-W>j
noremap <C-k> <C-W>k
noremap <C-h> <C-W>h
noremap <C-l> <C-W>l

" Automatically add closing ( { [ ' " `
inoremap {<cr> {<cr>}<ESC>kA<CR>
inoremap { {}<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
au FileType html,vim,xhtml,xml inoremap < <lt>><ESC>i| inoremap > <c-r>=ClosePair('>')<CR>

" Quickly open a markdown buffer for scribble
map <leader>om :e ~/buffer.md<cr>


" Terminal settings
if has('terminal')
  " Kill job and close terminal window
  tnoremap <Leader>q <C-w><C-C><C-w>c<cr>

  " switch to normal mode with esc
  tnoremap <Esc> <C-W>N

  " mappings to move out from terminal to other views
  tnoremap <C-h> <C-w>h
  tnoremap <C-j> <C-w>j
  tnoremap <C-k> <C-w>k
  tnoremap <C-l> <C-w>l
 
  " Open terminal in vertical, horizontal and new tab
  nnoremap <leader>tv :vsplit<cr>:term ++curwin<CR>
  nnoremap <leader>ts :split<cr>:term ++curwin<CR>
  nnoremap <leader>tt :tabnew<cr>:term ++curwin<CR>

  tnoremap <leader>tv <C-w>:vsplit<cr>:term ++curwin<CR>
  tnoremap <leader>ts <C-w>:split<cr>:term ++curwin<CR>
  tnoremap <leader>tt <C-w>:tabnew<cr>:term ++curwin<CR>

  " always start terminal in insert mode when I switch to it
  " NOTE(arslan): startinsert doesn't work in Terminal-normal mode.
  " autocmd WinEnter * if &buftype == 'terminal' | call feedkeys("i") | endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction


autocmd filetype python nnoremap <leader>r :w <bar> exec '!python '.shellescape('%')<CR>
autocmd filetype c nnoremap <leader>r :w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
autocmd filetype cpp nnoremap <leader>r :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
