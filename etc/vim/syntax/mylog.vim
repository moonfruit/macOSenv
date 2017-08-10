" Vim syntax file
" Language:	My Log

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

syn match	myLogError		".*\[ERROR\].*\(\n.*\)\{-}\n\["me=e-1
syn match	myLogWarning	".*\[WARNING\].*\(\n.*\)\{-}\n\["me=e-1
syn match	myLogNormal		".*\[NORMAL\].*\(\n.*\)\{-}\n\["me=e-1
syn match	myLogDebug		".*\[DEBUG\].*\(\n.*\)\{-}\n\["me=e-1
syn match	myLogTrace		".*\[TRACE\].*\(\n.*\)\{-}\n\["me=e-1

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_mylog_syntax_inits")
	if version < 508
		let did_mylog_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink mylogError	Special
	HiLink mylogWarning	Statement
	HiLink mylogNormal	PreProc
	HiLink mylogDebug	Constant
"	HiLink mylogTrace	Comment

	delcommand HiLink
endif

let b:current_syntax = "mylog"
