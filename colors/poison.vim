if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

if !exists('g:spectral_parameters')
  let g:spectral_parameters = {
        \ 'default_bg': 'dark',
        \ 'filter_fg': [spectral#normalize([1, 0, 0], 1),
        \               spectral#normalize([0, 1, 0], 1),
        \               spectral#normalize([0, 0, 1], 1)],
        \ 'flip_algorithm': "sqrt" }
endif

call spectral#StartCompile()

let g:_sbackground = '#1e1d1c'
let g:_solive = '#b7ce41'
let g:_sdesat = '#aae171'
let g:_sgreen = '#4eff0c'
let g:_syellow ='#ffde0c'
let g:_snormal = '#e5dab8'
let g:_sred = '#ff0c6c'
let g:_sorange = '#ffa20c'
let g:_sgray = '#8b9da1'
let g:_sbrightgray = spectral#brighter('#8b9da1', 1.2)
let g:_sblue = '#6ee0e0'
let g:_spurple = '#f87fff'

let g:_svertsplit = spectral#brighter(g:_sbackground,2.5)
let g:_ssigncol = spectral#brighter(g:_sbackground,1.8)

let g:_stype = g:_sorange
let g:_senum = spectral#mix(g:_sorange,g:_sgray,0.4)
let g:_sinterface = spectral#mix(g:_sorange,g:_sred,0.4)
let g:_sabstract_class = spectral#mix(g:_sorange,g:_sred,0.2)
let g:_sstring = spectral#mix(g:_sgreen, g:_syellow, 0.5)

let g:_sgold = '#ffd900'

Hi StatusLine g:_sred spectral#brighter(g:_svertsplit,0.7) ["Bold"]
Hi StatusLineNC g:_sgray spectral#brighter(g:_svertsplit,0.7) ["None"]

Hi Folded g:_sred spectral#brighter(g:_sbackground,1.5)
Hi Error #d52a2f None #d52a2f ["Undercurl"]
Hi Warning #d5d32a None #d5d32a ["None"]
Hi Success #2ad547 None 
Hi Normal g:_snormal g:_sbackground 
Hi Comment spectral#brighter(g:_sblue,0.9) None ["Italic"] 
Hi StorageClass g:_sgreen None ["Bold"] 
Hi Statement g:_sgreen None ["Bold"] 
Hi String g:_sstring None ["Italic"] 
Hi Identifier g:_sbrightgray None 
Hi Structure g:_sred None ["Bold"] 
Hi Function #b8b3a9 None ["None"] 
Hi Type g:_stype None ["Bold"] 
Hi Special g:_sgold 
Hi javaCommentTitle g:_sblue None ["Bold","Italic"] 
Hi javaDocTags g:_sdesat None ["None"] 
Hi htmlTag #dc00ff None ["None"] 
Hi htmlTagName g:_sblue None ["Bold"] 
Hi javaDocComment spectral#brighter(spectral#desaturate(g:_sblue,0.5),0.7) None ["Italic"] 
Hi PreProc g:_sgray None ["Bold"] 
Hi EnjinParameter spectral#mix(g:_sbrightgray,g:_sorange,0.4) None [] 
Hi EnjinLambdaParameter spectral#mix(g:_sbrightgray,g:_sred,0.4) None [] 
Hi EnjinLocalVar spectral#mix(g:_sbrightgray,g:_sgreen,0.4) None [] 
Hi EnjinEnum g:_senum None ["Bold"] 
Hi EnjinInterface g:_sinterface None ["Bold"] 
Hi EnjinAbstractClass g:_sabstract_class None ["Bold"] 
Hi EnjinField spectral#mix(g:_sbrightgray,g:_syellow,0.4) 
Hi EnjinTypeParameter g:_sred None ["Bold"] 
Hi EnjinCatchVar g:_sred
Hi EnjinForVar g:_sred
Hi EnjinEnhancedForVar g:_sred
Hi Directory g:_sblue None ["Bold"] 
Hi PMenu g:_snormal spectral#brighter(g:_sbackground,1.3) 
Hi UnderCursor None spectral#brighter(g:_sbackground,2) 
Hi CursorLine None spectral#brighter(g:_sbackground,2) 
Hi Search None spectral#brighter(g:_sbackground,3) 
Hi IncSearch None spectral#brighter(g:_sbackground,3) 
Hi Visual g:_sbackground g:_snormal 
Hi javaImportPackage g:_sgray 
Hi SpellBad None None #ff834a ["Undercurl"]
Hi Operator g:_sred None ["Bold"] 
Hi Number #dbff00 
Hi PreProcEnjinEnum spectral#mix(g:_senum,g:_sbrightgray,0.6) None ["Bold"] 
Hi PreProcEnjinClass spectral#mix(g:_stype,g:_sbrightgray,0.6) None ["Bold"] 
Hi PreProcEnjinInterface spectral#mix(g:_sinterface,g:_sbrightgray,0.6) None ["Bold"] 
Hi PreProcEnjinAbstractClass spectral#mix(g:_sabstract_class,g:_sbrightgray,0.6) None ["Bold"] 
Hi PreProcEnjinConstant spectral#mix(g:_sgray,g:_sbrightgray,0.6) None ["Bold"] 
Hi PreProcEnjinFunction spectral#mix(g:_syellow,g:_sbrightgray,0.6) 
Hi DiagnosticSignWarn g:_sgold None ["None"] 
Hi DiagnosticSignError #d52a2f None ["None"] 
Hi DiagnosticVirtualTextWarn g:_sgold spectral#brighter(g:_sbackground,0.7) ["None"] 
Hi DiagnosticVirtualTextError #d52a2f spectral#brighter(g:_sbackground,0.7) ["None"] 
Hi DiagnosticUnderlineWarn None None #ffaf00 ["undercurl"]
Hi DiagnosticUnderlineError None None #ff0a00 ["undercurl"]
Hi LineNr spectral#desaturate(g:_syellow,0.2) g:_ssigncol ["Bold"] 
Hi ColorColumn g:_ssigncol None 
Hi SignColumn g:_ssigncol g:_ssigncol 
Hi NonText g:_sred g:_ssigncol ["Bold","Italic"] 
Hi VertSplit g:_svertsplit g:_svertsplit ["Bold","Italic"] 
Hi TabLineFill g:_ssigncol g:_ssigncol 
Hi TabLine g:_snormal spectral#brighter(g:_ssigncol,1.3) 
Hi TabLineSel g:_sred g:_sbackground g:_sgreen ["Bold"] 

call spectral#Finish()

if &background == "dark"
  let g:terminal_color_0="#282828"
  let g:terminal_color_1="#cc241d"
  let g:terminal_color_2="#98971a"
  let g:terminal_color_3="#d79921"
  let g:terminal_color_4="#458588"
  let g:terminal_color_5="#b16286"
  let g:terminal_color_6="#689d6a"
  let g:terminal_color_7="#a89984"
  let g:terminal_color_8="#928374"
  let g:terminal_color_9="#fb4934"
  let g:terminal_color_10="#b8bb26"
  let g:terminal_color_11="#fabd2f"
  let g:terminal_color_12="#83a598"
  let g:terminal_color_13="#d3869b"
  let g:terminal_color_14="#8ec07c"
  let g:terminal_color_15="#ebdbb2"
else
  let g:terminal_color_0="#dedede"
  let g:terminal_color_1="#df3c2f"
  let g:terminal_color_2="#485300"
  let g:terminal_color_3="#5c3400"
  let g:terminal_color_4="#347073"
  let g:terminal_color_5="#9a4c71"
  let g:terminal_color_6="#215b2b"
  let g:terminal_color_7="#4e4431"
  let g:terminal_color_8="#65594b"
  let g:terminal_color_9="#b30005"
  let g:terminal_color_10="#2a3600"
  let g:terminal_color_11="#3f1b00"
  let g:terminal_color_12="#2a493e"
  let g:terminal_color_13="#712d44"
  let g:terminal_color_14="#003b00"
  let g:terminal_color_15="#1e1600"
endif

hi! link Constant PreProc
hi! link vimFunction Function
