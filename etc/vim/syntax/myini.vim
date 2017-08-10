" Vim syntax file
" Language:	My INI

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
	syntax clear
elseif exists("b:current_syntax")
	finish
endif

" Read the dosini syntax to start with
if version < 600
	source <sfile>:p:h/dosini.vim
else
	runtime! syntax/dosini.vim
endif

" My INI extentions

syn match	myiniMacro		"\$([^)]*)"
syn match	myiniFunction	"@[^\. \t]*" contains=myiniMacro containedin=dosiniLabel

syn match	myiniExt		"[&%]{[^}]*}"
syn match	myiniExt2		"<.*>{[^}]*}" contains=myiniMacro,myiniExt3
syn match	myiniExt3		"<.*>"ms=s+1,me=e-1 contained

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_myini_syntax_inits")
	if version < 508
		let did_myini_syntax_inits = 1
		command -nargs=+ HiLink hi link <args>
	else
		command -nargs=+ HiLink hi def link <args>
	endif

	HiLink myiniComment		Comment
	HiLink myiniMacro		Macro
	HiLink myiniFunction	Keyword

	HiLink myiniExt			Constant
	HiLink myiniExt2		Constant
	HiLink myiniExt3		Statement

	delcommand HiLink
endif

let b:current_syntax = "myini"
