if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Files
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mileszs/ack.vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/unite.vim'

" Git
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'

" Snippets
NeoBundle 'MarcWeber/vim-addon-mw-utils'
NeoBundle 'tomtom/tlib_vim'
NeoBundle 'garbas/vim-snipmate'
NeoBundle 'honza/vim-snippets'

" Navigation
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'tpope/vim-unimpaired'

" Programming
NeoBundle 'majutsushi/tagbar'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'ddollar/nerdcommenter'
NeoBundle 'ervandew/supertab'
NeoBundle 'benmills/vimux'

" Windows, Buffers, Regions
NeoBundle 'chrisbra/NrrwRgn'
NeoBundle 'christoomey/vim-tmux-navigator'
NeoBundle 'vim-scripts/scratch.vim'

" Other
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'chrisbra/vim-diff-enhanced'
NeoBundle 'terryma/vim-multiple-cursors'
"NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'mac' : 'make -f make_mac.mak'
\    },
\ }
NeoBundle 'Shougo/vimshell.vim'

" Ruby & Rails
NeoBundle 'tpope/vim-rails'
NeoBundle 'skalnik/vim-vroom'


" You can specify revision/branch/tag.
" NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


set nocompatible              " be iMproved, required
syntax on


" setup swp
set nobackup "do not keep backup files, it's 70's style cluttering
set noswapfile "do not write annoying intermediate swap files
set backupdir=~/.vim/.tmp,~/tmp,/tmp "store backup files in one of these directories (in case swapfile is ever turned on)
set directory=~/.vim/.tmp,~/tmp,/tmp "store swap files in one of these directories (in case swapfile is ever turned on)

if has("gui_running")
    set lines=999 columns=999

    set encoding=utf-8 "set default encoding
    "set guifont=DejaVu\ Sans\ Mono\ 14 "set font
    set guifont=Monaco:h14 "set font

    "remove toolbar, left scrollbar and right scrollbar
    set guioptions-=T
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
else
    set termencoding=utf-8 "set default encoding

    set t_Co=256 "tell the term has 256 colors

    let g:solarized_termcolors=256
endif

set background=dark
colorscheme solarized
highlight clear SignColumn

set history=1000 "store lots of :cmdline history

set ruler "show the line and column number of the cursor position
set number "show line numbers
set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom set hidden "hide buffers when not displayed

set cmdheight=2 "set status bar height

" undo settings
if v:version >= 703
    set undofile
    set undodir=~/.vim/undofiles
endif
set undolevels=1000 "use many muchos levels of undo

" setup line wrap settihngs
set wrap! "dont wrap lines
set linebreak "wrap lines at convenient points

" display tabs and trailing spaces
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set virtualedit=all "move to the last character in the line, not past it

" setup incremental search settings
set incsearch "find the next match as we type the search
set hlsearch "highlight searches by default
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" folding settings
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default

" command completion
" make use of the "status line" to show possible completions of command line commands, file names, and more
set wildmode=list:longest "display all matches and complete till longest common string
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "dont continue comments when pushing o/O
au filetype vim set formatoptions-=o "somehow, during vim filetype detection, this gets set for vim files, so explicitly unset it again
set fo+=cr "fix <Enter> for comment

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" hide buffers when not displayed
set hidden

" setup language settings
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" turn off matching parenthesis, brackets, braces
" let g:loaded_matchparen=1

" spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" highlight insert mode
autocmd InsertEnter * set cursorline
autocmd InsertEnter * highlight StatusLine guibg=#5E3140
autocmd InsertLeave * set nocursorline
autocmd InsertLeave * highlight StatusLine guibg=#1E392D

" При нажатии q: подсвечивать statusline темно-зеленым
autocmd CmdwinEnter * highlight StatusLine ctermbg=22
autocmd CmdwinLeave * highlight StatusLine ctermbg=236

" mappings for window navigation
nmap <C-S-h> <C-W>h
nmap <C-S-j> <C-W>j
nmap <C-S-k> <C-W>k
nmap <C-S-l> <C-W>l

" mappings for changing widnow size
nmap + <c-w>+
nmap - <c-w>-
nmap <c-m> <c-w><
nmap <c-n> <c-w>>


" mappings for completion
imap <C-Space> <C-X><C-O>

" turn off Vim's crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" speed up scrolling of the viewport slightly
nnoremap <C-e> 2<C-e>
nnoremap <C-y> 2<C-y>

" mappings for search and replace of selected text
vmap / y/<C-R>"<CR>
vmap s y:%s/<C-R>"//gc<LEFT><LEFT><LEFT>

" mappings to make "Y"  work from the cursor to the end of line (which is more logical, but not Vi-compatible)
map Y y$

" mappings for quickly get out of insert mode without your fingers having to leave the home row (either use 'jj' or 'jk')
inoremap jj <Esc>
inoremap jk <Esc>

" mappings for sudo to write
cmap w!! w !sudo tee % >/dev/null

" mappings for run ack fast
nnoremap <leader>s :Ack<Space>

" mappings to insert empty lines
nmap <leader>lo o<esc>
nmap <leader>lO O<esc>

nmap <leader><leader>t :NERDTreeToggle<CR>
nmap <leader><leader>g :TagbarToggle<CR>

let g:ctrlp_map = '<leader><leader>p'

nmap <leader>pm :CtrlPMRU<CR>
nmap <leader>pb :CtrlPBuffer<CR>
nmap <leader>px :CtrlPMixed<CR>

nmap <leader><leader>n :Unite file file_mru buffer<CR>
nmap <leader>nf :Unite file<CR>
nmap <leader>nm :Unite file_mru<CR>
nmap <leader>nb :Unite buffer<CR>

augroup ruby_files "{{{
    au!
    autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
augroup end " }}}

" Scratch settings
let g:scratch_no_mappings = 1


" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" GitGutter settings
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" VimShell settings
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

function! s:NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc
command! NumberToggle :call s:NumberToggle()
nnoremap <leader>on :NumberToggle<CR>

nnoremap <leader><CR> : nohl<CR>


" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoom_winrestcmd')
        execute t:zoom_winrestcmd
        unlet t:zoom_winrestcmd
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
    endif
endfunction
command! ZoomToggle :call s:ZoomToggle()
nnoremap <leader><leader>o :ZoomToggle<CR>

nnoremap <leader><leader><down> :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <leader><leader><up> :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <leader><leader><left> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <leader><leader><right> :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

function! s:EditBufferInNewTab() abort
    let l:current_buf_num = bufnr('%')
    execute 'tabnew'
    execute 'b '.l:current_buf_num
endfunction
command! EditBufferInNewTab :call s:EditBufferInNewTab()
nnoremap <leader>tb :EditBufferInNewTab<CR>

nnoremap <leader>tc :tabclose<CR>

inoremap <C-f> <Home>
inoremap <C-e> <End>

inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
