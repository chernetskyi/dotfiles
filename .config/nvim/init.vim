" Plugins {{{
call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'preservim/nerdtree' |
    \ Plug 'Xuyuanp/nerdtree-git-plugin' |
    \ Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'arcticicestudio/nord-vim'
call plug#end()

packadd! matchit

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeGitStatusUseNerdFonts = 1
command NE :NERDTreeToggle

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_section_y = ''
" }}}

" Colors {{{
colorscheme nord
let g:nord_cursor_line_number_background = 1
let g:nord_italic = 1
let g:nord_italic_comments = 1
set termguicolors
syntax enable
" }}}

" UI {{{
set cursorline
set lazyredraw
set list
set listchars=tab:-->,space:·
set noshowmode
set nowrap
set number
set numberwidth=1
set scrolloff=4
set showcmd
set showmatch
set sidescrolloff=4
set splitbelow
set splitright
set wildmenu
set wildmode=list:longest
" }}}

" Indentation {{{
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
set tabstop=4
" }}}

" Folding {{{
set foldlevelstart=99
set foldmethod=indent
" }}}

" Search {{{
set ignorecase
set nohlsearch
set smartcase
" }}}

" Movement {{{
nnoremap Y y$

nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap! <Up> <Nop>
noremap! <Down> <Nop>
noremap! <Left> <Nop>
noremap! <Right> <Nop>
" }}}

" Undo break points {{{
inoremap . .<c-g>u
inoremap , ,<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap = =<c-g>u
inoremap : :<c-g>u
inoremap ; ;<c-g>u
" }}}

" History {{{
set nobackup
set noswapfile
set nowritebackup
" }}}

" Misc {{{
filetype plugin on
filetype indent on

set confirm
set hidden
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКІЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкіегмцчня;abcdefghijklmnopqrstuvwxyz
set modeline
set modelines=1
" }}}

" Autogroups {{{
augroup map-capslock-to-esc
    autocmd VimEnter * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'
    autocmd VimLeave * silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'
augroup END

augroup vimrc-incsearch-highlight
    autocmd!
    autocmd CmdlineEnter /,\? :set hlsearch
    autocmd CmdlineLeave /,\? :set nohlsearch
augroup END

" Exit Vim if NERDTree is the only window remaining in the only tab.
augroup nerdtree-exit-vim
    autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
augroup END

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
augroup nerdtree-stay-in-window
    autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
augroup END
" }}}

" vim:foldmethod=marker:foldlevel=0
