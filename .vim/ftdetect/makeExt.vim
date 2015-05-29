" This sets up *.makeExt files to be used to recognize the .gmk .cfg type files
" $Id: makeExt.vim 2015-04-23 14:34 hanliu@Gemalto-M2M $
au BufNewFile,BufRead *.gmk			setf make 
au BufNewFile,BufRead *.cfg			setf make 
au BufNewFile,BufRead *.mak			setf make 
au BufNewFile,BufRead *.make			setf make 
