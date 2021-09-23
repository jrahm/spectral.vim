
if !exists('g:spectral_colorscheme_file')
  let g:spectral_colorscheme_file = expand('<sfile>')
endif

let g:spectral_parameters = {'default_bg': 'light'}

if spectral#StartCompile()
  finish
endif

Hi Normal      #2a1a12 #f5ead0 ["None"]
Hi SignColumn  #2a1a12 #e5dac0 ["None"]
Hi NonText     #2a1a12 #e5dad0 ["bold"]

Hi StorageClass #931d80 None    ["None"]
Hi Structure    #dd5050 None    ["None"]
Hi String       #4f7a40 None    ["None"]
Hi Type         #2c2c5c None    ["None"]
Hi Statement    #8c2f10 None    ["None"]
Hi ColorColumn  #8080dd None    ["None"] 
Hi PreProc      #735a65 None    ["None"]
Hi Function     #1a2d4b None    ["None"]
Hi Identifier   #1a2d4b None    ["None"]
Hi Number       #b32da0 None    ["None"]
Hi Comment      #313167 None    ["None"]
Hi Directory    #542db3 None    ["None"]

Hi PreProcEnjinInterface #483e60 None ["None"]
Hi PreProcEnjinEnum      #483e60 None ["None"]

call spectral#Finish()

hi link vimFunction Function
hi link PreProcEnjinAnnotation PreProcEnjinInterface
