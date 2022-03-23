if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
	au! BufNewFile,BufRead *.pc,*.sqc setf esqlc
augroup END
