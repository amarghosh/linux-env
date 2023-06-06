
" Add the following line to ~/.vimrc to use this file
" source $HOME/linux-env/vimrc

if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

se nocompatible	" Use Vim defaults (much better!)
se bs=indent,eol,start		" allow backspacing over everything in insert mode
se ai			" always set autoindenting on
se ic
se nu
se tabstop=4
se shiftwidth=4
se expandtab
se hlsearch
se incsearch
se cursorline
se tags=tags;/

" If this line throws error, check: https://github.com/tpope/vim-pathogen
execute pathogen#infect()
filetype plugin indent on

autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd FileType make set noexpandtab
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType typescript setlocal re=2
autocmd FileType typescriptreact setlocal re=2

" Highlight trailing whitespace
highlight trailingspace ctermbg=grey guibg=grey
match trailingspace /\s\+$/

map <F9> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

hi CursorLine   cterm=NONE ctermbg=gray ctermfg=black guibg=gray guifg=black

nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


nmap <F7>			:tabprevious	<CR>
nmap <F8>			:tabnext		<CR>
 map <F7> 			:tabprevious	<CR>
 map <F8>	 		:tabnext		<CR>
imap <F7>	<Esc>	:tabprevious	<CR>i
imap <F8>	<Esc>	:tabnext		<CR>i
nmap <C-n>			:tabnew			<CR>
imap <C-n> <Esc>	:tabnew			<CR>

set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

