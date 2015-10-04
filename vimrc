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

" enabling the package manager
if has('vim_starting')
  set nocompatible               " be iMproved
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  set encoding=utf-8 " Necessary to show Unicode glyphs
endif
call neobundle#begin(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

set laststatus=2   " Always show the statusline

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


" Powerline
"NeoBundle 'Lokaltog/vim-powerline'
"let g:Powerline_symbols = 'unicode'

"NeoBundle 'https://github.com/fholgado/minibufexpl.vim.git'
"let g:miniBufExplMaxSize = 1
"let g:miniBufExplSortBy = "mru"
"let g:miniBufExplUseSingleClick = 1
"noremap <A-Tab> :MBEbb<CR>
"noremap <A-S-Tab> :MBEbf<CR>
"noremap <A-b> :MBEFocus<CR>
"noremap <Leader>bm :MBEToggleMRU<CR>

NeoBundle 'https://github.com/airblade/vim-gitgutter.git'
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'Gundo'


NeoBundle 'Puppet-Syntax-Highlighting'

NeoBundle 'vcscommand.vim'

set t_Co=256

" in case t_Co alone doesn't work, add this as well:
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

" color schemes
NeoBundle 'molokai'
NeoBundle 'Solarized'
NeoBundle 'jellybeans.vim'
NeoBundle 'Distinguished'
NeoBundle 'https://github.com/freeo/vim-kalisi'

set background=dark
try
    echom "alpha"
    if has("nvim")
    echom "beta"
        colorscheme 'kalisi'
    else
        echom "gamma"
        colorscheme 'molokai'
    endif
catch /^Vim\%((\a\+)\)\=:E185/
    "Could not find specified colorscheme
endtry
set background=dark

 

NeoBundle 'https://github.com/bling/vim-airline.git'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = 'λ'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = 'π'
let g:airline_symbols.paste = '⧉'
let g:airline_symbols.whitespace = 'Ξ'

" python stuff
NeoBundle 'vim-flake8'
NeoBundle 'virtualenv.vim'

"let's get the NERD on
"NeoBundle 'The-NERD-tree'
"noremap <Leader>nt :NERDTreeToggle<cr>

NeoBundle 'The-NERD-Commenter'

"vim-session manager, needs vim-misc
NeoBundle 'https://github.com/xolox/vim-misc.git'
NeoBundle 'https://github.com/xolox/vim-session.git'
let g:session_autosave = 1
let g:session_autoload = 1
let g:session_autosave_periodic = 5
let g:session_default_name = v:servername

NeoBundle 'https://github.com/joonty/vdebug.git'
let g:vdebug_keymap = {
\    "run" : "<Leader>dg",
\    "run_to_cursor" : "r",
\    "step_over" : "n",
\    "step_into" : "s",
\    "step_out" : "o",
\    "close" : "q",
\    "detach" : "x",
\    "set_breakpoint" : "<Leader>db",
\    "eval_visual" : "<Leader>de"
\}

NeoBundle 'surround.vim'
NeoBundle 'vim-orgmode'


"Custom mappings for the unite buffer
"autocmd FileType unite call s:unite_settings()
"function! s:unite_settings()
"  Play nice with supertab
"  let b:SuperTabDisabled=1
"  Enable navigation with control-j and control-k in insert mode
"  imap <buffer> <Down>   <Plug>(unite_select_next_line)
"  imap <buffer> <Up>     <Plug>(unite_select_previous_line)
"endfunction
"
NeoBundle 'chase/vim-ansible-yaml'

NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
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

set pastetoggle=<Leader>pt

"NeoBundle 'LustyJuggler'
""let g:LustyJugglerDefaultMappings = 0
""let g:LustyJugglerAltTabMode = 1
"let g:LustyJugglerShowKeys = 1
"noremap <silent> <Esc>b :LustyJugglePrevious<CR>
"noremap <silent> <Esc>B :LustyJuggler<CR>

NeoBundle 'supertab'
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']
" noremap <tab> :

NeoBundle 'https://github.com/davidhalter/jedi-vim'

NeoBundle 'Shougo/unite-outline.git'
"NeoBundle 'Shougo/unite-session.git'
"NeoBundle 'https://github.com/ujihisa/unite-font.git'
"NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'
"NeoBundle 'https://github.com/sgur/unite-qf.git'
"NeoBundle 'git://github.com/kmnk/vim-unite-svn.git'
NeoBundle 'unite.vim'
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<cr>
nnoremap <leader>f :<C-u>Unite file_mru file_rec<cr>
nnoremap <leader>l :<C-u>Unite -buffer-name="Line" line<cr>
nnoremap <leader>L :<C-u>UniteResume "Line"<cr>
nnoremap <leader>b :Unite -quick-match buffer<cr>

" quick swap between this and previous buffer
nnoremap <C-b> :buffer #<cr>

function! ExecuteDir(dir)
  let file_list = split(globpath(a:dir, "*.vim"), '\n')

  for file in file_list
    execute( 'source '.file )
  endfor
endfunction

" include/execute all *vim files in directory
call ExecuteDir("~/.vim/vimrc.d")

call neobundle#end()

" Required by neobundle!?
filetype plugin indent on

NeoBundleCheck


