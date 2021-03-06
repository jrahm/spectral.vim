function! s:dirname(arg) abort
  return substitute(a:arg, '/[^/]*$', '', '')
endfunction

function! s:basename(arg) abort
  return substitute(a:arg, '.\{-}/\([^/]*\)$', '\1', '')
endfunction

let s:cache_folder = s:dirname(expand('<sfile>')) . '/cache/'
let s:this_file = expand('<sfile>')
let s:this_folder = s:dirname(s:this_file)

let s:source = []
let s:cache_file = ''
let s:loaded_python = 0
let s:use_cache = 0

function! spectral#brighter(color, amount)
  let saved = 0
  if exists('g:return')
    let old_return = g:return
    let saved = 1
  endif

  call s:loadPythonScript()
  exec printf('python3 spectral_lighter("%s", %s)', a:color, a:amount)

  let ret = g:return

  if saved
    let g:return = old_return
  else
    unlet g:return
  endif

  return ret
endfunction

function! spectral#desaturate(color, amount)
  let matrix = [ spectral#normalize([1, a:amount, a:amount], 1),
        \        spectral#normalize([a:amount, 1, a:amount], 1),
        \        spectral#normalize([a:amount, a:amount, 1], 1) ]

  let [r, g, b] = spectral#parseColor(a:color)

  let nr = r * matrix[0][0] + g * matrix[0][1] + b * matrix[0][2]
  let ng = r * matrix[1][0] + g * matrix[1][1] + b * matrix[1][2]
  let nb = r * matrix[2][0] + g * matrix[2][1] + b * matrix[2][2]

  return spectral#toColor(nr, ng, nb)
endfunction

function! spectral#getSaturation(color)
  let saved = 0
  if exists('g:return')
    let old_return = g:return
    let saved = 1
  endif

  call s:loadPythonScript()
  exec printf('python3 spectral_get_saturation("%s")', a:color)

  let ret = g:return

  if saved
    let g:return = old_return
  else
    unlet g:return
  endif

  return ret
endfunction

function! spectral#setSaturation(color, amount)
  let saved = 0
  if exists('g:return')
    let old_return = g:return
    let saved = 1
  endif

  call s:loadPythonScript()
  exec printf('python3 spectral_set_saturation("%s", %s)', a:color, a:amount)

  let ret = g:return

  if saved
    let g:return = old_return
  else
    unlet g:return
  endif

  return ret
endfunction


function! spectral#parseColor(color) abort
  if type(a:color) == v:t_list
    return a:color
  endif

  return [
        \ str2nr(a:color[1:2], 16),
        \ str2nr(a:color[3:4], 16),
        \ str2nr(a:color[5:6], 16) ]
endfunction

function! spectral#toColor(r, g, b) abort
  let r = spectral#clip(a:r, 0, 255)
  let g = spectral#clip(a:g, 0, 255)
  let b = spectral#clip(a:b, 0, 255)

  return printf("#%02x%02x%02x",
        \ float2nr(r),
        \ float2nr(g),
        \ float2nr(b))
endfunction

function! spectral#clip(c, min, max) abort
  if a:c < a:min
    return a:min
  elseif a:c > a:max
    return a:max
  else
    return a:c
  endif
endfunction

function! s:loadPythonScript()
  if s:loaded_python
    return
  endif

  exec 'py3file ' . s:this_folder . '/spectral.py'
  let s:loaded_python = 1
endfunction

function! spectral#normalize(ls, target_mag) abort
  let total_mag = 0
  for l in a:ls
    let total_mag += l * l
  endfor
  let total_mag = sqrt(total_mag)

  let lsp = []
  let frac = total_mag / a:target_mag
  for l in a:ls
    call add(lsp, l / frac)
  endfor

  return lsp
endfunction

function! spectral#mix(color1, color2, ...) abort
  if a:0 == 1
    let amt = a:1
  else
    let amt = 0.5
  endif

  let [r1, g1, b1] = spectral#parseColor(a:color1)
  let [r2, g2, b2] = spectral#parseColor(a:color2)

  return spectral#toColor(
        \ r1 * (1 - amt) + r2 * amt,
        \ g1 * (1 - amt) + g2 * amt,
        \ b1 * (1 - amt) + b2 * amt)

endfunction

function! spectral#StartCompile()
  if !exists('g:spectral_parameters')
    let g:spectral_parameters = {}
  endif

  call system('mkdir -p ' . shellescape(s:cache_folder))

  let basename = s:basename(g:spectral_colorscheme_file)
  let s:cache_file = printf('%s/%s', s:cache_folder, basename)

  if filereadable(s:cache_file)
     let cache_file_time = getftime(s:cache_file)
     let script_file_time = getftime(g:spectral_colorscheme_file)
     let this_file_time = getftime(s:this_file)
     let python_file_time = getftime(s:this_folder . '/spectral.py')

     if cache_file_time >= script_file_time 
           \ && cache_file_time >= this_file_time
           \ && cache_file_time >= python_file_time
      exec "source " . s:cache_file
      let s:use_cache = 1
      return 1
    endif
  endif

  let s:use_cache = 0
  call s:loadPythonScript()
  exec "python3 spectral_start('" . s:cache_file . "')"

  return 0
endfunction

