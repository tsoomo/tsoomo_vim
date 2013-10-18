
"User defined cmds and funcs {{{1

command! Bclose call <SID>BufcloseCloseIt()
"BufcloseCloseIt "{{{2
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction "}}}2
"}}}1

"Basic{{{1
  set nocompatible              " no use vi
  set hlsearch                  " higlight search result
  set cursorline                " display underline row on which cursor move
  set history=300               " remember last 300 commands
  "set autoread
  set modelines=5
  colorscheme elflord
  syntax on
  filetype on
  "filetype plugin on
"}}}1

"Statusbar{{{1
  set showcmd
  set laststatus=2
  set statusline=[%n]
  set statusline+=%<%F
  set statusline+=%m 
  set statusline+=%r 
  set statusline+=%w 
  set statusline+=[%{&fileformat}] 
  set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}] 
  set statusline+=%y 
  set statusline+=%= 
  set statusline+=[ASCII=%B] 
  set statusline+=[COL=%c,L=%l/%L] 
  set statusline+=[%p%%] 
"}}}1

"Key mapping{{{1
  let mapleader=','
  nmap <Leader>w :w!<cr>
  nmap <Leader>q :q<cr>
  nmap <Leader>nhl :nohlsearch<cr>
  nmap < :bp!<cr>
  nmap > :bn!<cr>
  nmap bc :Bclose<cr>
  nmap bca :1,300 bc!<cr>
  nnoremap <space> za
"}}}1

"NERDTree{{{1
  let g:NERDTreeQuitOnOpen = 1
  nmap <silent> <c-n> :NERDTreeToggle<CR>
  nmap <silent> <c-h> I<CR>
"}}}1

"minibufexpl{{{1
  let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)
  let g:miniBufExplModSelTarget = 1 " If you use other explorers like TagList you can (As of 6.2.8) set it at 1:
  "let g:miniBufExplUseSingleClick = 1 " If you would like to single click on tabs rather than double clicking on them to goto the selected buffer.
  let g:miniBufExplMaxSize = 1 " <max lines: defualt 0> setting this to 0 will mean the window gets as big as needed to fit all your buffers.
  "let g:miniBufExplForceSyntaxEnable = 1 " There is a Vim bug that can cause buffers to show up without their highlighting. The following setting will cause MBE to
  "let g:miniBufExplorerMoreThanOne = 1 " Setting this to 0 will cause the MBE window to be loaded even
  "let g:miniBufExplMapCTabSwitchBufs = 1
  "let g:miniBufExplMapWindowNavArrows = 1
  "for buffers that have NOT CHANGED and are NOT VISIBLE.
  "highlight MBENormal guibg=LightGray guifg=DarkGray
  " for buffers that HAVE CHANGED and are NOT VISIBLE
  "highlight MBEChanged guibg=Red guifg=DarkRed
  " buffers that have NOT CHANGED and are VISIBLE
  "highlight MBEVisibleNormal term=bold cterm=bold gui=bold guibg=Gray guifg=Black
  " buffers that have CHANGED and are VISIBLE
  "highlight MBEVisibleChanged term=bold cterm=bold gui=bold guibg=DarkRed guifg=Black
  map <leader>u :TMiniBufExplorer<cr>
  au BufRead,BufNew :call UMiniBufExplorer
"}}}1

" vim: fdm=marker
