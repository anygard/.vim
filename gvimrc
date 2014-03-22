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

if has("gui_gtk2")
    try
        set guifont=Inconsolata\ 12
    catch /^Vim\%((\a\+)\)\=:E185/
        set guifont=Courier\ New\ 12
    endtry
elseif has("gui_macvim")
    try
        set guifont=Menlo\ Regular:h14
    catch /^Vim\%((\a\+)\)\=:E185/
        set guifont=Monaco:h14
    endtry
elseif has("gui_win32")
    try
        set guifont=Consolas:h11:cANSI
    catch /^Vim\%((\a\+)\)\=:E185/
        set guifont=Courier\ New\ 12
    endtry
endif
