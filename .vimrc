"VIMIDE vimrc basic settings
"--------start---------
set fileencodings=ucs-bom,utf-8,cp936
set helplang=cn

set shiftwidth=2
set tabstop=2
set expandtab
set nobackup
set noswapfile
set nowb
set backspace=start,indent,eol
set nu!
set autoindent
set smartindent
set wrap

set noerrorbells
set novisualbell

filetype plugin on
filetype indent on

map <C-n> :NERDTree<cr>
map <C-m> :TlistToggle<cr>
"vmap <C-c> "+y
"let mapleader = ","  
"let g:mapleader = ","  
"map Y "+y  
"map P "+p  

"--------end--------

"VIMIDE gvimrc basic settings
set mouse=a

""""""""""""""""""""""

let Tlist_Ctags_Cmd='/usr/bin/ctags'


  let g:miniBufExplMapWindowNavVim = 1 
  let g:miniBufExplMapWindowNavArrows = 1 
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1


inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 


"--------hanliu customized---------
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside Vim
set autowrite                   " write a modified buffer on each :next , ...
set backspace=indent,eol,start  " backspacing over everything in insert mode
"set backup                      " keep a backup file
set browsedir=current           " which directory to use for the file browser
"set complete+=k                 " scan the files given with the 'dictionary' option
set history=5000                  " keep 50 lines of command line history
set hlsearch                    " highlightthe last used search pattern
set incsearch                   " do incremental searching
set nowrap                      " do not wrap lines
set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set rulerformat=%20(%2*%<%f%=\ %m%r\ %3l\ %c\ %p%%%) 
set shiftwidth=2                " number of spaces to use for each step of indent
set showcmd                     " display incomplete commands
set smartindent                 " smart autoindenting when starting a new line
set tabstop=2                   " number of spaces that a <Tab> counts for
set visualbell                  " visual bell instead of beeping
set number
set noerrorbells                " 不让vim发出讨厌的滴滴声 
set fillchars=vert:\ ,stl:\ ,stlnc:\ " 在被分割的窗口间显示空白，便于阅读 
set selection=exclusive
set selectmode=mouse,key 
set statusline=%F%m%r%h%w\[POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")} 

highlight StatusLine guifg=SlateBlue guibg=Yellow 
highlight StatusLineNC guifg=Gray guibg=White 
highlight MatchParen ctermbg=blue guibg=lightyellow
set fenc=utf-8 

syntax enable 
syntax on 

set clipboard=unnamed

set t_Co=256
"colorscheme murphy 
colorscheme desert
"colorscheme darkblue
"colorscheme torte
"colorscheme calmar256-dark


set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set t_Co=256
let g:Powerline_symbols = 'fancy'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" CTags's settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"let Tlist_Sort_Type = "name" 
"let Tlist_Use_Right_Window = 1 
"let Tlist_Compart_Format = 1 
"let Tlist_Exist_OnlyWindow = 1 
"let Tlist_File_Fold_Auto_Close = 0 
"let Tlist_Enable_Fold_Column = 0 
"let Tlist_Show_One_File=1
"let Tlist_Exit_OnlyWindow=1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" miniBufExplore's settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
let g:miniBufExplMapWindowNavVim = 1 
let g:miniBufExplMapWindowNavArrows = 1 
let g:miniBufExplMapCTabSwitchBufs = 1 
let g:miniBufExplModSelTarget = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"
" Cscope's settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
if has("cscope")

  """"""""""""" Standard cscope/vim boilerplate
  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag
  " check cscope for definition of a symbol before checking ctags: set to 1
  " if you want the reverse search order.
  set csto=0
  " add any cscope database in current directory
  if filereadable("cscope.out")
      cs add cscope.out  
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  " show msg when any other cscope db added
  set cscopeverbose  


  """"""""""""" My cscope/vim key mappings
  "
  " The following maps all invoke one of the following cscope search types:
  "
  "   's'   symbol: find all references to the token under cursor
  "   'g'   global: find global definition(s) of the token under cursor
  "   'c'   calls:  find all calls to the function name under cursor
  "   't'   text:   find all instances of the text under cursor
  "   'e'   egrep:  egrep search for the word under cursor
  "   'f'   file:   open the filename under cursor
  "   'i'   includes: find files that include the filename under cursor
  "   'd'   called: find functions that function under cursor calls
  "
  " Below are three sets of the maps: one set that just jumps to your
  " search result, one that splits the existing vim window horizontally and
  " diplays your search result in the new window, and one that does the same
  " thing, but does a vertical split instead (vim 6 only).
  "
  " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
  " unlikely that you need their default mappings (CTRL-\'s default use is
  " as part of CTRL-\ CTRL-N typemap, which basically just does the same
  " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
  " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
  " of these maps to use other keys.  One likely candidate is 'CTRL-_'
  " (which also maps to CTRL-/, which is easier to type).  By default it is
  " used to switch between Hebrew and English keyboard mode.
  "
  " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
  " that searches over '#include <time.h>" return only references to
  " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
  " files that contain 'time.h' as part of their name).


  " To do the first type of search, hit 'CTRL-\', followed by one of the
  " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
  " search will be displayed in the current window.  You can use CTRL-T to
  " go back to where you were before the search.  
  "

  "nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
  "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
  "nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


  " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
  " makes the vim window split horizontally, with search result displayed in
  " the new window.
  "
  " (Note: earlier versions of vim may not have the :scs command, but it
  " can be simulated roughly via:
  "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

  "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
  "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
  "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


  " Hitting CTRL-space *twice* before the search type does a vertical 
  " split instead of a horizontal one (vim 6 and up only)
  "
  " (Note: you may wish to put a 'set splitright' in your .vimrc
  " if you prefer the new window on the right instead of the left

  "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
  "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
  "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

  nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
  nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
  nmap <C-@>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
  nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


  """"""""""""" key map timeouts
  "
  " By default Vim will only wait 1 second for each keystroke in a mapping.
  " You may find that too short with the above typemaps.  If so, you should
  " either turn off mapping timeouts via 'notimeout'.
  "
  "set notimeout 
  "
  " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
  " with your own personal favorite value (in milliseconds):
  "
  "set timeoutlen=4000
  "
  " Either way, since mapping timeout settings by default also set the
  " timeouts for multicharacter 'keys codes' (like <F1>), you should also
  " set ttimeout and ttimeoutlen: otherwise, you will experience strange
  " delays as vim waits for a keystroke after you hit ESC (it will be
  " waiting to see if the ESC is actually part of a key code like <F1>).
  "
  "set ttimeout 
  "
  " personally, I find a tenth of a second to work well for key code
  " timeouts. If you experience problems and have a slow terminal or network
  " connection, set it higher.  If you don't set ttimeoutlen, the value for
  " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
  "
  "set ttimeoutlen=100


endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"
" CCTree's settings
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 

"here I close automatically DB load for cscope, because there will be 
"serveral DBs in my disk and I need to switch between them;
"let g:CCTreeCscopeDb = "cscope.out"
let g:CCTreeRecursiveDepeth = -1
let g:CCTreeMinVisibleDepth = 3
let g:CCTreeOrientation = "leftabove"

let g:CCTreeDisplayMode = 3     " 当设置为垂直显示时, 模式为3最合适. (1-minimum width, 2-little space, 3-witde)
let g:CCTreeWindowVertical = 0  " 水平分割,垂直显示
let g:CCTreeWindowMinWidth = 40 " 最小窗口
let g:CCTreeUseUTF8Symbols = 1  "为了在终端模式下显示符号

let g:CCTreeKeyTraceForwardTree = '<C-\>>'
let g:CCTreeKeyTraceReverseTree = '<C-\><'
let g:CCTreeKeyHilightTree = '<C-l>'        " Static highlighting
let g:CCTreeKeySaveWindow = '<C-\>y'
let g:CCTreeKeyToggleWindow = '<C-\>w'
let g:CCTreeKeyCompressTree = 'zs'     " Compress call-tree
let g:CCTreeKeyDepthPlus = '<C-\>='
let g:CCTreeKeyDepthMinus = '<C-\>-'











"--------------end(of hanliu customized)------------

