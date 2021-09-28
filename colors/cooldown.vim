if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

if !exists('g:spectral_parameters')
  let g:spectral_parameters = {
        \ 'default_bg': 'dark',
        \ 'filter_fg': [spectral#normalize([1, 0, 0], 1),
        \               spectral#normalize([0, 1, 0], 1),
        \               spectral#normalize([0, 0, 1], 1)],
        \ 'flip_algorithm': 'sqrt'}
endif

let g:_snormal = "#fbdeff"
let g:_sbackground = "#202025"
let g:_svert = spectral#brighter(g:_sbackground, 2)
let g:_sstatement = "#50D28C"
let g:_stype = '#b7b0ff'
let g:_sabstract_class = spectral#mix(g:_stype,"#ff0000",0.1)
let g:_sinterface = spectral#mix(g:_stype,"#ff0000",0.2)
let g:_senum = spectral#mix(g:_stype,"#ff0000",0.3)
let g:_spreproc = spectral#brighter(g:_snormal,0.6)
let g:_sfunction = '#d9a7ff'
let g:_syellow1 = '#e4c692'
let g:_scodebg = spectral#brighter(g:_sbackground,2)

call spectral#StartCompile()

Hi Title g:_syellow1 None None ["Underline","Bold"]
Hi HtmlH2 g:_syellow1 None None ["Bold"]
Hi HtmlH3 g:_syellow1 None None ["Italic"]
Hi HtmlItalic g:_snormal None None ["Italic"]
Hi HtmlBold g:_snormal None None ["Bold"]
Hi HtmlUnderline g:_snormal None None ["Underline"]
Hi HtmlBoldItalic g:_snormal None None ["Bold","Italic"]
Hi markdownCodeBlock None g:_scodebg
Hi markdownCode None g:_scodebg
Hi Yellow1 g:_syellow1 None None []
Hi Blue2 #8fcf81 None None []
Hi Blue3 #ffc2b1 None None []
Hi Blue4 #fffbeb None None []
Hi ColorColumn g:_svert None None []
Hi Comment #96856a None None ["italic"]
Hi Conceal #fff0ff None None ["bold"]
Hi CursorColumn None #666666 None []
Hi CursorLine None #1d1e1e None []
Hi CursorLineNr #00557b #151717 None []
Hi DarkGray #8e8e8e None None []
Hi DarkTeal #ba928f None None []
Hi Directory #e4c692 None None ["bold"]
Hi Error #147d80 #767878 None []
Hi Fern1 #ffb0fd None None []
Hi Folded #6b6b6b #c9c7e1 None []
Hi Function g:_sfunction None None []
Hi Green1 #f299ff None None []
Hi Green2 #f57cff None None []
Hi Green3 #d9a7ff None None []
Hi IncSearch #7aa6d2 #6b6b6b None ["inverse","reverse"]
Hi javaError #147d80 None None []
Hi javaParen None None None []
Hi LineNr #7d7e96 #0e1010 None ["bold"]
Hi MatchParen None #008b8b None []
Hi NonText #9c7e25 #151717 None ["bold"]
Hi Normal g:_snormal g:_sbackground None []
Hi VertSplit g:_svert g:_svert
Hi Orange1 None None None []
Hi Orange2 #f1afff None None []
Hi Orange3 None None None []
Hi Orange4 None None None []
Hi Orange5 None None None []
Hi Orange6 None None None []
Hi PMenu None #ff00ff None []
Hi PMenuSel None #a9a9a9 None []
Hi Red1 #7aa6d2 None None []
Hi Red3 #499b89 None None []
Hi Red4 None None None []
Hi Red5 None None None []
Hi Red6 #7fc774 None None []
Hi Sage1 #c9c7e1 None None []
Hi Sage2 #dac1e1 None None []
Hi Sage3 #e1c1f9 None None []
Hi Sage3Mix None None None []
Hi Search #ffdeff #6b6b6b None ["inverse","reverse"]
Hi SignColumn None #0e1010 None []
Hi Statement g:_sstatement None None ["bold"]
Hi StatusLineNC #9da4a4 #727272 None ["bold"]
Hi StorageClass #7aa6d2 None None ["bold"]
Hi String #f299ff None None []
Hi Teal1 #ff8e71 None None []
Hi Visual #737373 #ffffff None []
Hi WarmSage #bfcbc7 None None []
Hi Warning None None None []
Hi Yellow1 #eeceff None None []
Hi PreProc g:_spreproc None ["Bold"]

Hi TabLineFill None g:_svert
Hi TabLineSel #ffffff g:_sbackground ["bold"]
Hi TabLine #808080 spectral#mix(g:_sbackground,g:_svert) []

Hi Type g:_stype
Hi EnjinAbstractClass g:_sabstract_class
Hi EnjinInterface g:_sinterface
Hi EnjinEnum g:_senum

Hi Pmenu None spectral#mix(g:_sbackground,'#000020',0.3)

Hi PreProcEnjinFunction spectral#mix(g:_sfunction,'#ffffff',0.3)
Hi PreProcEnjinClass spectral#mix(g:_stype,'#ffffff',0.3)
Hi PreProcEnjinAbstractClass spectral#mix(g:_sabstract_class,'#ffffff',0.3)
Hi PreProcEnjinInterface spectral#mix(g:_sinterface,'#ffffff',0.3)
Hi PreProcEnjinEnum spectral#mix(g:_senum,'#ffffff',0.3)
Hi PreProcEnjinAnnotation spectral#mix(g:_stype,'#ffffff',0.3)

let g:_sstatuslfg='#7aa6d2'
Hi StatusLine g:_sstatuslfg spectral#mix(g:_svert,'#0000ff',0.2) None ["bold"]
Hi StatusLineNC spectral#desaturate(g:_sstatuslfg,0.5) g:_svert None ["bold"]

call spectral#Finish()

hi! link TagbarAccessProtected Yellow1
hi! link FoldColumn Green1
hi! link RadiationJavaConstant Constant
hi! link xmlTag Yellow1
hi! link RadiationCppNamespace Sage2
hi! link RadiationJavaAbstractClass Red4
hi! link RadiationJavaFunction Function
hi! link javaDocTags Orange6
hi! link RadiationJavaTypeParameter Red6
hi! link javaAnnotation PreProc
hi! link htmlEndTag Blue2
hi! link javaCodedoc WarmSage
hi! link RadiationProtoType Red5
hi! link RadiationCppStruct Type
hi! link xmlAttrib Green3
hi! link RadiationJavaParam Orange3
hi! link RadiationJavaForIterator Sage3Mix
hi! link RadiationJavaMember Yellow1
hi! link Structure Red1
hi! link htmlTagName Yellow1
hi! link RadiationCppEnum Type
hi! link RadiationJavaLocalVar Sage2
hi! link TagbarAccessPublic Green1
hi! link xmlEndTag Red1
hi! link Identifier Orange4
hi! link javaOperator Operator
hi! link RadiationJavaEnhancedForIterator RadiationJavaForIterator
hi! link RadiationCppUnion Type
hi! link RadiationCppTypedef RadiationProtoType
hi! link javaCommentTitle Yellow1
hi! link Constant PreProc
hi! link SpecialKey Yellow1
hi! link Number Constant
hi! link javaDocComment Comment
hi! link TagbarAccessPrivate Red1
hi! link htmlTag Blue2
hi! link Operator Yellow1
hi! link RadiationJavaClass Type
hi! link RadiationJavaInterface RadiationProtoType
hi! link Special Orange2

call spectral#useDefaultTerminalColors()
