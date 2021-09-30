
if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

let g:spectral_parameters = {
      \ 'default_bg': 'dark',
      \ 'flip_algorithm': 'sqrt'}

let g:_syellow = "#f0e778"
let g:_syellowgreen = "#a8f078"
let g:_sgreen = "#76ec9e"
let g:_sbluegreen = "#73e6cd"
let g:_sblue = "#72d9e3"
let g:_sred = "#ec8b76"
let g:_sviolet = "#ce74c1"

let g:_steal = "#76ece9"
let g:_sorange = "#ecb976"

let g:_sbluepurple = "#9fa8f6"
let g:_sbluepurple_brighter = "#c8b8ff"
let g:_sbluepurple_darker = "#a186d9"

let g:_snormal = "#e8e1d3"
let g:_sbackground = "#1e1e1e"
let g:_spmenu = "#000000"
let g:_slightbg = "#fbf1d7"
let g:_sred = "#ec8b76"
let g:_svividorange = "#ff904a"

let g:_spurple = "#d683bb"
let g:_sdarkred = "#ac3634"
let g:_sdarkyellow = "#acac34"
let g:_sdarkblue = "#65adb7"
let g:_sdarkgreen = "#55ad67"

call spectral#StartCompile()

let g:_snontext = spectral#brighter(g:_sbackground,1.2)
let g:_sbgdarker = spectral#brighter(g:_sbackground,0.4)
let g:_ssigncol = g:_sbackground " spectral#brighter(g:_sbackground,0.5)
let g:_scursorline = spectral#brighter(g:_sbackground,1.4)
let g:_snrcol = g:_sbackground " spectral#brighter(g:_sbackground,0.7)
let g:_sgray = spectral#brighter(g:_sbackground,5)
let g:_slightgray = spectral#brighter(g:_sgray,1.5)

let g:_slightbgbase = g:_sbackground
let g:_slightnontext = spectral#brighter(g:_slightbgbase,0.5)
let g:_slightbgdarker = spectral#brighter(g:_slightbgbase,0.4)
let g:_slightsigncol = spectral#brighter(g:_slightbgbase,0.5)
let g:_slightnrcol = spectral#brighter(g:_slightbgbase,0.7)
let g:_slightgray = spectral#brighter(g:_slightbgbase,5)

Hi EnjinParameter g:_sbluegreen
Hi EnjinField g:_syellowgreen
Hi EnjinTypeParameter g:_spurple None []
Hi EnjinClass g:_sbluepurple_darker None []
Hi EnjinAbstractClass g:_sbluepurple None []
Hi EnjinInterface g:_sbluepurple_brighter None []
Hi EnjinAnnotation g:_sbluepurple_brighter None []

Hi PreProcEnjinTypeParameter spectral#saturate(g:_spurple,0.5) None []
Hi PreProcEnjinClass spectral#saturate(g:_sbluepurple_darker,0.5) None []
Hi PreProcEnjinAbstractClass spectral#saturate(g:_sbluepurple,0.5) None []
Hi PreProcEnjinInterface spectral#saturate(g:_sbluepurple_brighter,0.5) None []
Hi PreProcEnjinFunction     spectral#saturate(g:_sbluegreen,0.5) None    []

HiDark Normal      g:_snormal g:_sbackground ["None"]
HiLight Normal      #444635 g:_slightbg ["None"]

Hi SignColumn  g:_snormal g:_ssigncol ["None"]

Hi PMenu g:_svividorange g:_spmenu
Hi PMenuSel g:_sred g:_spmenu ["Inverse",]
Hi StorageClass g:_syellowgreen None    ["Bold"]
Hi Folded g:_sred g:_ssigncol None ["Bold"]
Hi FoldColumn g:_sred g:_ssigncol None []
Hi javaScopeDecl g:_steal None    ["Bold"]
Hi javaExternalImport g:_steal None    ["Bold"]
Hi Structure    g:_syellowgreen None    ["Bold"]
Hi String       g:_sgreen None    []
Hi Type         g:_sbluepurple None    []
Hi Statement    g:_sblue None    ["Bold"]
Hi ColorColumn  spectral#brighter(g:_sbackground,2) None    ["None"] 
Hi PreProc      g:_sviolet None    []
Hi Function     g:_sbluegreen None    []
Hi Identifier   g:_sred None
Hi Number       g:_steal None    ["Bold"]
Hi Comment      g:_sgray None    ["Italic"]
Hi Directory    g:_syellow None    ["Bold"]
Hi Constant     g:_sred None ["Bold"]
Hi Specialcomment g:_slightgray None ["Bold"]
Hi Operator g:_svividorange None ["Bold"]
Hi Special g:_sorange None ["Bold"]

Hi Visual      g:_sbackground g:_sred

Hi LineNrAbove spectral#mix(spectral#saturate(g:_sblue,0.6),g:_snrcol,0.5) g:_snrcol []
Hi LineNrBelow spectral#mix(spectral#saturate(g:_sred,0.6),g:_snrcol,0.5) g:_snrcol []
Hi LineNr spectral#mix(spectral#saturate(g:_syellow,0.6),g:_snrcol,0.5) g:_snrcol []
Hi CursorLineNr spectral#mix(spectral#saturate(g:_syellow,0.6),g:_snrcol,0.5) g:_scursorline []
Hi NonText     g:_sred g:_snontext ["Bold"]

Hi CursorLine None g:_scursorline
Hi CursorColumn None g:_scursorline

HiDark VertSplit #000000 g:_sbackground ["Bold"]
HiDark FloatBorder g:_sred g:_sbgdarker
HiDark TabLineFill None g:_sbgdarker
HiDark TabLine None g:_snontext ["Bold"]
HiDark TabLineSel g:_svividorange None ["Bold"]
HiDark StatusLine g:_sred g:_sbgdarker
HiDark StatusLineNC g:_snormal g:_sbgdarker

HiLight FloatBorder g:_sred g:_slightbgdarker
HiLight VertSplit g:_slightbgdarker g:_slightbgdarker
HiLight TabLineFill None g:_slightbgdarker
HiLight TabLine None g:_slightnontext ["Bold"]
HiLight TabLineSel g:_svividorange None ["Bold"]
HiLight StatusLine g:_sred g:_slightbgdarker
HiLight StatusLineNC g:_snormal g:_slightbgdarker

Hi Spellbad None None g:_sred ["undercurl"]

Hi Search g:_syellow None ["Inverse"]
Hi SearchInc g:_sblue None ["Inverse"]

Hi Error g:_sdarkred
Hi Warning g:_sdarkyellow
Hi Info g:_sdarkblue
Hi Success g:_sdarkgreen

Hi DiagnosticSignWarn g:_sdarkyellow None ["None"] 
Hi DiagnosticSignError g:_sdarkred None ["None"] 
Hi DiagnosticVirtualTextWarn g:_sdarkyellow spectral#brighter(g:_sbackground,0.7) ["None"] 
Hi DiagnosticVirtualTextError g:_sdarkred spectral#brighter(g:_sbackground,0.7) ["None"] 

call spectral#Finish()

call spectral#useDefaultTerminalColors()

hi link vimFunction Function
hi link PreProcEnjinAnnotation PreProcEnjinInterface
