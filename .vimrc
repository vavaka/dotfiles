" Initialization
" ---------------------------------------------------------------------------------------------
if 0 | endif " Skip initialization for vim-tiny or vim-small 

set nocompatible " Be iMproved
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Plugins
" ---------------------------------------------------------------------------------------------

" VimPlug Required
call plug#begin('~/.vim/plugged')

" Files/buffers navigation
Plug 'scrooloose/nerdtree'
Plug 'francoiscabrol/ranger.vim'
Plug 'mileszs/ack.vim'
"Plug 'rking/ag.vim'
Plug 'albfan/ag.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-unimpaired'         " navigate between files, buffers, errors and etc
Plug 'junegunn/fzf'                 " Fuzzy Finder
Plug 'junegunn/fzf.vim'
Plug 'qpkorr/vim-bufkill'           " kill buffer using ':BD' without closing a window

" Editor
Plug 'myusuf3/numbers.vim'          " toggle absulute/relative line numbers <leader><leader>#
Plug 'Lokaltog/vim-easymotion'      " quick navigation 's'
Plug 'chrisbra/NrrwRgn'             " edit visual block in separate split window <leader>nr
Plug 'terryma/vim-multiple-cursors' " edit similar entries at once <c-n> <c-p> <c-x>
Plug 'tpope/vim-surround'           " surround visual block with quotes, braces, brackets 'S'
Plug 'mbbill/undotree'
Plug 'sjl/gundo.vim'
Plug 'serby/vim-historic'
Plug 'hjdivad/vimlocalhistory'
Plug 'MattesGroeger/vim-bookmarks'

" Programming
Plug 'w0rp/ale'
Plug 'vavaka/tagbar'
"Plug 'majutsushi/tagbar'
Plug 'ddollar/nerdcommenter'
"Plug 'ervandew/supertab'
"Plug 'jiangmiao/auto-pairs'
"Plug 'Shougo/neocomplcache.vim'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'tmhedberg/matchit'
Plug 'tpope/vim-cucumber'

" Snippets
"Plug 'MarcWeber/vim-addon-mw-utils' " vim-snipmate dependency
"Plug 'tomtom/tlib_vim' " vim-snipmate dependency 
"Plug 'garbas/vim-snipmate' " snippets engine
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets' "snippets repository

" Misc
Plug 'flazz/vim-colorschemes'
Plug 'chriskempson/base16-vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'chrisbra/vim-diff-enhanced'
"Plug 'datawraith/auto_mkdir' "auto create parent directories on ':e /path/not_existed_dir/file.txt

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux
Plug 'benmills/vimux'                   " Create 20% split under current pane and run command in it, useful for tests
Plug 'vavaka/vim-tmux-navigator'   " Navigate between vim splits and tmux panes using same key bindings

" Ruby and Rails
Plug 'tpope/vim-rvm'
Plug 'tpope/vim-rails'
Plug 'skalnik/vim-vroom' " A vim plugin for running your Ruby tests
Plug 't9md/vim-ruby-xmpfilter' " ruby live in-place execution
Plug 'tpope/vim-endwise'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Javascript
Plug 'pangloss/vim-javascript'

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim' "tags navigation becomes available only after `mix phoneix.server`

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" Initialize plugin system
call plug#end()
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Vim settings
" ---------------------------------------------------------------------------------------------
syntax on

" setup swp
set nobackup "do not keep backup files, it's 70's style cluttering
set noswapfile "do not write annoying intermediate swap files
set backupdir=~/.vim/.tmp,~/tmp,/tmp "store backup files in one of these directories (in case swapfile is ever turned on)
set directory=~/.vim/.tmp,~/tmp,/tmp "store swap files in one of these directories (in case swapfile is ever turned on)

if has("gui_running")
    set lines=999 columns=999 "maximize gvim window to fill the entire window

    set encoding=utf-8 "set default encoding
    "set guifont=DejaVu\ Sans\ Mono\ 14 "set font
    set guifont=Monaco:h13 "set font

    set guioptions-=T "remove toolbar
    set guioptions-=l "remove left scrollbar always present 
    set guioptions-=L "remove left scrollbar present on split
    set guioptions-=r "remove right scrollbar always present
    set guioptions-=R "remove right scrollbar present on split
