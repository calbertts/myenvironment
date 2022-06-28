let g:python_host_prog = 'user/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3.9'
"let g:copilot_node_command = "/Users/m_932939/.nvm/versions/node/v12.22.5/bin/node"

let g:loaded_python_provider = 0
let g:loaded_python3_provider = 0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Kepp selected test when fixing indentation
vnoremap < <gv
vnoremap > >gv

function! SetupCommandAbbrs(from, to)
  exec 'cnoreabbrev <expr> '.a:from
        \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
        \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')

autocmd FileType json syntax match Comment +\/\/.\+$+

vmap <leader>f  <Plug>(coc-format-selected)<CR>
nmap <leader>f  <Plug>(coc-format-selected)

nmap <Leader>lo :CocDiagnostics<CR>
nmap <silent><Leader>lp <Plug>(coc-diagnostic-prev)
nmap <silent><Leader>ln <Plug>(coc-diagnostic-next)

set statusline+=%{FugitiveStatusline()}

" Easy motions
nmap F <Plug>(easymotion-prefix)s

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" If doing a diff. Upon writing changes to file, automatically update the differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

" Enable bash alias
"set shellcmdflag=-ic

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

" console.log snippet
"vmap cll yocll<Esc>p
"nmap cll yiwocll<Esc>p

" replace current selected text with last yanked text
vnoremap S "_d"0P

"Reload changes made out of vim
set autoread
autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime
"autocmd FileChangedShellPost *
"  \ echohl WarningMsg | echo \"File changed on disk. Buffer reloaded.\" | echohl None

"Diff colors
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi Folded ctermbg=237

"Colors
"hi Normal guifg=#c0c0c0 guibg=#272727
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

"New line without insert mode
nnoremap <C-J> a<CR><Esc>k$

"Enable mouse
set mouse=a

"Hightlight search
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

"Folding options
"set re=1
set foldmethod=manual
set foldlevelstart=10

"set foldmethod=expr
"set foldexpr=nvim_treesitter#foldexpr()

"Move all swp files to tmp folder
"set backupdir=$TMPDIR
"set directory=$TMPDIR


"Autocomplete
"imap <Leader><Tab><Tab> <plug>(fzf-complete-word)
"imap <Leader><Tab-1><1> <plug>(fzf-complete-path)

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set rtp+=/usr/local/opt/fzf
syntax on

