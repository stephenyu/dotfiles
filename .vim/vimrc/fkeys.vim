" F6 Toggles Relative Numbers and Absolute Numbers
function! NumberToggle()
	if(&relativenumber == 1)
		set number
	else
		set relativenumber
	endif
endfunc

nnoremap <F6> :call NumberToggle()<cr>
