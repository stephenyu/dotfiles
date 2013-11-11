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

else " Terminal Based"
  " Enabled 256 Colours
  " It's the fucking 21st Century, how can *you* not be using a 256 Terminal?
  set t_Co=256

  colorscheme wombat256mod

  " Background Colour for the Line Numbers
  hi LineNr ctermfg=226 ctermbg=234

  hi IndentGuidesOdd  ctermbg=black
  hi IndentGuidesEven ctermbg=darkgrey
endif

set background=dark

" Both these commands are pretty slow, so in the meantime, they have been
" disabled.
"
"Highlight all occurrences of the currently selected word
"au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
""
" Highlight the Line Cursor is current on
"hi CursorLine ctermbg=234 guibg=#333333

" Highlight Extra White Space
highlight SpecialKey ctermbg=57 ctermfg=227 guifg=#ffc000 guibg=#6e00b7

" Visual Selection
hi Visual ctermbg=234 guibg=#440000

" Cursor Color - White Text, Reddish Block"
"hi Cursor ctermbg=124 ctermfg=white guifg=white guibg=#fc583f

" No Background Colour for Normal Text
hi Normal ctermbg=black ctermfg=white