filetype plugin indent on
set cursorline
set tabstop=2
set shiftwidth=2
set expandtab
set number
set nowrap
set numberwidth=5
set splitright
set splitbelow
set lazyredraw
set synmaxcol=2000
syntax sync minlines=500
set wildignore+=**/node_modules/**,**/dbData/**,**/bundles/**,**/builds/**,**/dist/**
hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE
"set fillchars+=vert:\│
hi clear VertSplit
hi LineNr ctermfg=grey
hi Visual guibg=black
let g:jsx_ext_required = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':t'
set laststatus=2
set signcolumn=yes
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
"let g:airline_theme="wombat"
"let g:airline_theme="oceanicnextlight"
"let g:airline_theme = 'sonokai'
let g:airline_theme='gruvbox'
"let g:airline_theme='papercolor'
let g:airline_left_sep = ""
let g:airline_left_alt_sep = "|"
let g:airline_right_sep = "|"
let g:airline#extensions#tabline#show_tab_nr = 0
let $FZF_DEFAULT_COMMAND= 'ag -g ""'
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

"Theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:gruvbox_italic="1"
let g:gruvbox_contrast_dark="soft"
let g:gruvbox_contrast_light="soft"
let g:gruvbox_invert_selection="on"
let g:gruvbox_invert_signs=0

"colorscheme calbertts
"set background=light

"set background=light
"colorscheme PaperColor

set background=dark
silent! colorscheme gruvbox


" Important!!
if has('termguicolors')
  set termguicolors
endif

" The configuration options should be placed before `colorscheme sonokai`.
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1

"colorscheme sonokai


"Cursors
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

set rtp+=/Users/calbertts/.vim/plugged/powerline/bindings/vim

"keys stuff
set showcmd
let mapleader = "\<Space>"

"Horizontal scroll
map <C-L> 10zl " Scroll 10 characters to the right
map <C-H> 10zh " Scroll 10 characters to the left

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.7, 'highlight': 'Comment', 'border': 'sharp' } }

"Working with buffers
"nnoremap <Leader>o :call fzf#vim#ag('')<CR>
nnoremap <Leader>o :call fzf#vim#files({}, fzf#vim#with_preview('right:30%:sharp', 'ctrl-/'))<CR>
nnoremap <Leader>O :call fzf#run({'source': 'find .', 'sink': 'e', 'options': ['--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']})<CR>
nnoremap <Leader>w :b#\|bd #<CR>
nnoremap <Leader>W :b#\|bd! #<CR>
nnoremap <Leader>bl :bnext<CR>
nnoremap <Leader>bh :bprev<CR>
nnoremap <Leader>bs :Buffers<CR>
nnoremap <Leader>bt :b#<CR>
nnoremap <leader>bz <C-^>
nnoremap <Leader>bc :bd<CR>
"nnoremap <leader>bc :bp<cr>:bd #<cr>
noremap <C-N> :enew<CR>

"Working with windows (maximize - restore)
nnoremap <Leader>M <C-W>\| <C-W>_
nnoremap <Leader>= <C-W>=
noremap <silent> <C-S-Left> :vertical resize +1<CR>
noremap <silent> <C-S-Right> :vertical resize -1<CR>

function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <Leader><Leader> :ZoomToggle<CR>

" Working with tabs
nnoremap <Leader>tn :tabnew<CR>
nnoremap <Leader>th :tabp<CR>
nnoremap <Leader>tl :tabn<CR>
nnoremap <Leader>tc :tabc<CR>
nnoremap <Leader>tp :tablast<CR>

" Jum to last active tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap <Leader>tz :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Jump to tab: <Leader>T
function TabName(n)
    let buflist = tabpagebuflist(a:n)
    let winnr = tabpagewinnr(a:n)
    return fnamemodify(bufname(buflist[winnr - 1]), ':t')
endfunction

function! s:jumpToTab(line)
    let pair = split(a:line, ' ')
    let cmd = pair[0].'gt'
    execute 'normal' cmd
endfunction

nnoremap <silent> <Leader>T :call fzf#run({
\   'source':  reverse(map(range(1, tabpagenr('$')), 'v:val." "." ".TabName(v:val)')),
\   'sink':    function('<sid>jumpToTab'),
\   'down':    tabpagenr('$') + 2
\ })<CR>

" Close tabs - keep buffers
nnoremap <Leader>to :tabo<CR>

" All buffers to tabs
nnoremap <Leader>to :tab ball<CR>

" Copying file paths
nnoremap <Leader>cp :let @+=expand("%")<CR>
nnoremap <Leader>cfp :let @+=expand("%:p")<CR>

" Formatters
function! ApplyCSSFormat()
  syntax off
  %!formatcss
  syntax on
endfunction
nnoremap <Leader>jb :%!python -m json.tool<CR>
nnoremap <Leader>cf :silent call ApplyCSSFormat()<CR>

" Git shorcuts
set updatetime=100
set diffopt+=vertical

nnoremap ? :GFiles?<CR>

nnoremap <Leader>gj :GitGutterNextHunk<CR>zz
nnoremap <Leader>gk :GitGutterPrevHunk<CR>zz
nnoremap <Leader>gu :GitGutterUndoHunk<CR>
nnoremap <Leader>gs :GitGutterStageHunk<CR>
nnoremap <Leader>gp :GitGutterPreviewHunk<CR>
nnoremap <Leader>go :GitGutterFold<CR>
nnoremap <Leader>gx :G<CR>
nnoremap <Leader>gc :Gdiffsplit!<CR>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>

" Gitt blamer
let g:blamer_enabled = 0
let g:blamer_delay = 1000 
let g:blamer_show_in_visual_modes = 0

let g:git_messenger_max_popup_height = 30
function! DiffWithBranch(branch)
  exe 'Gdiffsplit '.a:branch
endfunction
function! DiffWithTag(tag)
  exe 'Gdiffsplit '.a:tag
endfunction
function! DiffWithCommit(tag)
  exe 'Gdiffsplit '.a:tag
endfunction
nnoremap <Leader>gdh :Gdiffsplit HEAD<CR>
nnoremap <silent><Leader>gdb :silent call fzf#run({'down': '15', 'source': 'git --no-pager branch --all', 'sink': function('DiffWithBranch')})<CR>
nnoremap <silent><Leader>gdt :silent call fzf#run({'down': '15', 'source': 'git --no-pager tag -l \| grep account', 'sink': function('DiffWithTag')})<CR>
nnoremap <silent><Leader>gdc :silent call fzf#run({'down': '15', 'source': 'git log --pretty=oneline --reverse', 'sink': function('DiffWithCommit')})<CR>
nnoremap <silent><Leader>gm  :GitMessenger<CR>

" Rapid inserts
nnoremap <Leader>ib a{}<ESC>i
nnoremap <Leader>ic a[]<ESC>i
nnoremap <Leader>ip a()<ESC>i
nnoremap <Leader>io a\|\|<ESC>a
nnoremap <Leader>iu i\<ESC>a


"GoTo Definitions mapping
nmap <silent> <leader>rd <Plug>(coc-definition)
nmap <silent> <leader>rt <Plug>(coc-type-definition)
nmap <silent> <leader>ri <Plug>(coc-implementation)
nmap <silent> <leader>rr <Plug>(coc-references)

"Copy/Paste from clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>p "+p

"Save
nnoremap <Leader>s :w<CR>

"Resize windows
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Terminal emulator
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

""" Example configuration floating terminal
let g:floaterm_keymap_new     = '<Leader>zn'
let g:floaterm_keymap_toggle  = '<Leader>zt'
"let g:floaterm_open_command = 'bash -login; source ~/.bash_profile'
let g:floaterm_shell          = 'bash --login'
let g:floaterm_position       = 'center'
let g:floaterm_borderchars=['', '', '', '', '', '', '', '']
hi FloatermBorder guibg=lightgrey

nnoremap <silent> <Leader>N :FloatermNew --height=0.7 --width=0.6 --wintype=floating --name=notes --position=center --autoclose=2 bash --login -c notes<CR>
nnoremap <silent> <Leader>P :FloatermNew --height=0.7 --width=0.6 --wintype=floating --name=passwords --position=center --autoclose=2 bash --login -c passCopy<CR>
nnoremap <silent> <Leader>C :FloatermNew --height=0.8 --width=0.8 --wintype=floating --name=commits --position=center --autoclose=2 bash --login -c commits<CR>
nnoremap <silent> <Leader>B :FloatermNew --height=0.6 --width=0.5 --wintype=floating --name=checkout --position=center --autoclose=2 bash --login -c checkout<CR>
nnoremap <silent> <Leader>M :FloatermNew --height=0.6 --width=0.6 --wintype=floating --name=processes --position=center --autoclose=2 bash --login -c htop<CR>
nnoremap <silent> <F7> :FloatermNew --autoclose=2 bash --login<CR>
tnoremap <silent> <F7> <C-\><C-n>:FloatermNew<CR>
nnoremap <silent> <F8> :FloatermPrev<CR>
tnoremap <silent> <F8> <C-\><C-n>:FloatermPrev<CR>
nnoremap <silent> <F9> :FloatermNext<CR>
tnoremap <silent> <F9> <C-\><C-n>:FloatermNext<CR>
nnoremap <silent> <F12> :FloatermToggle<CR>
tnoremap <silent> <F12> <C-\><C-n>:FloatermToggle<CR>

function! OpenTerminalV()
  exec "vsplit"
  exec "set nonumber"
  exec "set norelativenumber"
  exec "set signcolumn=no"
  exec "terminal"
  exec "i"
  exec "source $HOME/.bash_profile"
endfunction
function! OpenTerminalH()
  exec "split"
  exec "set nonumber"
  exec "set norelativenumber"
  exec "set signcolumn=no"
  exec "e term://bash --login"
endfunction

nnoremap <Leader>zv :silent call OpenTerminalV()<CR>
nnoremap <Leader>zh :silent call OpenTerminalH()<CR>
nnoremap <leader>z :vsplit<CR>:terminal<CR>i<CR>source $HOME/.bash_profile<CR>

"Reload neovim configs
nnoremap <leader>rv :so ~/.config/nvim/init.vim<CR>

" Debugger remaps
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dc :call GotoWindow(g:vimspector_session_windows.code)<CR>
nnoremap <leader>dt :call GotoWindow(g:vimspector_session_windows.tagpage)<CR>
nnoremap <leader>dv :call GotoWindow(g:vimspector_session_windows.variables)<CR>
nnoremap <leader>dw :call GotoWindow(g:vimspector_session_windows.watches)<CR>
nnoremap <leader>ds :call GotoWindow(g:vimspector_session_windows.stack_trace)<CR>
nnoremap <leader>do :call GotoWindow(g:vimspector_session_windows.output)<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>

nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Workspaces
let g:workspace_session_name = 'Session.vim'
let g:workspace_session_disable_on_args = 1
let g:workspace_autosave_ignore = ['gitcommit']
let g:workspace_autosave = 0
let g:workspace_autosave_untrailspaces = 0

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/popup.nvim'
Plug 'tpope/vim-surround'                   " ys ([{''}])
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'gruvbox-community/gruvbox'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'airblade/vim-gitgutter'               " Git gutter
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'preservim/nerdtree'
Plug 'github/copilot.vim'
Plug 'thaerkh/vim-workspace'                " Workspace manager
Plug 'puremourning/vimspector'

call plug#end()

silent! colorscheme gruvbox
