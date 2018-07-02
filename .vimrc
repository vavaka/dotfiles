" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ---------------------------------------------------------------------------------------------
" Vim-Plug
" https://github.com/junegunn/vim-plug
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" ---------------------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Basic
Plug 'bling/vim-airline'                  " lean & mean status/tabline
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'             " color schemes mega pack
Plug 'tpope/vim-unimpaired'               " navigate between files, buffers, errors and etc
Plug 'qpkorr/vim-bufkill'                 " kill buffer using ':BD' without closing a window
Plug 'MattesGroeger/vim-bookmarks'        " plugin for toggling annotated persisted bookmarks
Plug 'mbbill/undotree'                    " undo tree visualizer
Plug 'blueyed/vim-diminactive'            " plugin to dim inactive windows

" Search
Plug 'mileszs/ack.vim'                    " integration with Ack and Ag grepping tools
Plug 'vavaka/fzf'                         " fzf wrapper
Plug 'junegunn/fzf.vim'                   " fzf commands

" Filesystem
Plug 'scrooloose/nerdtree'                " tree explorer
Plug 'francoiscabrol/ranger.vim'          " Ranger file manager integration with Vim
Plug 'datawraith/auto_mkdir'              " auto create parent directories on ':e /path/not_existed_dir/file.txt

" Formatting
Plug 'chiel92/vim-autoformat'             " provide easy code formatting by integrating existing code formatters
Plug 'godlygeek/tabular'                  " script for text filtering and alignment, ':Tab /,/l1c1l0'

" Editor
Plug 'Lokaltog/vim-easymotion'            " Vim motions on speed
Plug 'chrisbra/NrrwRgn'                   " edit visual block in separate split window
Plug 'tpope/vim-surround'                 " surround visual block with quotes, braces, brackets
Plug 'terryma/vim-multiple-cursors'       " edit similar entries at once <c-n> <c-p> <c-x>
Plug 'sirver/ultisnips'                   " snippets engine
Plug 'honza/vim-snippets'                 " snippets repository
Plug 'kana/vim-textobj-user'              " create your own text objects
Plug 'kana/vim-textobj-indent'            " text objects for indented blocks of lines (i)

" Tmux
Plug 'vavaka/vim-tmux-navigator'          " navigate between vim splits and tmux panes using same key bindings
Plug 'tmux-plugins/vim-tmux-focus-events' " make terminal vim and tmux work better together
Plug 'benmills/vimux'                     " vim plugin to interact with tmux

" Git
Plug 'vavaka/vim-fugitive'                " Git integration, use my fork as it supports opening diffs in new tab
Plug 'airblade/vim-gitgutter'             " shows diff in the gutter (sign column) and stages/undoes hunks
Plug 'junegunn/gv.vim'                    " commit browser
Plug 'jreybert/vimagit'                   " stage file, hunks or even just parts of a hunk

" Programming
Plug 'w0rp/ale'                           " asynchronous Lint Engine
Plug 'majutsushi/tagbar'                  " displays tags in a window, ordered by scope
Plug 'chrisbra/vim-diff-enhanced'         " make use of the Patience diff algorithm
Plug 'jiangmiao/auto-pairs'               " insert or delete brackets, parens, quotes in pair
Plug 'tpope/vim-endwise'                  " endwise.vim: wisely add 'end' in ruby, 'endfunction/endif/more' in vim script, etc
Plug 'ddollar/nerdcommenter'              " commenting engine
Plug 'janko-m/vim-test'                   " wrapper for running tests on different granularities

" Ruby and Rails
Plug 'tpope/vim-rails'
Plug 'vavaka/vim-cucumber'
Plug 'skalnik/vim-vroom'                  " vim plugin for running your Ruby tests
Plug 'tek/vim-textobj-ruby'               " text objects for Ruby block (r), function (f), class (c)

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'

" Erlang
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-compiler'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-tags'

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'            " tags navigation becomes available only after `mix phoneix.server`

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'

" load matchit, it is included in distribution but is not loaded by default
runtime! macros/matchit.vim

call plug#end()

" ---------------------------------------------------------------------------------------------
" Basic settings
" ---------------------------------------------------------------------------------------------
let mapleader = " "

syntax on

color Tomorrow-Night

"let g:solarized_diffmode="high"
"color solarized

"set background=dark


" enable filetype-specific plugins
filetype plugin on

" disable matching parenthesis, brackets, braces highlighting due to performance issues
let g:loaded_matchparen=1

" do not use Ex mode, use Q for formatting
map Q gq

