"" Pathogen {{{
let g:pathogen_disabled = ["clang_complete", "vim-fswitch", "vim-protodef", "pyflakes", "ropevim", "nerdtree", "supertab", "pydoc", "minibufexpl.vim", "gundo.vim"]
call pathogen#infect()
call pathogen#helptags()
" }}}
"" Basics {{{
" No one wants your shitty vi compatibility.
set nocompatible
syntax on
filetype plugin indent on
" }}}
"" Column stuff {{{
" Relative line numbers in left column
set relativenumber
" Highlight column 80
set colorcolumn=80
" }}}
"" gvim stuff {{{
"" guioptions {{{
" No menus
set go-=m
" No gui tabs
set go-=e
" Console dialogs
set go+=c
" Don't source $VIMRUNTIME/menu.vim
set go+=M
" No toolbar
set go-=T
" }}}
set guifont=Ubuntu\ Mono\ 9
" }}}
"" Solarized {{{
set background=dark
"let g:solarized_visibility="high"    "default value is normal
colorscheme solarized
" }}}
"" Title string {{{
func! RkTitleString()
    let fn = expand("%") == "" ? "<unnamed file>" : expand("%")
    if mode() == "n"
        let mode = "normal"
    elseif mode() == "i"
        let mode = "insert"
    elseif mode() == "v"
        let mode = "visual"
    elseif mode() == "V"
        let mode = "visual line"
    elseif mode() == "R"
        let mode = "replace"
    else
        let mode = mode()
    endif
    if &paste == 1
        let pasteMode = " [PASTE]"
    else
        let pasteMode = ""
    end
    if &modified == 1
        let modified = " +"
    else
        let modified = ""
    end

    let ret = modified . " (" . mode . " mode) " . " [" . getcwd() . "]" . pasteMode
    return ret
endfunc
set titlestring=%{RkTitleString()}
"set statusline=%!RkTitleString()
" }}}
"" Config edit shortcuts {{{
nnoremap \V :e ~/.vimrc<CR>
nnoremap \X :e ~/.xmonad/xmonad.hs<CR>
nnoremap \Z :e ~/.zshrc<CR>
nnoremap \v :source ~/.vimrc<CR>
" }}}
"" Tabs {{{
set tabstop=4
set shiftwidth=4
set expandtab
" }}}
"" Searching {{{
" Search as we type.
set incsearch
set ignorecase
set smartcase
" Highlight during and after searching.
set hlsearch
nnoremap \h :nohlsearch<CR>
" Use more typical regexes
nnoremap / /\v
" }}}
"" Folds {{{
func! RkFoldText()
    let line = getline(v:foldstart)
    let tx = substitute(line, '// {{{\d*', '', 'g') " }}}
    return v:folddashes . tx
endfunc
set foldtext=RkFoldText()
set foldmethod=marker
" }}}
"" Highlight evil whitespace {{{
set listchars=tab:.\ ,trail:\ 
set list
" }}}
"" Miscellaneous {{{
" Super duper : menus
set wildmenu
" For gossake
set hidden
nnoremap \P :set invpaste<CR>:set paste?<CR>
" Save undos after files are closed.
set undofile
" Highlight current line.
set cursorline
set showcmd
set scrolloff=4
" Always show status line
set laststatus=2
" Highlight what bracket we closed.
set showmatch
" :s has /g flag by default. Use /g to disable.
set gdefault
" Intuitive movement in wrapped lines.
nnoremap j gj
nnoremap k gk
noremap <F1> <nop>
" Save some time!
inoremap jj <Esc>
" And force it upon.
inoremap <Esc> <nop>
nnoremap \r :RainbowParenthesesToggle<CR>
" Should be a default
nnoremap Y y$
nnoremap \d :redraw!<CR>
nnoremap \m :make<CR>
nnoremap \t :make run<CR>
nnoremap \n :cnext<CR>
nnoremap \p :cprevious<CR>
" }}}

