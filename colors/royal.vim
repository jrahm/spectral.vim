
if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

if !exists('g:spectral_parameters')
  let g:spectral_parameters = {
        \ 'default_bg': 'light',
        \ 'filter_fg': [spectral#normalize([1, 0.2, 0.2], 0.8),
        \               spectral#normalize([0.2, 1, 0.2], 0.8),
        \               spectral#normalize([0.2, 0.2, 1], 0.8)]}
endif

let g:_snormal = "#2a1a12"
let g:_sbg = "#e5dab8"
let g:_sblueish = "#4e587e"
let g:_sdarknormal = "#f1dbcf"
let g:_sdarkbg = "#25211a"
let g:_sdarkvsplit = spectral#brighter(g:_sdarkbg, 2)
let g:_sdarktablinefill = spectral#brighter(g:_sdarkbg, 0.6)
let g:_sdarktabline = spectral#brighter(g:_sdarkbg, 0.8)

call spectral#StartCompile()

Hi StatusLineNC  #2a1a12 #f0f0f0
Hi StatusLine  #903300 #f0f0f0 ["Bold"]

HiLight Normal      g:_snormal g:_sbg
HiDark Normal      g:_sdarknormal g:_sdarkbg

HiLight Comment     #a38643 None    ["Italic"]
HiDark Comment spectral#brighter(g:_sdarkbg,3) None ["Italic"]

Hi PMenu       #2a1a12 #e9dfc9 ["None"]
Hi SignColumn  #2a1a12 #e9dfc9 ["None"]
Hi NonText     None spectral#brighter(g:_sbg,1.2)
Hi Visual      #e5dac0 #2a1a12  ["None"]
Hi Special     g:_sblueish

Hi StorageClass #903300 None    ["bold"]
Hi Structure    #903300 None    ["bold"]
Hi String       #2d5c05 None    ["None"]
Hi Type         #3c2c5c None    ["bold"]
Hi Statement    #b34700 None    ["bold"]
Hi ColorColumn  #8080dd None    ["None"] 
Hi PreProc      #735a65 None    ["None"]
Hi Function     g:_sblueish None    ["None"]
Hi Identifier   #1a2d4b None    ["None"]
Hi Number       #b32da0 None    ["None"]
Hi Directory    #542db3 None    ["None"]
Hi Constant     #58545c None    ["Italic"]

Hi EnjinTypeParameter    #b36b00 None ["bold"]
Hi EnjinLambdaParameter  #a000d0 None ["italic"]
Hi EnjinInterface        #9c2c5c None ["bold"]
Hi EnjinAbstractClass    #6c2c5c None ["bold"]

Hi EnjinParameter        #8b2d1a None ["Italic"]
Hi EnjinField            #443c44 None ["None"]
Hi EnjinLocalVar         #565b5c None ["Italic"]

Hi javaCommentTitle      #6b4b00 None    ["Bold"]
Hi javaDocTags           #8b2b00 None    ["None"]
Hi javaDocComment        #636343 None    ["None"]
Hi htmlTag               #e65c00 None    ["None"]
Hi htmlTagName           #b34700 None    ["None"]
Hi LineNr                #b34700 #dad5d0 ["Bold"]
Hi CursorLineNr          #b347b3 #dad5d0 ["Bold"]
Hi CursorColumn          None    #d3d0ca ["None"]
Hi CursorLine            None    #d3d0ca ["None"]
Hi LspDiagnosticsDefaultWarning #FF4F00 None ["None"]
Hi LspDiagnosticsUnderlineWarning None None #FFaF00 ["undercurl"]
Hi LspDiagnosticsUnderlineError None None #FF0a00 ["undercurl"]

HiLight VertSplit            #a59a70 #a59a70 ["None"]
HiDark VertSplit            g:_sdarkvsplit g:_sdarkvsplit

HiLight TabLineFill          #2a1a12 spectral#brighter(g:_sbg,2) ["None"]
HiLight TabLine              #000000 spectral#brighter(g:_sbg,1.2) ["Bold"]
HiLight TabLineSel           g:_sblueish g:_sbg #000000 ["Bold"]

HiDark TabLineFill None g:_sdarktablinefill
HiDark TabLine None g:_sdarktabline
HiDark TabLineSel spectral#flip_brightness(g:_sblueish) g:_sdarkbg ["Bold"]

Hi PreProcEnjinInterface         #483e60 None ["None"]
Hi PreProcEnjinClass             #2d2145 None ["None"]
Hi PreProcEnjinFunction          #30374f None ["None"]
Hi PreProcEnjinEnum              #483e60 None ["None"]
Hi PreProcEnjinAnnotationElement #30374f None ["None"]

call spectral#Finish()

if &bg=="dark"  
  hi EnjinTypeParameter guifg=#ff9900
  hi javaCommentTitle guifg=#ffaa00 gui=bold
  hi javaDocComment guifg=#ffdd30
endif

hi Terminal guibg=#000000 guifg=#e0e0e0

hi link CurosorLine CursorColumn
hi link vimFunction Function
hi link PreProcEnjinAnnotation PreProcEnjinInterface

call spectral#useDefaultTerminalColors()