" make Y work from the cursor to the end of line
map Y y$

nmap <silent> <leader><leader>p :set invpaste<CR>

" ---------------------------------------------------------------------------------------------
" GUI settings
" ---------------------------------------------------------------------------------------------
if has("gui_running")
  " maximize gvim window to fill the entire window
  set lines=999 columns=999 

  set guioptions-=T "remove toolbar
  set guioptions-=l "remove left scrollbar always present 
  set guioptions-=L "remove left scrollbar present on split
  set guioptions-=r "remove right scrollbar always present
  set guioptions-=R "remove right scrollbar present on split

  set guifont=Monaco:h13
  "set guifont=DejaVu\ Sans\ Mono\ 14
endif

" ---------------------------------------------------------------------------------------------
" Terminal settings
" ---------------------------------------------------------------------------------------------
if !has("gui_running")
  set t_Co=256        " use 256 colors in terminal

  set ttimeout        " time out for key codes
  set ttimeoutlen=100 " wait up to 100ms after Esc for special key
endif

" ---------------------------------------------------------------------------------------------
" UI settings
" ---------------------------------------------------------------------------------------------
set number           " show line numbers
set nocursorline     " disable current line highlighting due to performance issues
set ruler            " show the line and column number of the cursor position
set showcmd          " show incomplete cmds down the bottom
set showmode         " show current mode down the bottom
set laststatus=2     " display status lines for each window
set previewheight=20 " set preview window height, used by <ctrl-w }> tag navigation

set regexpengine=1   " use old engine as it improves rendering performance
set relativenumber   " use relativenumber only in combination with regexpengine

let g:diminactive_enable_focus = 1 " enable inactive window shading

" ---------------------------------------------------------------------------------------------
" Mouse settings
" ---------------------------------------------------------------------------------------------
if has('mouse')
  set mouse=a " Enable maouse for all modes
endif

" ---------------------------------------------------------------------------------------------
" Scrolling settings
" ---------------------------------------------------------------------------------------------
set scrolloff=5     " minimal number of screen lines to keep above and below the cursor
set sidescrolloff=7 " minimal number of screen columns to keep to the left and to the right of the cursor
set sidescroll=1    " scroll left and right by one character 

" speed up scrolling of the viewport slightly
nnoremap <C-e> 5<C-y>
nnoremap <C-d> 5<C-e>
nnoremap <C-y> <C-d>

nnoremap <C-f> <C-d>
nnoremap <C-b> <C-u>

" ---------------------------------------------------------------------------------------------
" Formatting settings
" ---------------------------------------------------------------------------------------------
filetype indent on   " enable filetype-specific indenting

set nowrap           " do not wrap long lines

set autoindent
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent command inserts 4 spaces
set softtabstop=4    " backspace removes 4 spaces
set expandtab        " expand tabs to spaces

set formatoptions+=c " wrap comments using textwidth
set formatoptions+=r " insert comment leader after hitting <Enter> in Insert mode
set formatoptions-=o " insert comment leader after hitting 'o' or 'O' in Normal mode
set formatoptions+=j " delete comment leader when joining commented lines

nmap <silent> <leader><leader>f :Autoformat<CR>

" ---------------------------------------------------------------------------------------------
" Encoding, keymap, chars settings
" ---------------------------------------------------------------------------------------------
if has("gui_running")
  set encoding=utf-8
else
  set termencoding=utf-8
endif

" switch to russian with ctrl-^
" by changing value of this option there is a side effect, 
" it sets new keymap as current for insert and search modes
" so we need to reset input methods for these modes
set keymap=russian-jcukenwin 
set iminsert=0
set imsearch=0
set imsearch=0

" move to the last character in the line, not past it
set virtualedit=all            
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display non-printable chars
set list
set listchars=tab:▸\ ,trail:·,precedes:←,extends:→,eol:¬,space:·

function! s:NonPrintableCharsToggle() abort
  if &list
    set nolist
  else
    set list
  endif
