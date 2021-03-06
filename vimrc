" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

set number

set ts=4
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
set list listchars=tab:»»,trail:·

" smarter case sensitivity in searches
set ignorecase
set smartcase

" Don't write backup files since I don't use them anyway
set nobackup
set nowritebackup

"Spell checking
"setlocal spell spelllang=en_us
"highlight SpellBad term=standout cterm=underline
"highlight SpellCap term=underline cterm=underline
"highlight SpellRare term=underline cterm=underline
"highlight SpellLocal term=underline ctermfg=0 ctermfg=1 cterm=underline
"set spellfile=~/.vim/spellfile.add

au FileType make setlocal noexpandtab

colorscheme mustang

map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>D :execute 'NERDTreeToggle'<CR>

map <leader>t :FuzzyFinderFile<CR>
map <leader>t :CommandT<CR>
map <leader>b :FuzzyFinderBuffer<CR>
map <leader>T :FuzzyFinderTag<CR>
map <leader>Y :TlistToggle<CR>

map <silent> <F5> :if &background == "light"<CR>set background=dark<CR>else<CR>set background=light<CR>endif<CR>
map <leader>h :<C-U>!hg blame -fu <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

map <leader>jt  <Esc>:%!json_xs -f json -t json-pretty<CR>
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
