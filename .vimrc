syntax on
so ~/.vim/plugins.vim


set showmode                    " always show what mode we're currently editing in
set nowrap                      " don't wrap lines
set tabstop=4                   " a tab is four spaces
set smarttab
set tags=tags
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
set autowrite                   "Save on buffer switch
set cindent
set number relativenumber
set clipboard=unnamedplus
set nocompatible
set smartindent

set tags+=tags,tags.vendors

execute "set <M-b>=\eb"
execute "set <M-q>=^[q"

"-------------Split Management--------------"
set splitbelow	"Make splits default to below...
set splitright	"And to the right. This feels more natural.



"-------Fast saves-----------------"
let mapleader = ','  "The default is \, but a comma is much better.
nmap <Leader>w :w!<cr>


"-------------Terminal Opening Vertical and Horizontal--------"
map <Leader>t :vertical :term ++close<cr>
tmap <Leader>t <c-w>:vertical :term ++close<cr>
map <Leader>d :term ++close<cr>
tmap <Leader>d <c-w>:term ++close<cr>

"---------Insert mode on termninal--------"
tnoremap <Leader>b <c-\><c-n>




"---------Edit from the Currently Working Directory--------"
nmap :ed :edit %:p:h/

"-------Autocomplete Characters-----------------"
inoremap  { {}<Left>
inoremap  ( ()<Left>
inoremap  [ []<Left>
inoremap  " ""<Left>
inoremap  ' ''<Left>
inoremap  ` ``<Left>


"-----This runs the full PHPUnit suite-------"
"nnoremap ,t :!phpunit<cr>


"----This runs the test method under the cursor------"
"nmap ,tm ?functionwviwy:!phpunit --filter <c-r>"<CR>

"--------Insert Mode cursor movementa--------"
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"We'll set simpler mappings to switch between splits.
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-H> <C-W><C-H>
nmap <C-L> <C-W><C-L>


"-------------Palenight color scheme--------"
"set background=light
"colorscheme palenight

"-------------palenight color scheme--------"
"set background=dark
"colorscheme oceanic_material

"-------------Awesome color scheme--------"
set background=dark
colorscheme iceberg

"-------------Awesome light color scheme--------"
"set background=light
"colorscheme iceberg

"-------------Awesome light color scheme--------"
"set background=light
"colorscheme lucius


"-------------Gruvbox color scheme--------"
"set background=light
"let g:gruvbox_material_better_performance = 1
"colorscheme gruvbox-material

"-------------Visuals-------------"
"set t_co=256
"colorscheme atom-dark-256


"-------------Carbono color scheme--------"
"colorscheme carbon
"highlight LineNr guifg=#00af87          "Dark Green Color"
highlight LineNr guifg=#af87af          "Dark Grey Color"


"-------------NERDTree Settings--------"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=50




"Make NERDTree easier to toggle.
nmap <M-b> :NERDTreeToggle<CR>

nmap <C-R> :CtrlPBufTag<CR>
nmap <D-e> :CtrlPMRUFiles<CR>


"-------------Duplicate Line Below--------------"
" duplicate line in normal mode:
nnoremap <C-D> Yp
" duplicate line in insert mode:
inoremap <C-D> <Esc> Ypi


"-------------Copy paste to clipboard--------------"
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p



"Variables
let g:mapleader = ","
let NERDTreeHijackNetrw = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'
let g:ctrlp_working_path_mode = 'r'
let g:coc_disable_startup_warning = 1
let g:auto_save = 1
"let g:user_emmet_mode='a'
let g:user_emmet_leader_key=','
let g:auto_save_silent = 1
let g:palenight_terminal_italics=1
"let g:NERDTreeWinPos = "right"
let g:snipMate = { 'snippet_version' : 1 }
let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing
let g:snipMate.scope_aliases = {}
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:indentguides_spacechar = '┆'
let g:indentguides_tabchar = '|'




"-----------Change the cursor visuals on differen modes---------------"
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


autocmd BufNewFile,BufRead *.blade.php setlocal ft=html


" I don't want to pull up these folders/files when calling CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/public/**
set wildignore+=*/deps/*,*/_build/*



"------------Plug---------------"
call plug#begin()
    Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    Plug 'amiralies/coc-elixir', {'do': 'yarn install && yarn prepack'}
    Plug 'yaegassy/coc-blade', {'do': 'yarn install --frozen-lockfile'}
    Plug 'marlonfan/coc-phpls'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'dense-analysis/ale'
call plug#end()

" Install Coc extensions for Elixir, Ruby, Rust, Typescript and VimL
let g:coc_global_extensions = ['coc-elixir', 'coc-solargraph', 'coc-rls', 'coc-tsserver', 'coc-vimlsp']

" Automatically format Elixir, Rust and Typescript files on save
"let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["php", "elixir", "rust", "typescript", "javascript"]}
let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["*"]}

"------------Search---------------"
set incsearch

"------------Elixir---------------"
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir


""autocmd FileType javascript autocmd BufWritePost <buffer> call JsBeautify()



"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.
augroup autosourcing
  autocmd!
  autocmd BufWritePost .vimrc source %
augroup END


"-------------Auto Import Namespaces--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

"-------------Auto Import with Enter Key in Coc--------------"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