endfunction
command! NonPrintableCharsToggle :call s:NonPrintableCharsToggle()
nnoremap <silent> <leader><leader>` :NonPrintableCharsToggle<CR>

" ---------------------------------------------------------------------------------------------
" Folding settings
" ---------------------------------------------------------------------------------------------
set foldmethod=indent " use indent driven folding as for some reason syntax driven folding is super slow
set foldnestmax=3     " deepest fold is 3 levels
set foldlevel=0       " do not fold everything on zc
set nofoldenable      " do not fold by default

" ---------------------------------------------------------------------------------------------
" Search settings
" ---------------------------------------------------------------------------------------------
set incsearch  " find the next match as we type the search
set hlsearch   " highlight searches by default
set ignorecase " ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise

" turn off Vim's crazy default regex characters and makes searches use normal regexes
nnoremap / /\v
vnoremap / /\v

" mappings for search and replace of selected text
vmap / y/<C-R>"<CR>
vmap s y:%s/<C-R>"//gc<LEFT><LEFT><LEFT>

" keep cursor on the current word
nnoremap <silent> * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> g* :let @/='<C-R>=expand("<cword>")<CR>'<CR>:set hls<CR>

" clear highlighting
nnoremap <silent> <leader><leader>l :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>

" ---------------------------------------------------------------------------------------------
" Text completion settings
" ---------------------------------------------------------------------------------------------
" setup text completion
" 'menu'     - use a popup menu to show the possible completions
" 'menuone'  - use the popup menu also when there is only one match
" 'noinsert' - do not insert any text for a match until the user selects a match from the menu
set completeopt=menu,menuone,noinsert

" by default Vim searches for completions in many locations including tags
" in large projects searching in tags is slow so removing it
set complete-=t

" omni completion based on the current syntax highlights
set omnifunc=syntaxcomplete#Complete

" ---------------------------------------------------------------------------------------------
" Command line settings
" ---------------------------------------------------------------------------------------------
set cmdheight=2  " set sommand line height
set history=1000 " store lots of :cmdline history

" set up command line completion
" list:longest - when more than one match, list all matches and complete till longest common string
" full - complete the next full match
set wildmode=list:longest,full
" enable ctrl-n and ctrl-p to jump thru matches
set wildmenu
" stuff to ignore when tab completing
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,*~

" ---------------------------------------------------------------------------------------------
" Backup settings
" ---------------------------------------------------------------------------------------------
" do not keep backup files
set nobackup
" store backup files in one of these directories (in case backup is ever turned on)
set backupdir=~/.vim/.tmp,~/tmp,/tmp 

" do not write annoying intermediate swap files
set noswapfile
" store swap files in one of these directories (in case swapfile is ever turned on)
set directory=~/.vim/.tmp,~/tmp,/tmp 

" ---------------------------------------------------------------------------------------------
" Undo settings
" ---------------------------------------------------------------------------------------------
" enable persistent undo
set undofile
set undodir=$HOME/.vim/undofiles
set undolevels=1000

"make changes undoable
inoremap <C-r> <C-g>u<C-r>
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

nmap <silent> <leader><leader>u :UndotreeToggle<CR>

" ---------------------------------------------------------------------------------------------
" Grep settings
" ---------------------------------------------------------------------------------------------
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ackhighlight = 1
let g:ack_use_cword_for_empty_search = 1

nnoremap S :Ack!<Space>

" ---------------------------------------------------------------------------------------------
" Buffers settings
" ---------------------------------------------------------------------------------------------
" hide buffers when not displayed
set hidden

" mappings for sudo to write
cmap w!! w !sudo tee % >/dev/null 

" change working dir to base dir of current buffer
command! CDC cd %:p:h

" ---------------------------------------------------------------------------------------------
" Windows settings
" ---------------------------------------------------------------------------------------------
" navigation between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <C-w>S <C-w>s<C-w>j " split window horizontally and move cursor to new window
nnoremap <C-w>V <C-w>v<C-w>l " split window vertically and move cursor to new window 

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
nnoremap <silent> <leader><leader>z :ZoomToggle<CR>

" ---------------------------------------------------------------------------------------------
" Tabs settings
" ---------------------------------------------------------------------------------------------
nnoremap <silent> <leader>tb :tabedit %<CR>
nnoremap <silent> <leader>tc :tabclose<CR>

" ---------------------------------------------------------------------------------------------
" Sessions settings
" ---------------------------------------------------------------------------------------------
" do not save window and buffer options in session file
set sessionoptions-=options

" ---------------------------------------------------------------------------------------------
" Tmux settings
" ---------------------------------------------------------------------------------------------
function! VimuxSlime()
	try
    let prev_val = @v
    normal! "vy

		call VimuxSendText(@v)
		call VimuxSendKeys("Enter")
  finally
    let @v = prev_val
  endtry
endfunction

" copy selected text to V regsiter and send later to tmux
map <Leader>vo :call VimuxOpenRunner()<CR>
vmap <Leader>vs :call VimuxSlime()<CR>
map <Leader>vr :call VimuxPromptCommand()<CR>

" ---------------------------------------------------------------------------------------------
" Version control settings
" ---------------------------------------------------------------------------------------------
" spell check when writing commit logs
autocmd filetype svn,*commit* setlocal spell

" delete Fugitive buffers on leave
autocmd BufReadPost fugitive://* set bufhidden=delete 

" diff against the HEAD instead of the index
let g:gitgutter_diff_base = 'HEAD' 

nmap <silent> <leader>gs :Gstatus<CR>
nmap <silent> <leader>gb :Gblame<CR>
nmap <silent> <leader>gl :GV --max-count 2000<CR>

" show diff in a separate tab
command! Gtdiff :execute("tabedit % | Gdiff")
nmap <silent> <leader>gd :Gtdiff<CR>

" ---------------------------------------------------------------------------------------------
" Diff settings
" ---------------------------------------------------------------------------------------------
" by default split windows vertically
set diffopt=vertical 

" use Patience algorithm for git diff
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

" toggle diff mode
function! s:DiffToggle() abort
  if &diff
    diffoff
  else
    execute "windo diffthis"
  endif
endfunction
command! DiffToggle :call s:DiffToggle()
nnoremap <silent> <leader>dt :DiffToggle<CR>

" show unsaved changes in as a diff in new tab
command! DiffOrig tabedit % | vert new 
  \ | set bt=nofile | exe "set ft=".getbufvar('#', '&filetype') 
  \ | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
nnoremap <silent> <leader>do :DiffOrig<CR>

" ---------------------------------------------------------------------------------------------
" Run settings
" ---------------------------------------------------------------------------------------------
"VimTest mappings
nmap <silent> <leader>rn :TestNearest<CR>
nmap <silent> <leader>rf :TestFile<CR>
nmap <silent> <leader>rs :TestSuite<CR>
nmap <silent> <leader>rl :TestLast<CR>
nmap <silent> <leader>rv :TestVisit<CR>

" ---------------------------------------------------------------------------------------------
" File managers settings
" ---------------------------------------------------------------------------------------------
let g:netrw_keepdir= 0 " auto set netrw current directory to browsing directory

" NERDTree
let g:NERDTreeHijackNetrw=0
nmap <silent> <leader><leader>t :NERDTreeToggle<CR>
" find current file  in NERDTree
nmap <silent> <leader>fl :NERDTreeFind<CR>

augroup nerdtree "{{{
  au!

  " do not display non-printable chars in NERDTree buffer
  autocmd filetype nerdtree set nolist
augroup end " }}}

"Ranger
let g:ranger_map_keys = 0
map <silent> <leader><leader>r :Ranger<CR>
map <silent> <leader>fr :RangerCurrentFile<CR>

" ---------------------------------------------------------------------------------------------
" FZF settings
" ---------------------------------------------------------------------------------------------
" use selected results of prev search as a source for next search
function! s:fzf_chain(dict, lines)
  let new_dict = a:dict
  let new_dict.source = a:lines

  call fzf#run(fzf#wrap(new_dict))
endfunction

" search for files
command! -nargs=* -complete=dir Files call fzf#run(fzf#wrap({
  \ 'source': 'fd --type f --hidden --follow --no-ignore-vcs --exclude ".git"',
 \}))

" search for directories
command! -nargs=* -complete=dir Dirs call fzf#run(fzf#wrap({
  \ 'source': 'fd --type d --hidden --follow --no-ignore-vcs --exclude ".git"',
 \}))

" search for file from command mode
function! s:append_file_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'find . -type f -not -path "./.*"',
    \ 'sink': {line -> feedkeys(line, 'n')}}))
  return ''
endfunction
cnoremap <expr> <c-x><c-f> <sid>append_file_with_fzf(getcmdline())

" search for directory from command mode
function! s:append_dir_with_fzf(line)
  call fzf#run(fzf#wrap({
    \ 'options': ['--prompt', a:line.'> '],
    \ 'source': 'find . -type d -not -path "./.*"',
    \ 'sink': {line -> feedkeys(line, 'n')}}))
  return ''
endfunction
cnoremap <expr> <c-x><c-d> <sid>append_dir_with_fzf(getcmdline())

let $FZF_DEFAULT_OPTS = '--multi --bind ctrl-a:toggle-all'
let g:fzf_action = {
  \ 'ctrl-f': 'Files',
  \ 'ctrl-d': 'Dirs',
  \ 'ctrl-s': function('s:fzf_chain'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

nmap <silent> <leader>nf :Files<CR>
nmap <silent> <leader>nd :Dirs<CR>
nmap <silent> <leader>ng :GFiles<CR>
nmap <silent> <leader>nG :GFiles?<CR>
nmap <silent> <leader>nb :Buffers<CR>
nmap <silent> <leader>ne :History<CR>
nmap <silent> <leader>nt :BTags<CR>
nmap <silent> <leader>nT :Tags<CR>
nmap <silent> <leader>nh :Helptags<CR>
nmap <silent> <leader>ns :History/<CR>
nmap <silent> <leader>nc :History:<CR>
nmap <silent> <leader>nl :BLines<CR>
nmap <silent> <leader>nm :Marks<CR>
nmap <silent> <leader>nw :Windows<CR>

" ---------------------------------------------------------------------------------------------
" Airline settings
" ---------------------------------------------------------------------------------------------
let g:airline#extensions#keymap#enabled = 0

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_buffers = 0
" disable buffer name displaying in the right of tabline
let g:airline#extensions#tabline#show_splits = 0
" display tab numbers
let g:airline#extensions#tabline#tab_nr_type = 1
" no need to display tab type as tabline is configured to display only tabs
let g:airline#extensions#tabline#show_tab_type = 0 

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" ---------------------------------------------------------------------------------------------
" Easy motion settings
" ---------------------------------------------------------------------------------------------
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-overwin-f)

" ---------------------------------------------------------------------------------------------
" Snippets settings
" ---------------------------------------------------------------------------------------------

let g:UltiSnipsSnippetDirectories=["UltiSnips", "mysnippets"]
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"

" ---------------------------------------------------------------------------------------------
" Linter settings
" ---------------------------------------------------------------------------------------------

map [e <Plug>(ale_previous_wrap)
map ]e <Plug>(ale_next_wrap)

" ---------------------------------------------------------------------------------------------
" Tags settings
" ---------------------------------------------------------------------------------------------
" semicolon makes Vim to start in the current dir 
" and search up directories until it hits a tags file
set tags=tags; 

let g:ctags_command="ctags --tag-relative -R -f./tags --exclude=.git --exclude=.svn --exclude=tmp --exclude=log ."
command! RebuildTags :execute("!".g:ctags_command)

command! -nargs=0 TagbarToggleFocusAutoClose call tagbar#ToggleWindow('fcj')
nmap <silent> <leader>f] :TagbarToggle<CR>

" ---------------------------------------------------------------------------------------------
" Vimscript settings
" ---------------------------------------------------------------------------------------------
augroup vimscript_files "{{{
  au!

  autocmd filetype vim setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

  " do not insert comment leader after hitting 'o' or 'O' in Normal mode
  " it is default setting but somehow, during vim filetype detection
  " this gets set for vim files, so explicitly unset it again
  autocmd filetype vim setlocal formatoptions-=o
augroup end " }}}

" ---------------------------------------------------------------------------------------------
" Erlang settings
" ---------------------------------------------------------------------------------------------
augroup erlang_files "{{{
  au!

  autocmd filetype erlang setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd Filetype erlang let find_result = system('find . -name "include" -type d -not -path "./rel/*" -print')[:-2]
  autocmd Filetype erlang let g:ale_erlang_erlc_options = '-I apps -I deps -I '. substitute(find_result, '\n', ' -I ', "g")

  " include Erlang/OTP tags
  " Command to generating Erlang/OTP tags
  " ~/.vim/plugged/vim-erlang-tags/bin/vim-erlang-tags.erl -p -o $_KERL_ACTIVE_DIR/tags
  autocmd filetype erlang setlocal tags+=$_KERL_ACTIVE_DIR/tags, 
augroup end " }}}

" ---------------------------------------------------------------------------------------------
" Ruby/Rails settings
" ---------------------------------------------------------------------------------------------
let g:vroom_use_vimux = 1
let g:vroom_ignore_color_flag=1
let g:vroom_spec_command="rspec -f d"

nmap <Leader>vf :VroomRunTestFile<CR>
nmap <Leader>vn :VroomRunNearestTest<CR>
nmap <Leader>vl :VroomRunLastTest<CR>

let test#ruby#bundle_exec = 1
let test#ruby#rspec#options = {
  \ 'nearest': '--format documentation --backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}

augroup ruby_files "{{{
  au!

  autocmd filetype ruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
  autocmd Filetype ruby let b:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '|':'|'}

  autocmd filetype eruby setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

  autocmd filetype ruby let g:ctags_command="ctags --tag-relative -R -f./tags --exclude=.git --exclude=tmp --exclude=log --exclude=public --exclude=app/assets --languages=ruby `bundle show --paths` ."
augroup end " }}}
