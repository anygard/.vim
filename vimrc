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
if has('gui_macvim')
    let macvim_skip_cmd_opt_movement = 1
endif

" VCS tools
if has('signs')
    NeoBundle 'https://github.com/airblade/vim-gitgutter.git'
    NeoBundle 'https://github.com/vim-scripts/vim-svngutter.git'
endif

NeoBundle 'tpope/vim-fugitive'

NeoBundle 'https://github.com/juneedahamed/svnj.vim.git'
" default mappings collide with NERDcommenter
nnoremap <leader>ja :<C-u>:SVNAdd<cr>
nnoremap <leader>js :<C-u>:SVNStatus<cr>
nnoremap <leader>jb :<C-u>:SVNBlame<cr>
nnoremap <leader>jc :<C-u>:SVNCommit<cr>

NeoBundle 'Gundo'
nnoremap <F5> :GundoToggle<CR>

NeoBundle 'The-NERD-Commenter'

" settings for various filetypes
NeoBundle 'Puppet-Syntax-Highlighting'

NeoBundle 'chase/vim-ansible-yaml'

" python
NeoBundle 'vim-flake8'
NeoBundle 'virtualenv.vim'
NeoBundle 'https://github.com/davidhalter/jedi-vim'


"vim-session manager, needs vim-misc
NeoBundle 'https://github.com/xolox/vim-misc.git'
NeoBundle 'https://github.com/xolox/vim-session.git'
let g:session_autosave = 1
"let g:session_autoload = 1
let g:session_autosave_periodic = 5
"let g:session_default_name = v:servername
nnoremap <leader><Leader>so :<C-u>OpenSession<space>
nnoremap <leader><Leader>ss :<C-u>SaveSession<space>
nnoremap <leader><Leader>sc :<C-u>CloseSession<space>
nnoremap <leader><Leader>sd :<C-u>DeleteSession<space>

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

NeoBundle 'https://github.com/Shougo/vimfiler.vim.git'
let g:vimfiler_as_default_explorer = 1
noremap <Leader>f :VimFilerSplit<cr>

" moving around in insertmode just confuses me
imap <Up> <nop>
imap <Left> <nop>
imap <Right> <nop>
imap <Down> <nop>

noremap <A-Up> <C-W>k
noremap <A-Down> <C-W>j
noremap <A-Left> <C-W>h
noremap <A-Right> <C-W>l

set pastetoggle=<Leader>pt

NeoBundle 'supertab'
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

" Unite magic
NeoBundle 'Shougo/unite-outline.git'
NeoBundle 'Shougo/unite-session.git'
"NeoBundle 'https://github.com/ujihisa/unite-font.git'
"NeoBundle 'https://github.com/ujihisa/unite-colorscheme.git'
"NeoBundle 'https://github.com/sgur/unite-qf.git'
"NeoBundle 'git://github.com/kmnk/vim-unite-svn.git'
NeoBundle 'unite.vim'
"call unite#filters#matcher_default#use(['matcher_fuzzy'])
let g:unite_source_history_yank_enable = 1
nnoremap <leader>y :<C-u>Unite history/yank<cr>
nnoremap <leader>f :<C-u>Unite file_mru file_rec file/new<cr>

nnoremap <leader>l :<C-u>Unite -buffer-name="Line" line<cr>
nnoremap <leader>L :<C-u>UniteResume "Line"<cr>

if $HOME == '/root'
    let g:uniteroot = '/'
else
    let g:uniteroot = $HOME
endif
execute "nnoremap <leader>d :<C-u>Unite -buffer-name=\"Directories\" directory:" . g:uniteroot . "<cr>"
nnoremap <leader>D :<C-u>UniteResume "Directories"<cr>

nnoremap <leader>b :Unite buffer<cr>

" quick swap between this and previous buffer
nnoremap <C-b> :buffer #<cr>


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
if has("nvim")
    let s:colsch='kalisi'
else
    let s:colsch='molokai'
endif
try
    execute 'colorscheme ' . s:colsch
catch /^Vim\%((\a\+)\)\=:E185/
"    echom "Could not find specified colorscheme: " . s:colsch
endtry
set background=dark

NeoBundle 'https://github.com/bling/vim-airline.git'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif


let g:airline_powerline_fonts = 1

if g:airline_powerline_fonts != 1
    " unicode symbols
    "let g:airline_left_sep = '»'
    "let g:airline_left_sep = '▶'
    "let g:airline_right_sep = '«'
    "let g:airline_right_sep = '◀'
    "let g:airline_symbols.linenr = '␤'
    "let g:airline_symbols.linenr = 'λ'
    "let g:airline_symbols.branch = '⎇'
    "let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.paste = 'π'
    "let g:airline_symbols.paste = '⧉'
    "let g:airline_symbols.whitespace = 'Ξ'
endif


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


