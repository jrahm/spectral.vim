if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

if !exists('g:spectral_parameters')
  let g:spectral_parameters = {
        \ 'default_bg': 'dark',
        \ 'filter_fg': [spectral#normalize([1, 0, 0], 1),
        \               spectral#normalize([0, 1, 0], 1),
        \               spectral#normalize([0, 0, 1], 1)],
        \ 'flip_algorithm': "2/3"}
endif

call spectral#StartCompile()

let g:_sblue1 = '#80a0ff'
let g:_scomment = '#8ba3bb'
let g:_snormal = '#d8e5b8'
let g:_sbackground = '#1e1d1c'

Hi HtmlItalic g:_snormal None None ["Italic"]
Hi HtmlBold g:_snormal None None ["Bold"]
Hi Blue1 g:_sblue1 None None []
Hi ColorColumn #4d5c8b None None []
Hi Comment g:_scomment  None None []
Hi Conceal spectral#brighter(g:_sbackground,3)
Hi CursorColumn None #313030 None []
Hi CursorLine None #313030 None []
Hi CursorLineNr #ff5d34 #272424 None []
Hi DarkGray #404040 None None []
Hi DarkTeal #346063 None None []
Hi DiffAdd None #1e2d1c None []
Hi DiffChange None #3e3d1c None []
Hi DiffDelete #af0000 #3e1d1c None ["bold"]
Hi DiffText None #4e7d3c None []
Hi Directory g:_sblue1 None None ["bold"]
Hi Error #ff0000 #1a1818 None []
Hi Fern1 #71bc78 None None []
Hi FoldColumn #80ab24 #1a1818 None []
Hi FoldColumn1 #80a84f #1a1818 None []
Hi FoldColumn2 #80a67b #1a1818 None []
Hi FoldColumn3 #80a4a7 #1a1818 None []
Hi FoldColumn4 #80a2d3 #1a1818 None []
Hi FoldColumn5 g:_sblue1 #1a1818 None []
Hi FoldColumn6 #9992d6 #1a1818 None []
Hi FoldColumn7 #b285ad #1a1818 None []
Hi FoldColumn8 #cc7785 #1a1818 None []
Hi FoldColumn9 #e56a5c #1a1818 None []
Hi Folded #000000 #9f9a84 None []
Hi Function #aba024 None None []
Hi FunctionPreProc #9fa456 None None []
Hi Green1 #80ab24 None None []
Hi Green2 #3dab24 None None []
Hi Green3 #aba024 None None []
Hi IncSearch #ff5d34 #000000 None ["inverse","reverse"]
Hi LineNr #9f9a84 #1a1818 None ["bold"]
Hi MatchParen None #346063 None ["bold"]
Hi NonText g:_sblue1 #272424 None ["bold"]
Hi Normal g:_snormal g:_sbackground None []
Hi Orange1 #ff892f None None []
Hi Orange2 #ffbd2f None None []
Hi Orange3 #ff552f None None []
Hi Orange4 #ffb780 None None []
Hi Orange5 #ffd780 None None []
Hi Orange6 #ff9780 None None []
Hi PMenu #686060 #101010 None []
Hi PMenuSel #ff5d34 #343030 None ["bold"]
Hi Red1 #ff5d34 None None []
Hi Red1PreProc #c0895c None None []
Hi Red2 #ff8f34 None None []
Hi Red2PreProc #c09d5c None None []
Hi Red3 #ff3448 None None []
Hi Red3PreProc #c07864 None None []
Hi Red4 #ffa034 None None []
Hi Red4PreProc #c0a45c None None []
Hi Red5 #ff9074 None None []
Hi Red5PreProc #c09d76 None None []
Hi Red6 #ff74f4 None None []
Hi Red6PreProc #c092a9 None None []
Hi Royal #f02690 None None []
Hi Sage1 #9f9a84 None None []
Hi Sage2 #8e9f84 None None []
Hi Sage3 #96a677 None None []
Hi Sage3Mix g:_scomment None None []
Hi Search #ffd780 #000000 None ["inverse","reverse"]
Hi SignColumn None #1a1818 None []
Hi SpellBad None None #b67632 ["undercurl"]
Hi Statement g:_sblue1 None None ["bold"]
Hi StatusLine #ff5d34 #0f0e0e None ["bold"]
Hi StatusLineNC #686060 #0f0e0e None ["bold"]
Hi StorageClass #ff5d34 None None ["bold"]
Hi String #80ab24 None None []
Hi TabLine #686060 #444040 None ["bold"]
Hi TabLineFill #686060 #0f0e0e None []
Hi TabLineSel #ff5d34 #1e1d1c g:_sblue1 ["bold"]
Hi Teal1 #34ffd6 None None []
Hi Title #ff8f34 #444040 None ["bold"]
Hi VertSplit #0f0e0e #0f0e0e None []
Hi Visual #101010 #e0e0e0 None []
Hi WarmSage #a09598 None None []
Hi Warning #ffff00 #1a1818 None []
Hi Yellow1 #e0bf65 None None []
Hi Yellow1PreProc #b4b070 None None []
Hi javaError #dd0000 None None []
Hi javaParen g:_sblue1 None None ["bold"]

call spectral#Finish()

" if &bg == 'light'
"   hi Normal guifg=#0a1900 ctermfg=233 guibg=#ffffe1 ctermbg=255 gui=NONE cterm=NONE
" endif

hi! link LiteralTab Warning
hi! link Constant PreProc
hi! link Identifier Orange4
hi! link Number Constant
hi! link Operator Blue1
hi! link PreProc Sage3
hi! link RadiationCppEnum Type
hi! link RadiationCppNamespace Sage2
hi! link RadiationCppStruct Type
hi! link RadiationCppTypedef RadiationProtoType
hi! link RadiationCppUnion Type
hi! link RadiationJavaAbstractClass Red4
hi! link RadiationJavaClass Type
hi! link RadiationJavaConstant Constant
hi! link RadiationJavaEnhancedForIterator RadiationJavaForIterator
hi! link RadiationJavaForIterator Sage3Mix
hi! link RadiationJavaFunction Function
hi! link RadiationJavaInterface RadiationProtoType
hi! link RadiationJavaLambdaParam Royal
hi! link RadiationJavaLocalVar Sage2
hi! link RadiationJavaMember Yellow1
hi! link RadiationJavaParam Orange3
hi! link RadiationJavaTypeParameter Red6
hi! link RadiationProtoType Red5
hi! link Special Orange2
hi! link SpecialKey Blue1
hi! link Structure Red1
hi! link TagbarAccessPrivate Red1
hi! link TagbarAccessProtected Yellow1
hi! link TagbarAccessPublic Green1
hi! link Type Red2
hi! link htmlEndTag Blue2
hi! link htmlTag Blue2
hi! link htmlTagName Blue1
hi! link javaAnnotation PreProc
hi! link javaCodedoc WarmSage
hi! link javaCommentTitle Blue1
hi! link javaDocComment Comment
hi! link javaDocTags Orange6
hi! link javaOperator Operator
hi! link xmlAttrib Green3
hi! link xmlEndTag Red1
hi! link xmlTag Blue1

hi! link EnjinAbstractClass Red4
hi! link EnjinClass Type
hi! link EnjinEnum EnjinClass
hi! link EnjinConstant Constant
hi! link EnjinEnhancedForVar RadiationJavaForIterator
hi! link EnjinBasicForVar Sage3Mix
hi! link EnjinFunction Function
hi! link EnjinInterface RadiationProtoType
hi! link EnjinLambdaParameter Royal
hi! link EnjinLocalVar Sage2
hi! link EnjinField Yellow1
hi! link EnjinParameter Orange3
hi! link EnjinTypeParameter Red6
hi! link EnjinCatchVar EnjinBasicForVar
hi! link EnjinAnnotation EnjinInterface
hi! link EnjinTryVar EnjinCatchVar

hi! link PreProcEnjinAbstractClass PreProcRed4
hi! link PreProcEnjinClass Red2PreProc
hi! link PreProcEnjinEnum PreProcEnjinClass
hi! link PreProcEnjinConstant Yellow1PreProc
hi! link PreProcEnjinEnhancedForVar RadiationJavaForIterator
hi! link PreProcEnjinBasicForVar Sage3Mix
hi! link PreProcEnjinFunction FunctionPreProc
hi! link PreProcEnjinAnnotationElement FunctionPreProc
hi! link PreProcEnjinInterface Red5PreProc
hi! link PreProcEnjinLambdaParameter Royal
hi! link PreProcEnjinLocalVar Sage2
hi! link PreProcEnjinField Yellow1
hi! link PreProcEnjinParameter Orange3
hi! link PreProcEnjinTypeParameter Red6
hi! link PreProcEnjinCatchVar EnjinBasicForVar
hi! link PreProcEnjinAnnotation PreProcEnjinInterface
hi! link PreProcEnjinTryVar EnjinCatchVar

hi! link javaImportPackage Sage2
hi! link javaPackage Sage2