function! s:resolve(name) abort
  if (len(a:name) == 0 || a:name[0] != '#') && a:name != "None"
    return eval(a:name)
  else
    return a:name
  endif
endfunction

function! spectral#flip_brightness(color) abort
  let saved = 0
  if exists('g:return')
    let old_return = g:return
    let saved = 1
  endif

  call s:loadPythonScript()
  exec printf('python3 spectral_flip_brightness("%s")', a:color)

  let ret = g:return

  if saved
    let g:return = old_return
  else
    unlet g:return
  endif

  return ret
endfunction

function! spectral#Hi(bang, fn, name, ...)
  if s:use_cache
    return
  endif

  let count = a:0
  if count == 4 
    let fg = s:resolve(a:1)
    let bg = s:resolve(a:2)
    let sp = s:resolve(a:3)
    let extra = eval(a:4)
  elseif count == 3
    let fg = s:resolve(a:1)
    let bg = s:resolve(a:2)
    let sp = "None"
    let extra = eval(a:3)
  elseif count == 2
    let fg = s:resolve(a:1)
    let bg = s:resolve(a:2)
    let sp = "None"
    let extra = []
  elseif count == 1
    let fg = s:resolve(a:1)
    let bg = "None"
    let sp = "None"
    let extra = []
  else
    echoerr printf("Incorrect number of arguments for highlight [%s]", a:name)
    return
  endif

  if extra == []
    let extra = ["None"]
  endif

  if a:bang
    exec printf('python3 spectral_ctx.highlight_after("%s", "%s", "%s", "%s", %s)',
          \ a:name, fg, bg, sp, string(extra))
  elseif a:fn == "dark"
    exec printf('python3 spectral_ctx.highlight_dark("%s", "%s", "%s", "%s", %s)',
          \ a:name, fg, bg, sp, string(extra))
  elseif a:fn == "light"
    exec printf('python3 spectral_ctx.highlight_light("%s", "%s", "%s", "%s", %s)',
          \ a:name, fg, bg, sp, string(extra))
  else
    exec printf('python3 spectral_ctx.highlight("%s", "%s", "%s", "%s", %s)',
          \ a:name, fg, bg, sp, string(extra))
  endif
endfunction

command! -bang -nargs=* Hi call spectral#Hi("<bang>" == "!", "", <f-args>)
command! -bang -nargs=* HiDark call spectral#Hi("<bang>" == "!", "dark", <f-args>)
command! -bang -nargs=* HiLight call spectral#Hi("<bang>" == "!", "light", <f-args>)

function! spectral#Finish()
  unlet g:spectral_parameters
  unlet g:spectral_colorscheme_file

  if s:use_cache
    return
  endif

  python3 spectral_finish()
  exec "source " . s:cache_file
endfunction

function! spectral#useDefaultTerminalColors() abort
  if &bg == "dark"
    let g:terminal_color_0="#282828"
    let g:terminal_color_1="#cc241d"
    let g:terminal_color_10="#b8bb26"
    let g:terminal_color_11="#fabd2f"
    let g:terminal_color_12="#83a598"
    let g:terminal_color_13="#d3869b"
    let g:terminal_color_14="#8ec07c"
    let g:terminal_color_15="#ebdbb2"
    let g:terminal_color_2="#98971a"
    let g:terminal_color_3="#d79921"
    let g:terminal_color_4="#458588"
    let g:terminal_color_5="#b16286"
    let g:terminal_color_6="#689d6a"
    let g:terminal_color_7="#a89984"
    let g:terminal_color_8="#928374"
    let g:terminal_color_9="#fb4934"
  else
    let g:terminal_color_0="#dedede"
    let g:terminal_color_1="#df3c2f"
    let g:terminal_color_10="#2a3600"
    let g:terminal_color_11="#3f1b00"
    let g:terminal_color_12="#2a493e"
    let g:terminal_color_13="#712d44"
    let g:terminal_color_14="#003b00"
    let g:terminal_color_15="#1e1600"
    let g:terminal_color_2="#485300"
    let g:terminal_color_3="#5c3400"
    let g:terminal_color_4="#347073"
    let g:terminal_color_5="#9a4c71"
    let g:terminal_color_6="#215b2b"
    let g:terminal_color_7="#4e4431"
    let g:terminal_color_8="#65594b"
    let g:terminal_color_9="#b30005"
  endif
endfunction

function! spectral#brightenWord(amnt) abort
  let color = expand('<cword>')

  if !(color =~ '^#[A-F-a-f0-9]\{6}')
    echo "Not a color"
    return
  endif

  let new_color = spectral#brighter(color, a:amnt)
  exec "norm ciw" . new_color . ""
endfunction

function! spectral#saturate(color, amnt) abort
  let cur_sat = spectral#getSaturation(a:color)
  return spectral#setSaturation(a:color, cur_sat * a:amnt)
endfunction

function! spectral#saturateWord(amnt) abort
  let color = expand('<cword>')

  if !(color =~ '^#[A-F-a-f0-9]\{6}')
    echo "Not a color"
    return
  endif

  let cur_sat = spectral#getSaturation(color)
  let new_color = spectral#setSaturation(color, cur_sat * a:amnt)
  exec "norm ciw" . new_color . ""
endfunction
