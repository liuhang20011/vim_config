" This sets up *.javaExt files to be used to recognize the .jpp type
" files
" " $Id: javaExt.vim 2015-06-16 18:04 hanliu@Gemalto-M2M $
" .jpp file is a kind of special file, which is used in Sun/Oracle Java VM
" compile

au BufNewFile,BufRead *.jpp     setf java
