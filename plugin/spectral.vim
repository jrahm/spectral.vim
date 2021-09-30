augroup SpectralHighlight
  au!
  au TextChanged */spectral.vim/colors/*.vim call spectral#highlight#highlightLine()
  au InsertLeave */spectral.vim/colors/*.vim call spectral#highlight#highlightLine()
  au BufRead */spectral.vim/colors/*.vim call spectral#highlight#clearCache()
  au BufRead */spectral.vim/colors/*.vim call spectral#highlight#highlight()
  au ColorScheme */spectral.vim/colors/*.vim call spectral#highlight#clearCache()
  au Syntax */spectral.vim/colors/*.vim call spectral#highlight#clearCache()
augroup END
