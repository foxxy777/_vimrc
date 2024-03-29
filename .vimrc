set langmenu=en_US.UTF-8    " sets the language of the menu (gvim) 
 
set nocompatible 
source $VIMRUNTIME/vimrc_example.vim 
source $VIMRUNTIME/mswin.vim 
source $VIMRUNTIME/colors/desert.vim 
behave mswin 
 
:set showmatch 
:set matchtime=2  
set nu! 
set sw=4 
set ts=4 
set expandtab 

set noswapfile

set autoindent 
 
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 
set termencoding=utf-8 
set encoding=utf-8

set showmode
set t_Co=256
set  ruler 
set showmatch
set noswapfile
set undofile
set noerrorbells

syntax on 
filetype indent on 
 
set diffexpr=MyDiff() 
function MyDiff() 
  let opt = '-a --binary ' 
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif 
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif 
  let arg1 = v:fname_in 
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif 
  let arg2 = v:fname_new 
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif 
  let arg3 = v:fname_out 
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif 
  let eq = '' 
  if $VIMRUNTIME =~ ' ' 
    if &sh =~ '\<cmd' 
      let cmd = '""' . $VIMRUNTIME . '\diff"' 
      let eq = '"' 
    else 
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"' 
    endif 
  else 
    let cmd = $VIMRUNTIME . '\diff' 
  endif 
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq 
endfunction 
 
