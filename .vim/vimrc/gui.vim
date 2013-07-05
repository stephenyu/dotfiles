" Color Scheme
if has("gui_running")
  "    colorscheme mayansmoke
  colorscheme wombat

  " Hack to Remove Scrollbars
  set guioptions+=LlRrbh
  set guioptions-=LlRrbh

  " Always Show Tabbar, because it's fucked
  set stal=2

  set guioptions-=m  "remove menu bar
  set guioptions-=T  "remove toolbar

  " Non GUI Tabs
  set go-=e

  " Display Filename within Tab Headerset cursorcolumn
  set guitablabel=%t
endif

if has("gui_running")
  if has("gui_gtk2")
    set guifont=inhere
  elseif has("gui_win32")
    set guifont=ffs
  endif
endif

set cursorline
hi CursorLine gui=none guibg=#333333
hi Cursor guifg=white guibg=#FC583F

hi Visual guibg=#440000

" Highlight Extra White Space
highlight SpecialKey ctermbg=lightblue guifg=#ffc000 guibg=#6e00b7

"Highlight all occurances of the currently selected word
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
