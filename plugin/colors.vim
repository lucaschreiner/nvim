let g:nvcode_termcolors=256

syntax on
colorscheme nvcode


if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