else
    "set timeoutlen=1000 ttimeoutlen=0 "set small timeout in order to make faster exit from VISUAL mode http://stackoverflow.com/questions/15550100/exit-visual-mode-without-delay
    set timeoutlen=5000 ttimeoutlen=0 "set small timeout in order to make faster exit from VISUAL mode http://stackoverflow.com/questions/15550100/exit-visual-mode-without-delay

    set termencoding=utf-8 "set default encoding

    set t_Co=256 "use 256 colors in terminal

    let g:solarized_termcolors=256
endif

set background=dark
"colorscheme solarized
colorscheme Tomorrow-Night
highlight clear SignColumn " fix Sign color, related to Solarized theme

set hidden " hide buffers when not displayed 

" setup language settings
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set number "show line numbers

set ruler "show the line and column number of the cursor position
set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom set hidden "hide buffers when not displayed
set cmdheight=2 "set status bar height
set laststatus=2 "always display status line

" vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set history=1000 "store lots of :cmdline history

" undo settings
if v:version >= 703
    set undofile
    set undodir=~/.vim/undofiles
endif
set undolevels=1000 "use many muchos levels of undo

" setup line wrap settihngs
set wrap! "dont wrap lines
set linebreak "don't wrap comment lines

" display tabs and trailing spaces
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set virtualedit=all "move to the last character in the line, not past it
set backspace=indent,eol,start "allow backspacing over everything in insert mode

" setup incremental search settings
set incsearch "find the next match as we type the search
set hlsearch "highlight searches by default
set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise

" indent settings
filetype plugin indent on " apply different indent settings for different file types
set tabstop=4     "tab width is 4 spaces
set shiftwidth=4  "indent command inserts 4 spaces
set softtabstop=4 "backspace removes 4 spaces
set expandtab     "expand tabs to spaces
set autoindent

" folding settings
"set foldmethod=syntax "for some reason autocompletion is super slow if this option is on
set foldnestmax=3 "deepest fold is 3 levels
set foldlevel=0 "don't fold everything on zc
set nofoldenable "dont fold by default

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"set completeopt=menuone,preview
set completeopt=menu,menuone,noinsert
"set completeopt=menu,menuone,noinsert

" command completion
" make use of the "status line" to show possible completions of command line commands, file names, and more
set wildmode=list:longest,full "first tab completes command to longest common match, next tabs iterates thru list
set wildmenu "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~ "stuff to ignore when tab completing

set formatoptions-=o "don't add comment leader after pushing new line
au filetype vim set formatoptions-=o "somehow, during vim filetype detection, this gets set for vim files, so explicitly unset it again
set formatoptions+=c "wrap comments using textwidth
set formatoptions+=r "add comment leader after pushing new line

" turn off matching parenthesis, brackets, braces
let g:loaded_matchparen=1

"set statusline=%f
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" UTF symbols to keys mappings
" ---------------------------------------------------------------------------------------------
" mapping utf symbols to keys because terminal emulator does not distinguish
" between non printing characyers
" http://stackoverflow.com/questions/5388562/cant-map-s-cr-in-vim
imap ⮐ <S-CR>

nmap ➀ <D-1>
nmap ➆ <D-7>

nmap 𝟏 <A-F1>
" ---------------------------------------------------------------------------------------------
" Editor settings
" ---------------------------------------------------------------------------------------------
imap <S-CR> <Esc>o

"make changes undoable
inoremap <C-r> <C-g>u<C-r>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" mappings to make "Y" work from the cursor to the end of line (which is more logical, but not Vi-compatible)
map Y y$

" speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-e>
nnoremap <C-y> 5<C-y>

" mappings for sudo to write
cmap w!! w !sudo tee % >/dev/null

command! CDC cd %:p:h
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Text search settings
" ---------------------------------------------------------------------------------------------
nnoremap <leader><CR> : nohl<CR>

" turn off Vim's crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" mappings for search and replace of selected text
vmap / y/<C-R>"<CR>
vmap s y:%s/<C-R>"//gc<LEFT><LEFT><LEFT>
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Windows settings
" ---------------------------------------------------------------------------------------------
" splitting
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w>S <C-w>s<C-w>j " split window horizontally and move cursor to new window
nnoremap <C-w>V <C-w>v<C-w>l " split window vertically and move cursor to new window 

" resizing
"nnoremap ) 5<c-w>> " increase window width
"nnoremap ( 5<c-w>< " decrease window width
"nnoremap + 5<c-w>+ " increase window height
"nnoremap _ 5<c-w>- " decrease window height

