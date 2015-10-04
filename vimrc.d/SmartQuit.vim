" used to overide :q should allow for closing of a single buffer if there are
" many buffers and only one window

function! SmartQuit()
    let l:curbuf = bufname('')
    let l:numbuf = len(filter(range(1, bufnr('$')), 'buflisted(v:val)'))
    let l:winnum = winnr('$')
    if l:winnum == 1 && l:numbuf > 1
       "echom "Smart"
       bdelete 
    else
       "echom "Dumb"
       quit
    endif
endfunction

command! SmartQuit :call SmartQuit()

cabbrev quit <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'SmartQuit' : 'quit')<CR>
cabbrev q <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'SmartQuit' : 'quit')<CR>
