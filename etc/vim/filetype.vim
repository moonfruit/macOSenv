if exists("did_load_filetypes")
  finish
endif
augroup filetypedetect
	au! BufNewFile,BufRead CMakeLists.txt,*.cmake setf cmake
	au! BufNewFile,BufRead *.pc setf esqlc
	au! BufNewFile,BufRead *.sqc setf esqlc
	au! BufNewFile,BufRead *.ec setf esqlc
	au! BufNewFile,BufRead *.ini setf myini
	au! BufNewFile,BufRead *.log setf mylog
augroup END