" zooming
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
nnoremap <leader><leader>z :ZoomToggle<CR>
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Tab settings
" ---------------------------------------------------------------------------------------------
function! s:EditBufferInNewTab() abort
    let l:current_buf_num = bufnr('%')
    execute 'tabnew'
    execute 'b '.l:current_buf_num
endfunction
command! EditBufferInNewTab :call s:EditBufferInNewTab()
nnoremap <leader>tb :EditBufferInNewTab<CR>

nnoremap <leader>tc :tabclose<CR>
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Plugins settings
" ---------------------------------------------------------------------------------------------

let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-p>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" Scratch settings
let g:scratch_no_mappings = 1

" Airline settings
let g:airline#extensions#tabline#enabled = 1 "display tabline
let g:airline#extensions#tabline#buffer_nr_show = 1 "display buffer numbers in tabline

" vim-historic settings
let g:historicBackupRepoLocation = "~/.vimlocalhistory"

let g:vlh_repository_dir = "~/.vimlocalhistory"

"or othe stufff

nmap <D-1> :NERDTreeToggle<CR>
nmap <leader><leader>t :NERDTreeToggle<CR>
nmap <leader>ft :NERDTreeToggle<CR>

nmap <A-F1> :NERDTreeFind<CR>
nmap <leader>fl :NERDTreeFind<CR>

command! -nargs=0 TagbarToggleFocusAutoClose call tagbar#ToggleWindow('fcj')
nmap <D-7> :TagbarToggleFocusAutoClose<CR>
nmap <leader>fg :TagbarToggleFocusAutoClose<CR>

"toggle relative/absolute line numbers by utilizing myusuf3/numbers.vim
nnoremap <leader><leader># :NumbersToggle<CR> 

nnoremap <leader>s :Ag<Space>

nmap <leader>nf :Files<CR>
nmap <leader>ng :GFiles<CR>
nmap <leader>nG :GFiles?<CR>
nmap <leader>nb :Buffers<CR>
nmap <leader>ne :History<CR>
nmap <leader>nt :Tags<CR>
nmap <leader>nh :Helptags<CR>
nmap <leader>ns :History/<CR>
nmap <leader>nl :BLines<CR>
nmap <leader>nm :Marks<CR>
nmap <leader>nw :Windows<CR>

"Ack settings
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

"Ranger settings
let g:ranger_map_keys = 0
map <leader>ar :Ranger<CR>
map <leader>aR :RangerNewTab<CR>
map <leader>fr :RangerWorkingDirectory<CR>
map <leader>fR :RangerWorkingDirectoryNewTab<CR>

"EasyMotions settings
let g:EasyMotion_do_mapping = 0 " Disable default mappings
nmap <leader>jc <Plug>(easymotion-overwin-f)
nmap <leader>js <Plug>(easymotion-overwin-f2)
nmap <leader>jw <Plug>(easymotion-overwin-w)
nmap <leader>jl <Plug>(easymotion-overwin-line)

" ---------------------------------------------------------------------------------------------


" ---------------------------------------------------------------------------------------------
" Diff settings
" ---------------------------------------------------------------------------------------------
set diffopt=vertical

let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Shell settings
" ---------------------------------------------------------------------------------------------
" VimShell settings
let g:vimshell_prompt_expr = 'escape(fnamemodify(getcwd(), ":~").">", "\\[]()?! ")." "'
let g:vimshell_prompt_pattern = '^\%(\f\|\\.\)\+> '

" NeoTerm settings
nnoremap <silent> <leader><leader>r :T clear<cr> " hide terminal
nnoremap <silent> <leader>rc :call neoterm#close()<cr> " close terminal
nnoremap <silent> <leader>rl :call neoterm#clear()<cr> " clear terminal
nnoremap <silent> <leader>rk :call neoterm#kill()<cr> " kills the current job (send a <c-c>)

nnoremap <silent> <leader>rS :TREPLSendFile<cr> " sends the current file to a REPL in a terminal
nnoremap <silent> <leader>rs :TREPLSend<cr> " sends the current line to a REPL in a terminal.
vnoremap <silent> <leader>rs :TREPLSend<cr> " sends selection to a REPL in a terminal.
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Tmux settings
" ---------------------------------------------------------------------------------------------
vmap <C-c><C-c> <Plug>SendSelectionToTmux
nmap <C-c><C-c> <Plug>NormalModeSendToTmux
nmap <C-c>r <Plug>SetTmuxVars
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" SCM settings
" ---------------------------------------------------------------------------------------------
" spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" GitGutter settings
let g:gitgutter_realtime = 1
let g:gitgutter_eager = 1

