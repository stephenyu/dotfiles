
if has("gui_macvim")
  let mapleader='`'  " MacVim
else
  let s:uname = system("uname")
  if s:uname == "Darwin\n"
    let mapleader='`'  " Mac Terminal
  else
    let mapleader='\' " Everything Else
  endif
endif
