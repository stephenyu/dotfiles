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

    " Blindmode
    let &guifont = "Droid Sans Mono 9"
endif

" Pimping Status Bar?
hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black
hi Modified guibg=orange guifg=black ctermbg=lightred ctermfg=black

set cursorline
hi CursorLine gui=none guibg=#333333
hi Cursor guifg=white guibg=#FC583F

hi Visual guibg=#440000

" Highlight Extra White Space
highlight SpecialKey ctermbg=lightblue guifg=#ffc000 guibg=#6e00b7

" Highlight all occurances of the currently selected word
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
