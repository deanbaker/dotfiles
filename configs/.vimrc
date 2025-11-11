" ============================================================================
" VIM CONFIGURATION
" ============================================================================
" Optimized for Java, Kotlin, Python, JavaScript development
" ============================================================================

" ----------------------------------------------------------------------------
" BASIC SETTINGS
" ----------------------------------------------------------------------------
set nocompatible              " Use Vim defaults (not Vi)
filetype off                  " Required for plugin loading

" Enable filetype detection and plugins
filetype plugin indent on
syntax enable

" General settings
set encoding=utf-8            " UTF-8 encoding
set number                    " Show line numbers
set relativenumber            " Relative line numbers for easier navigation
set cursorline                " Highlight current line
set showcmd                   " Show command in bottom bar
set wildmenu                  " Visual autocomplete for command menu
set showmatch                 " Highlight matching brackets
set laststatus=2              " Always show status line
set ruler                     " Show cursor position
set backspace=indent,eol,start " Backspace behavior

" Search settings
set incsearch                 " Search as characters are entered
set hlsearch                  " Highlight search matches
set ignorecase                " Case insensitive search
set smartcase                 " Case sensitive if uppercase present

" Indentation
set autoindent                " Auto indent
set smartindent               " Smart indent
set tabstop=4                 " Tab width
set shiftwidth=4              " Indent width
set expandtab                 " Use spaces instead of tabs
set smarttab                  " Smart tab behavior

" Performance
set lazyredraw                " Redraw only when needed
set ttyfast                   " Fast terminal connection
set updatetime=300            " Faster completion (default 4000ms)

" Backup and swap
set nobackup                  " No backup files
set nowritebackup             " No backup before overwriting
set noswapfile                " No swap files

" Split behavior
set splitbelow                " Horizontal splits below
set splitright                " Vertical splits to right

" Code folding
set foldmethod=indent         " Fold based on indentation
set foldlevel=99              " Open all folds by default

" Mouse support
set mouse=a                   " Enable mouse in all modes

" Clipboard
set clipboard=unnamed         " Use system clipboard

" Hidden buffers
set hidden                    " Allow hidden buffers

" ----------------------------------------------------------------------------
" PLUGIN MANAGER - VIM-PLUG
" ----------------------------------------------------------------------------
" Auto-install vim-plug if not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list
call plug#begin('~/.vim/plugged')

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Language support and completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'

" Linting and formatting
Plug 'dense-analysis/ale'

" Git integration
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Tmux integration
Plug 'christoomey/vim-tmux-navigator'

" UI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Code helpers
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Snippets
Plug 'honza/vim-snippets'

call plug#end()

" ----------------------------------------------------------------------------
" THEME AND APPEARANCE
" ----------------------------------------------------------------------------
set termguicolors             " Enable true colors
set background=dark

" Only set colorscheme if gruvbox is installed
silent! colorscheme gruvbox

" Airline configuration
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" ----------------------------------------------------------------------------
" KEY MAPPINGS
" ----------------------------------------------------------------------------
" Set leader key to space
let mapleader = " "

" Keep your existing mapping
nnoremap <C-q> <C-W>w

" Quick save and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Buffer navigation
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bd :bdelete<CR>

" Split management
nnoremap <leader>sv :vsplit<CR>
nnoremap <leader>sh :split<CR>

" Move lines up/down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" ----------------------------------------------------------------------------
" NERDTREE CONFIGURATION
" ----------------------------------------------------------------------------
" Toggle NERDTree
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>

" NERDTree settings
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.git$', '\.DS_Store$', '__pycache__', '\.pyc$', 'node_modules']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

" Auto-close NERDTree if it's the last window
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" ----------------------------------------------------------------------------
" FZF CONFIGURATION
" ----------------------------------------------------------------------------
" FZF mappings
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fl :Lines<CR>
nnoremap <leader>fr :Rg<CR>
nnoremap <leader>fh :History<CR>

" FZF layout
let g:fzf_layout = { 'down': '40%' }

