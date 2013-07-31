" Color Scheme
if has("gui_running")

  if has("gui_gtk2")
    set guifont=Anonymous\ Pro\ 12
  endif

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

  " Display Filename within Tab Headerset cursorcolumn set guitablabel=%t

  " Highlight the Line Cursor is current on
  set cursorline
  hi CursorLine gui=none guibg=#333333

  " Visual Selection
  hi Visual guibg=#440000

  " Highlight Extra White Space
  highlight SpecialKey ctermbg=lightblue guifg=#ffc000 guibg=#6e00b7

  "Highlight all occurrences of the currently selected word
  au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
else " Terminal Based"
  " Enabled 256 Colours
  " It's the fucking 21st Century, how can *you* not be using a 256 Terminal?
  set t_Co=256

  colorscheme wombat256mod

  " No Background Colour for Normal Text
  hi Normal ctermbg=NONE

  " Background Colour for the Line Numbers
  hi LineNr ctermfg=226 ctermbg=234

  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey

  " Visual Selection
  hi Visual ctermbg=58
endif

" Cursor Color - White Text, Reddish Block"
hi Cursor ctermbg=59 guifg=white guibg=#fc583f
