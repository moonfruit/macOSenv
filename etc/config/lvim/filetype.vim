if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
	au! BufNewFile,BufRead *.pc,*.sqc setf esqlc
	au! BufNewFile,BufRead *.pom setf xml
augroup END
