" vimrc for jake@home
" Last updated: 2009-01-23

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

call pathogen#infect()
filetype plugin indent on

" Put those pesky swap and backup files elsewhere
set directory=~/.vim/swap//
set backupdir=~/.vim/backup//

set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching
set ignorecase          " ignore case when searching
set wrap
set formatoptions=1
set lbr                 " intelligent word wrap
set showbreak=↳\ 
set nu                  " enable line numbers
set encoding=utf8
set t_Co=256            " 256 colours
set autoindent
set fdm=syntax
set foldlevel=99
set autoread
set omnifunc=syntaxcomplete#Complete " ctl-n auto-complete

" Colours
syntax on
if has("gui_running")
  colorscheme solarized
  set background=light
  set guifont=Terminus\ 7.5
else
  colorscheme solarized
  set background=dark
endif

" show invisibles:
set list  " makes lbr (nice line wrapping) not work
set listchars=tab:··,trail:·

" tabs:
set tabstop=2           " (ts)
set softtabstop=2       " (sts) Turned off with 0
set shiftwidth=2        " (sw)  Used for autoindent, and << and >>
set expandtab           " (et)  Expand tabs to spaces

" GVIM settings
set guioptions-=T        " Disable toolbar
set guioptions-=m        " Disable file menu
autocmd BufLeave,FocusLost silent! wall  " auto-save

"au FileType * setl fo+=cro " enable auto comments
"hi Comment ctermfg=blue	" make comments blue

let javascript_enable_domhtmlcss=1

"make netrw sync its working directory with vim
let g:netrw_keepdir = 0

" match tag always plugin
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'jsp' : 1,
    \}

" ycm youcompleteme
let g:EclimCompletionMethod = 'omnifunc'
let g:ycm_semantic_triggers = {'java' : ['.'] }

" powerline settings
let g:Powerline_symbols = 'fancy'
set laststatus=2

" slime
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,perl,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
