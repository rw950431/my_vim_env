highlight Comment ctermfg=Blue
highlight Constant ctermfg=Red
filetype plugin on
set shiftwidth=4
" Minibuffer Explorer Settings
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
" This one makes Control+Arrow shuffle between tabs
"let g:miniBufExplMapWindowNavArrows = 1
" This one makes Control+hjkl shuffle between tabs
"let g:miniBufExplMapWindowNavVim = 1
" Control+Tab steps between buffers
"let g:miniBufExplMapCTabSwitchBufs = 1

if has("autocmd")
"allows one to do :Perldoc on a perl module and see the docs
" au FileType perl source ~/.vim/ftplugin/perl_doc.vim
"force :Tlist to use a horizontal split for faster scrolling
 autocmd BufRead * let Tlist_Use_Horiz_Window = 1
"ptags.pl makes a tags file that includes all the 'require' and 'use' files
"so one can control+] and jump to subroutine definitions in other files
 autocmd vimenter *.pl,*.pm !  $HOME/.vim/ptags.pl %
"cleanup tags file on exit
 autocmd vimleavePre *.pl,*.pm,*.c ! test -f tags && rm -f tags
"makes a tags file that includes all the #include-d header files
"works with Exuberant Ctags 5.2.2, gcc 2.96
 autocmd vimenter *.c !  gcc -M % | perl -e '$/="\\\n"; while (<>) { chomp; map {print "$_\n" unless $_=~/:$/;} split; }' | ctags -L-
"remaps shift+k from 'man' to 'perldoc -f' in perl scripts
 autocmd BufEnter *.pl,*.pm,*.cgi let oldkp=&kp | set keywordprg=perl\ -e\ '$c=shift;exec\ \"perldoc\".($c=~/^[a-z]+$/?\"\ -f\ \":\"\ \").$c'
 autocmd BufLeave *.pl,*.pm,*.cgi let &keywordprg=oldkp
"vimf.pl processes output of perl -cwT into format that can be used with vim :ma :cn,:cp,:cc
 autocmd BufRead *.pl,*.pm set makeprg=$HOME/.vim/vimf.pl\ % errorformat=%f\ %l\ %m.
 autocmd BufRead *.pl,*.pm set autoindent expandtab
"run current script and place output in a temporary buffer when <F4> is pressed
 autocmd BufEnter *.pl,*.pm map <F4> :new<CR>:set buftype=nofile bufhidden=hide nobuflisted<CR>:setlocal noswapfile<CR>:r !perl #<CR>
 autocmd BufLeave *.pl,*.pm unmap <F4>
 autocmd BufEnter *.py map <F4> :new<CR>:set buftype=nofile bufhidden=hide nobuflisted<CR>:setlocal noswapfile<CR>:r !python #<CR>
 autocmd BufEnter *.spec map <F4> :new<CR>:set buftype=nofile bufhidden=hide nobuflisted<CR>:setlocal noswapfile<CR>:r !rpmbuild -ba #<CR>
 autocmd BufLeave *.spec unmap <F4>
 autocmd BufEnter *.rb map <F4> :new<CR>:set buftype=nofile bufhidden=hide nobuflisted<CR>:setlocal noswapfile<CR>:r !ruby -ba #<CR>
 autocmd BufLeave *.rb unmap <F4>
"from http://www.vex.net/~x/python_and_vim.html
 autocmd BufEnter *.py set tabstop=4 shiftwidth=4 smarttab expandtab softtabstop=4 autoindent
 autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
 autocmd BufLeave *.py set all&
 autocmd BufLeave *.py unmap <F4>
"skeleton for new file
 autocmd BufNewFile *.pl call InsertSkeleton("skeleton.pl")
 autocmd BufNewFile *.pm call InsertSkeleton("skeleton.pm")
 autocmd BufNewFile *.sh call InsertSkeleton("skeleton.sh")
 autocmd BufNewFile *.c call InsertSkeleton("skeleton.c")
 autocmd BufNewFile *.py call InsertSkeleton("skeleton.py")
 autocmd BufNewFile *.spec call InsertSkeleton("skeleton.spec")
 autocmd BufNewFile *.rb call InsertSkeleton("skeleton.rb")
 autocmd BufNewFile *.pl,*.pm set makeprg=$HOME/.vim/vimf.pl\ % errorformat=%f\ %l\ %m.
 autocmd BufNewFile *.pl,*.pm set autoindent expandtab

"this based on the scripts at http://www.vim.org/tips/tip.php?tip_id=434
function! InsertSkeleton(fname)
    let path_to_skeletons = $HOME . "/.vim/skeletons/"
    " Save cpoptions
    let cpoptions = &cpoptions
    " Remove the 'a' option - prevents the name of the
    " alternate file being overwritten with a :read command
    exe "set cpoptions=" . substitute(cpoptions, "a", "", "g")
    exe "read " . path_to_skeletons . a:fname
    " Restore cpoptions
    exe "set cpoptions=" . cpoptions
    " Delete the first line into the black-hole register
    1, 1 delete _
    "write name of file after 'Name:'
    call search("Name:")
    exe "normal A " . expand("%:t")

    "  Append a line  like '13Feb2004  RPW  Created' below
    "  a line like 'Date  Author  Remarks'
    let date_line_no = search("Date")
    let rev_history = getline(line("."))
    let rev_history = substitute(rev_history, "Date     ", strftime("%d%b%Y"), "")  " CHANGE this!
    let rev_history = substitute(rev_history, "Author", "RPW   ", "")  "CHANGE this!
    let rev_history = substitute(rev_history, "Remarks", "Created.", "")
    call append(date_line_no, rev_history)
    "position cursor at end of line after 'Purpose' and goto insert mode
    call search("Purpose:")
    normal $
    startinsert!
endfunction
endif