" ----------------------------------------------------------------------------
" COC.NVIM CONFIGURATION
" ----------------------------------------------------------------------------
" CoC extensions (install manually with :CocInstall when needed)
" Disabled auto-install due to corporate network/registry issues
" Install individually as needed:
"   :CocInstall coc-json
"   :CocInstall coc-tsserver
"   :CocInstall coc-pyright (better than coc-python)
"   :CocInstall coc-java
" let g:coc_global_extensions = [
"   \ 'coc-json',
"   \ 'coc-tsserver',
"   \ 'coc-eslint',
"   \ 'coc-prettier',
"   \ 'coc-python',
"   \ 'coc-java',
"   \ 'coc-snippets',
"   \ ]

" Use tab for trigger completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show documentation
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Rename symbol
nmap <leader>rn <Plug>(coc-rename)

" Format code
nmap <leader>f <Plug>(coc-format)
xmap <leader>f <Plug>(coc-format-selected)

" Code actions
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Show all diagnostics
nnoremap <silent> <leader>d :<C-u>CocList diagnostics<cr>

" Navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" ----------------------------------------------------------------------------
" ALE CONFIGURATION
" ----------------------------------------------------------------------------
" ALE linters
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8', 'pylint'],
\   'java': ['checkstyle', 'javac'],
\   'kotlin': ['ktlint'],
\}

" ALE fixers
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint', 'prettier'],
\   'python': ['black', 'isort'],
\   'java': ['google_java_format'],
\   'kotlin': ['ktlint'],
\}

" ALE settings
let g:ale_fix_on_save = 0  " Set to 1 to auto-fix on save
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" ALE navigation
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>af :ALEFix<cr>

" ----------------------------------------------------------------------------
" GIT INTEGRATION
" ----------------------------------------------------------------------------
" Fugitive mappings
nnoremap <leader>gs :Git<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>
nnoremap <leader>gl :Git log<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gb :Git blame<CR>

" GitGutter settings
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_map_keys = 0

" GitGutter navigation
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" ----------------------------------------------------------------------------
" LANGUAGE-SPECIFIC SETTINGS
" ----------------------------------------------------------------------------
" Python
autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab

" JavaScript/TypeScript
autocmd FileType javascript,typescript,javascriptreact,typescriptreact setlocal tabstop=2 shiftwidth=2 expandtab

" Java
autocmd FileType java setlocal tabstop=4 shiftwidth=4 expandtab

" Kotlin
autocmd FileType kotlin setlocal tabstop=4 shiftwidth=4 expandtab

" ----------------------------------------------------------------------------
" TERMINAL INTEGRATION
" ----------------------------------------------------------------------------
" Terminal mode mappings
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Open terminal
nnoremap <leader>t :terminal<CR>
nnoremap <leader>tv :vertical terminal<CR>

" ----------------------------------------------------------------------------
" MISCELLANEOUS
" ----------------------------------------------------------------------------
" Auto-reload vimrc on save
autocmd! BufWritePost $MYVIMRC source $MYVIMRC

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" ----------------------------------------------------------------------------
" CUSTOM FUNCTIONS
" ----------------------------------------------------------------------------
" Toggle between relative and absolute line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>ln :call NumberToggle()<cr>

" ----------------------------------------------------------------------------
" NOTES
" ----------------------------------------------------------------------------
" After saving this file, run: :PlugInstall to install all plugins
" For CoC language servers, you may need to install additional tools:
"   - Node.js (for coc.nvim and JavaScript/TypeScript)
"   - Python language server: :CocInstall coc-pyright
"   - Java: Ensure JDK is installed
"   - Kotlin: ktlint for linting
"
" Key mappings cheat sheet:
"   <Space> = Leader key
"   <Leader>n = Toggle NERDTree
"   <Leader>ff = Find files (fzf)
"   <Leader>fr = Ripgrep search
"   gd = Go to definition
"   K = Show documentation
"   <Leader>rn = Rename symbol
"   <Leader>f = Format code
" ============================================================================
