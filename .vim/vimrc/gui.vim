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

function! MyStatusLine(mode)
    let statusline=""
    if a:mode == 'Enter'
        let statusline.="%#StatColor#"
    endif
    let statusline.="\(%n\)\ %f\ "
    if a:mode == 'Enter'
        let statusline.="%*"
    endif
    let statusline.="%#Modified#%m"
    if a:mode == 'Leave'
        let statusline.="%*%r"
    elseif a:mode == 'Enter'
        let statusline.="%r%*"
    endif
    let statusline .= "\ (%l/%L,\ %c)\ %P%=%h%w\ %y\ [%{&encoding}:%{&fileformat}]\ \ "
    return statusline
endfunction

au WinEnter * setlocal statusline=%!MyStatusLine('Enter')
au WinLeave * setlocal statusline=%!MyStatusLine('Leave')
set statusline=%!MyStatusLine('Enter')

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi StatColor guibg=orange ctermbg=lightred
  elseif a:mode == 'r'
    hi StatColor guibg=#e454ba ctermbg=magenta
  elseif a:mode == 'v'
    hi StatColor guibg=#e454ba ctermbg=magenta
  else
    hi StatColor guibg=red ctermbg=red
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi StatColor guibg=#95e454 guifg=black ctermbg=lightgreen ctermfg=black

set cursorline
hi CursorLine gui=none guibg=#333333
hi Cursor guifg=white guibg=#FC583F

hi Visual guibg=#440000

" Highlight Extra White Space
highlight SpecialKey ctermbg=lightblue guifg=#ffc000 guibg=#6e00b7

" Highlight all occurances of the currently selected word
au CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
