
if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

let g:spectral_parameters = {
      \ 'default_bg': 'dark',
      \ 'flip_algorithm': 'sqrt'}

let g:_syellow = '#f0e778'
let g:_syellowgreen = '#a8f078'
let g:_sgreen = '#76ec9e'
let g:_sbluegreen = '#73e6cd'
let g:_sblue = '#72d9e3'
let g:_sbluepurple = '#719ae2'
let g:_sred = '#ec8b76'
let g:_sviolet = '#ec76e8'

let g:_steal = '#76ece9'
let g:_sorange = '#ecb976'


let g:_snormal = '#e8e8d3'
let g:_sbackground = '#1e1e1e'
let g:_slightbg = '#fbf1d7'

call spectral#StartCompile()

let g:_snontext = spectral#brighter(g:_sbackground,0.5)
let g:_svertsplit = spectral#brighter(g:_sbackground,0.4)
let g:_ssigncol = spectral#brighter(g:_sbackground,0.5)
let g:_snrcol = spectral#brighter(g:_sbackground,0.7)
let g:_sgray = spectral#brighter(g:_sbackground,5)
let g:_slightgray = spectral#brighter(g:_sgray,1.5)

let g:_slightbgbase = g:_sbackground
let g:_slightnontext = spectral#brighter(g:_slightbgbase,0.5)
let g:_slightvertsplit = spectral#brighter(g:_slightbgbase,0.4)
let g:_slightsigncol = spectral#brighter(g:_slightbgbase,0.5)
let g:_slightnrcol = spectral#brighter(g:_slightbgbase,0.7)
let g:_slightgray = spectral#brighter(g:_slightbgbase,5)

HiDark Normal      g:_snormal g:_sbackground ["None"]
HiLight Normal      #444635 g:_slightbg ["None"]

Hi SignColumn  g:_snormal g:_ssigncol ["None"]

Hi StorageClass g:_syellow None    ["bold"]
Hi Structure    g:_syellowgreen None    ["bold"]
Hi String       g:_sgreen None    ["bold"]
Hi Type         g:_sbluepurple None    ["bold"]
Hi Statement    g:_sblue None    ["bold"]
Hi ColorColumn  spectral#brighter(g:_sbackground,2) None    ["None"] 
Hi PreProc      g:_sviolet None    ["bold"]
Hi Function     g:_sred None    ["bold"]
Hi Identifier   g:_syellow None    ["bold"]
Hi Number       g:_steal None    ["bold"]
Hi Comment      g:_sgray None    ["Italic"]
Hi Directory    g:_syellow None    ["None"]
Hi Constant     g:_sred None ["Bold"]
Hi Specialcomment g:_slightgray None ["Bold"]
Hi Operator g:_sred

Hi Visual      g:_sbackground g:_sred

Hi LineNrAbove g:_sblue g:_snrcol ["bold"]
Hi LineNrBelow g:_sred g:_snrcol ["bold"]
Hi LineNr g:_syellow g:_snrcol ["bold"]
Hi CursorLineNr g:_syellow g:_snrcol ["inverse","bold"]
Hi NonText     g:_sred g:_snontext ["bold"]

HiDark VertSplit g:_svertsplit g:_svertsplit
HiDark TabLineFill None g:_svertsplit
HiDark TabLine None g:_snontext ["bold"]
HiDark StatusLine g:_sred g:_svertsplit
HiDark StatusLineNC g:_snormal g:_svertsplit

HiLight VertSplit g:_slightvertsplit g:_slightvertsplit
HiLight TabLineFill None g:_slightvertsplit
HiLight TabLine None g:_slightnontext ["bold"]
HiLight StatusLine g:_sred g:_slightvertsplit
HiLight StatusLineNC g:_snormal g:_slightvertsplit

Hi Spellbad None None g:_sred ["undercurl"]

Hi Search g:_syellow None ["Inverse"]
Hi SearchInc g:_sblue None ["Inverse"]

call spectral#Finish()

hi link vimFunction Function
hi link PreProcEnjinAnnotation PreProcEnjinInterface
