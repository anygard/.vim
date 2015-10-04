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
noremap <leader>ll :call ColorColumn()<cr>

" toggle a higlight of special chars
function! ListToggle()
    if ! &list
        set list
    else
        set nolist
    endif
endfunction
noremap <leader>ls :call ListToggle()<cr>

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
noremap <leader>sc :call Spelling()<cr>
