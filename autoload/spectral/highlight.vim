let s:done = {}

function! spectral#highlight#highlight() abort
  %s/#[a-fA-F0-9]\{6}/\=spectral#highlight#highlightOne(submatch(0))/g
endfunction

function! spectral#highlight#highlightLine() abort
  let curpos = getcurpos()
  silent! '[,']s/#[a-fA-F0-9]\{6}/\=spectral#highlight#highlightOne(submatch(0))/g
  call cursor(curpos[1:])
endfunction

function! spectral#highlight#highlightOne(match) abort
  let match = a:match
  let nohash = match[1:]

  if has_key(s:done, match)
    return a:match
  else
    let s:done[match] = 1
  endif

  exec printf("syn match %s +%s+ containedIn=vimComment,vim9Comment,vimString,vimIsCommand,vimHiGuiRgb", nohash, match)
  exec printf("hi %s guifg=#000000 guibg=%s", nohash, match)

  " Return exactly what was put in. We only care about the side effets.
  return a:match
endfunction

function! spectral#highlight#clearCache() abort
  let s:done = {}
  call spectral#highlight#highlight()
endfunction