" Git commands
command! -nargs=+ Tg :T git <args>

" delete Fugitive buffers on leave
autocmd BufReadPost fugitive://* set bufhidden=delete
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Ale settings
" ---------------------------------------------------------------------------------------------
augroup erlang_files "{{{
    au!
    autocmd filetype erlang setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd Filetype erlang let find_result = system('find . -name "include" -type d -not -path "./rel/*" -print')[:-2]
    autocmd Filetype erlang let g:ale_erlang_erlc_options = '-I apps -I deps -I '. substitute(find_result, '\n', ' -I ', "g")

    "let find_result = system('find . -name "include" -type d -not -path "./rel/*" -print')[:-2]
    "let g:ale_erlang_erlc_options = '-I apps -I deps -I '. substitute(find_result, '\n', ' -I ', "g")
augroup end " }}}
" ---------------------------------------------------------------------------------------------

" ---------------------------------------------------------------------------------------------
" Ruby and Rails settings
" ---------------------------------------------------------------------------------------------
augroup ruby_files "{{{
    au!

    set tags+=tags
    set tags+=gems.tags

    autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
    autocmd Filetype ruby let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}

    "enable ruby omni completion
    "http://stackoverflow.com/questions/15723209/better-autocomplete-in-vim
    autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
    autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
    autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

    " http://tilvim.com/2013/06/24/live-ruby-execution.html 
    "let g:xmpfilter_cmd = "xmpfilter -a "--no-warnings"

    "autocmd FileType ruby nmap <buffer> <leader>rm <Plug>(xmpfilter-mark)
    "autocmd FileType ruby xmap <buffer> <leader>rm <Plug>(xmpfilter-mark)
    "autocmd FileType ruby imap <buffer> <leader>rm <Plug>(xmpfilter-mark)

    "autocmd FileType ruby nmap <buffer> <leader>rr <Plug>(xmpfilter-run)
    "autocmd FileType ruby xmap <buffer> <leader>rr <Plug>(xmpfilter-run)
    "autocmd FileType ruby imap <buffer> <leader>rr <Plug>(xmpfilter-run)

    let g:xmpfilter_cmd = "seeing_is_believing"

    autocmd FileType ruby nmap <buffer> <leader>rm <Plug>(seeing_is_believing-mark)
    autocmd FileType ruby xmap <buffer> <leader>rm <Plug>(seeing_is_believing-mark)
    autocmd FileType ruby imap <buffer> <leader>rm <Plug>(seeing_is_believing-mark)

    autocmd FileType ruby nmap <buffer> <leader>rc <Plug>(seeing_is_believing-clean)
    autocmd FileType ruby xmap <buffer> <leader>rc <Plug>(seeing_is_believing-clean)
    autocmd FileType ruby imap <buffer> <leader>rc <Plug>(seeing_is_believing-clean)

    " xmpfilter compatible
    autocmd FileType ruby nmap <buffer> <leader>rr <Plug>(seeing_is_believing-run_-x)
    autocmd FileType ruby xmap <buffer> <leader>rr <Plug>(seeing_is_believing-run_-x)
    autocmd FileType ruby imap <buffer> <leader>rr <Plug>(seeing_is_believing-run_-x)

    " auto insert mark at appropriate spot.
    autocmd FileType ruby nmap <buffer> <leader>ra <Plug>(seeing_is_believing-run)
    autocmd FileType ruby xmap <buffer> <leader>ra <Plug>(seeing_is_believing-run)
    autocmd FileType ruby imap <buffer> <leader>ra <Plug>(seeing_is_believing-run)
    
    function! SIBMarkAndRun(mode) " {{{
      call xmpfilter#mark(a:mode)
      call xmpfilter#run(a:mode, '-x')
    endfunction "}}}

    autocmd FileType ruby nmap <buffer> <leader>rx :call SIBMarkAndRun('n')<CR> 
    autocmd FileType ruby xmap <buffer> <leader>rx :call SIBMarkAndRun('v')<CR> 
    autocmd FileType ruby imap <buffer> <leader>rx <Esc>:call SIBMarkAndRun('i')<CR>a 
augroup end " }}}
" ---------------------------------------------------------------------------------------------
