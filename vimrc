"   Copyright 2011, 2012, 2013, 2014 Anders Nygård
"
"   This program is free software: you can redistribute it and/or modify it
"   under the terms of the GNU General Public License as published by the Free
"   Software Foundation, either version 3 of the License, or (at your option)
"   any later version.
"
"   This program is distributed in the hope that it will be useful, but
"   WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
"   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
"   for more details.
"
"   You should have received a copy of the GNU General Public License along
"   with this program.  If not, see <http://www.gnu.org/licenses/>.

set nocompatible               " be iMproved
filetype off                   " required!

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

syntax on
set showcmd
set showmode
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set smarttab
set expandtab
set visualbell
filetype plugin indent on     " required! by vundle

" allow for hidden buffers
set hidden

" statusline pimping
" obsoleted by powerline, kept ut of sentimental reasons
" set laststatus=2
" set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ %=chr(%b)\ %l\,%c\ %P

" higlighting currentline when in insert mode
if v:version >= 700
  autocmd InsertEnter * set cursorline
  autocmd InsertLeave * set nocursorline
endif

" disable wrapping of long lines and some settings for handling the resulting
" long lines
set nowrap
set sidescroll=5
set listchars+=precedes:<,extends:>

" disable matchparen plugin, ie. the cursor won't jump around whenyou type a
" ), } or ].
let loaded_matchparen = 1

" allows vim to remeber things between invocations
" opened buffers and such. Only works if you invoke without parameters
set viminfo='100,h,%

"disables Apple HIG movement mappings
let macvim_skip_cmd_opt_movement = 1

" plugin stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Powerline
"Bundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'unicode'

Bundle 'https://github.com/fholgado/minibufexpl.vim.git'
let g:miniBufExplMaxSize = 1
let g:miniBufExplSortBy = "mru"
let g:miniBufExplUseSingleClick = 1
noremap <A-Tab> :MBEbb<CR>
noremap <A-S-Tab> :MBEbf<CR>
noremap <A-b> :MBEFocus<CR>
noremap <Leader>bm :MBEToggleMRU<CR>

Bundle 'https://github.com/airblade/vim-gitgutter.git'
Bundle 'tpope/vim-fugitive'

Bundle 'Gundo'

Bundle 'https://github.com/bling/vim-airline.git'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'


Bundle 'Puppet-Syntax-Highlighting'

" color schemes
Bundle 'molokai'
Bundle 'Solarized'
Bundle 'jellybeans.vim'
try
    colorscheme Solarized
catch /^Vim\%((\a\+)\)\=:E185/
    "Could not find specified colorscheme
endtry

" python stuff
Bundle 'vim-flake8'
Bundle 'virtualenv.vim'

"let's get the NERD on
"Bundle 'The-NERD-tree'
"noremap <Leader>nt :NERDTreeToggle<cr>

Bundle 'The-NERD-Commenter'

"vim-session manager, needs vim-misc
Bundle 'https://github.com/xolox/vim-misc.git'
Bundle 'https://github.com/xolox/vim-session.git'
let g:session_autosave = 1
let g:session_autoload = 1
let g:session_autosave_periodic = 5
let g:session_default_name = v:servername

Bundle 'surround.vim'
Bundle 'vim-orgmode'
Bundle 'supertab'

Bundle 'unite.vim'
Bundle 'https://github.com/Shougo/unite-ssh.git'
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>uf :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>ur :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>uo :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>uy :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>ub :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <Down>   <Plug>(unite_select_next_line)
  imap <buffer> <Up>     <Plug>(unite_select_previous_line)
endfunction

"Bundle 'https://github.com/Shougo/vimshell.vim.git'
"Bundle 'vimshell-ssh'
Bundle 'https://github.com/Shougo/vimfiler.vim.git'
let g:vimfiler_as_default_explorer = 1
noremap <Leader>f :VimFilerSplit<cr>

" moving around in insertmode just confuses me
imap <Up> <nop>
imap <Left> <nop>
imap <Right> <nop>
imap <Down> <nop>

" remapping of keys in autocompletion popupmenu
"inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<nop>"
"inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<nop>"
"inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
"inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

noremap <A-Up> <C-W>k
noremap <A-Down> <C-W>j
noremap <A-Left> <C-W>h
noremap <A-Right> <C-W>l

noremap <A-p> "0p

set pastetoggle=<Leader>pt

" toggle a higlight at &textwidth, for keeping line sufficiently short
function! ColorColumn()
    if ! &textwidth
        set textwidth=78
    endif
    if &colorcolumn == ''
        set colorcolumn=+1
    else
        set colorcolumn=""
    endif
endfunction
noremap <Leader>ll :call ColorColumn()<cr>

" threeway toggle 'no spell check', 'english', 'swedish'
set spellfile="personal.spf"
let g:SpellingState = 0
function! Spelling()
    if g:SpellingState % 3 == 0
        set spell spelllang=en_us
        echo "Spellcheck enabled (English)"
    elseif g:SpellingState % 3 == 1
        set spell spelllang=sv
        echo "Spellcheck enabled (Swedish)"
    elseif g:SpellingState % 3 == 2
        set nospell
        echo "Spellcheck disabled"
    endif
    let g:SpellingState = g:SpellingState + 1
endfunction
noremap <Leader>sc :call Spelling()<cr>
