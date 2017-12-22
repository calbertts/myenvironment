if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Quick git status
nnoremap ? :GFiles?<CR>

" Git hunks shorcuts
nnoremap <C-S> :GitGutterNextHunk<CR>
nnoremap <C-P> :GitGutterPrevHunk<CR>
nnoremap <C-U> :GitGutterUndoHunk<CR>

" Kepp selected test when fixing indentation
vnoremap < <gv
vnoremap > >gv

" Easy motions
nmap F <Plug>(easymotion-prefix)s

" Limelight
nmap <Leader>L :Limelight!!<CR>

"Avoid ESCAPE key
let g:easyescape_chars = { "j": 2 }
let g:easyescape_timeout = 500
cnoremap jj <ESC>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" If doing a diff. Upon writing changes to file, automatically update the
" differences
autocmd BufWritePost * if &diff == 1 | diffupdate | endif

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
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

"Diff colors
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi Folded ctermbg=237

"Colors
hi Normal guifg=#c0c0c0 guibg=#272727
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
set foldmethod=syntax
set foldlevelstart=20

"Move all swp files to tmp folder
set backupdir=$TMPDIR
set directory=$TMPDIR


"Autocomplete
"imap <Leader><Tab><Tab> <plug>(fzf-complete-word)
"imap <Leader><Tab-1><1> <plug>(fzf-complete-path)

autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

set rtp+=/usr/local/opt/fzf
syntax on
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set cursorline
set number
set nowrap
set numberwidth=5
set lazyredraw
set wildignore+=**/node_modules/**,**/dbData/**,**/jspm_packages/**,**/bundles/**,**/builds/**,**/dist/**
hi CursorLine cterm=NONE ctermbg=237 ctermfg=NONE
set fillchars+=vert:\│
hi clear VertSplit
hi LineNr ctermfg=grey
hi Visual guibg=black
let g:jsx_ext_required = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2
set signcolumn=yes
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
let g:airline_theme="wombat"
let g:airline_theme='oceanicnext'
set guifont=DroidSansMono\ Nerd\ Font\ 12
let g:airline_left_sep = "\uE0B4"
let g:airline_left_alt_sep = ""
let g:airline_right_sep = "\uE0B6"
let $FZF_DEFAULT_COMMAND= 'ag -g ""'

"Theme
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:gruvbox_italic="1"
let g:gruvbox_contrast_dark="soft"
set background=dark
colorscheme oceanicnext

"Cursors
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"Javascript stuff
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1

let g:github_dashboard = { 'username': 'calbertts', 'password': $GITHUB_TOKEN }

"jLinter
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_javascript_checkers = ['jshint', 'jscs', 'eslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = '✖'
let g:syntastic_style_error_symbol = '>>'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '🤦'

"autocmd FileType javascript let b:syntastic_checkers = findfile('.eslintrc.yml', '.;') != '' ? ['eslint'] : ['jscs', 'eslint']
autocmd FileType javascript let b:syntastic_checkers = ['eslint']

highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
"End Linter
"End JS stuff

"Delete all whitespaces at the end of line
autocmd BufWritePre * %s/\s\+$//e

" Git stuff
set diffopt+=vertical

set rtp+=/Users/calbertts/.vim/plugged/powerline/bindings/vim

"keys stuff
set showcmd
let mapleader = "\<Space>"

"Horizontal scroll
map <C-L> 10zl " Scroll 10 characters to the right
map <C-H> 10zh " Scroll 10 characters to the left

"Working with files
nnoremap <Leader>o :FZF<CR>
nnoremap <Leader>w :b#\|bd #<CR>
nnoremap <Leader>n :bnext<CR>
nnoremap <Leader>b :bprev<CR>
nnoremap <Leader>c :Buffers<CR>
nnoremap <leader>z <C-^>
noremap <C-N> :enew<CR>

"YouCompleteMe
let g:ycm_filetype_blacklist = {
  \'json': 1
\}
let g:ycm_filetype_specific_completion_to_disable = {
  \'json': 1
\}
nnoremap <Leader>gt :YcmCompleter GoTo<CR>
nnoremap <Leader>gr :YcmCompleter GoToReferences<CR>
nnoremap <Leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>gd :YcmCompleter GetDoc<CR>
nnoremap <Leader>rr :YcmCompleter RefactorRename<CR>
nnoremap <leader>f :vimgrep  . "'" . expand("<cword>") . "'" . **/*.js<CR>

"Copy/Paste from clipboard
vnoremap <Leader>y "*y
nnoremap <Leader>p "+p

"Save
nnoremap <Leader>s :w<CR>

"Resize windows
nnoremap <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"Save folds
"augroup AutoSaveFolds
"  autocmd!
"  au BufWinLeave ?* mkview 1
"  au BufWinEnter ?* silent loadview 1
"augroup END

"Maxmize/Restore buffers
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Workspaces
let g:workspace_session_name = 'Session.vim'
let g:workspace_autosave_ignore = ['gitcommit']
let g:workspace_autosave_always = 1
let g:workspace_autosave_untrailspaces = 0

if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'thaerkh/vim-workspace'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'powerline/powerline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-fugitive'
Plug 'christoomey/vim-conflicted'
Plug 'zhou13/vim-easyescape'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'tpope/vim-surround'
Plug 'maksimr/vim-jsbeautify'
Plug 'townk/vim-autoclose'
Plug 'editorconfig/editorconfig-vim'
Plug 'metakirby5/codi.vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'Valloric/YouCompleteMe'
Plug 'juanpabloaj/vim-istanbul'
Plug 'junegunn/vim-easy-align'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'junegunn/vim-github-dashboard'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'junegunn/limelight.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()
