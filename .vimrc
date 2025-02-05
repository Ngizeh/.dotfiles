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
set linespace=20
set ignorecase smartcase
set tags+=tags,tags.vendors
set splitbelow	                 "Make splits default to below...
set splitright	                  "And to the right. This feels more natural.
set termguicolors


execute "set <M-b>=\eb"
execute "set <M-q>=^[q"

autocmd FileType javascript set shiftwidth=4 tabstop=4 softtabstop=4




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



"-----This runs the full Test suite-------"
nmap <silent> <Leader>tn :TestNearest<CR>
nmap <silent> <Leader>tf :TestFile<CR>
nmap <silent> <Leader>ts :TestSuite<CR>
nmap <silent> <Leader>tl :TestLast<CR>
nmap <silent> <Leader>tg :TestVisit<CR>
nmap <silent> <Leader>tt :FloatermToggle<CR>


 function! PhpUnitTransform(cmd) abort
     return join(map(split(a:cmd), 'v:val == "--colors" ? "--colors=always" : v:val'))
 endfunction

 let g:test#custom_transformations = {'phpunit': function('PhpUnitTransform')}
 let g:test#transformation = 'phpunit'

 " let test#php#phpunit#options = '--colors=always'
 let test#php#pest#options = '-v'
 let test#javascript#jest#options = '--color'

function! FloatermStrategy(cmd)
    execute 'silent FloatermKill'
    execute 'FloatermNew! '.a:cmd.' | less -X'
endfunction

let test#custom_strategies = {'floaterm' : function('FloatermStrategy')}
let test#strategy = "floaterm"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Visual'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'StatusLineNC'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


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



function! IsHexColorLight(color) abort
  let l:raw_color = trim(a:color, '#')

  let l:red = str2nr(substitute(l:raw_color, '(.{2}).{4}', '1', 'g'), 16)
  let l:green = str2nr(substitute(l:raw_color, '.{2}(.{2}).{2}', '1', 'g'), 16)
  let l:blue = str2nr(substitute(l:raw_color, '.{4}(.{2})', '1', 'g'), 16)

  let l:brightness = ((l:red * 299) + (l:green * 587) + (l:blue * 114)) / 1000

  return l:brightness > 155
endfunction


"-------------Visuals---------------------------"

"-------------Awesome light color scheme--------"
"set background=light
"colorscheme iceberg
"colorscheme lucius

"-------------Awesome dark color scheme--------"
set background=dark
"colorscheme hybrid_reverse

"-------------Palenight light color scheme--------"
"set background=light
"colorscheme palenight

"-------------Best Choice dark color scheme--------"
"set background=dark
colorscheme oceanic_material



"set t_co=256
"colorscheme atom-dark-256


"-------------Carbon color scheme--------"
"colorscheme carbon


"highlight LineNr fg=#00af87          "Dark Green Color
"highlight LineNr fg=#af87af          "Dark Grey Color"

"-------------NERDTree Settings--------"
let NERDTreeShowHidden=1
let g:NERDTreeWinSize=40




"Make NERDTree easier to toggle.
nmap <M-b> :NERDTreeToggle<CR>

"---------ignore files in nerd tree-------------"
let NERDTreeIgnore=['\.DS_Store$', '\.git$', '\.idea$', '\.phpintel', '\.elixir_ls', '_build', '\.angular', '\.vscode', '\.elixir-tools']

nmap <C-R> :CtrlPBufTag<CR>
nmap <D-e> :CtrlPMRUFiles<CR>


"-------------Duplicate Line Below--------------"
" duplicate line in normal mode:
nnoremap <C-D> Yp
" duplicate line in insert mode:
inoremap <C-D> <Esc> Ypi


"-------------Copy paste to clipboard--------------"
vnoremap <Leader>y "*y
vnoremap <Leader>p "*p
vnoremap <Leader>y "+Y
vnoremap <Leader>p "+P



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
let g:indentdes_spacechar = '┆'
let g:indentdes_tabchar = '|'




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
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
call plug#end()

" Install Coc extensions for Elixir, Ruby, Rust, Typescript and VimL
let g:coc_global_extensions = ['coc-elixir', 'coc-solargraph', 'coc-rls', 'coc-tsserver', 'coc-vimlsp']

" Automatically format Elixir, Rust and Typescript files on save
"let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["php", "elixir", "rust", "typescript", "javascript"]}
let g:coc_user_config = {"coc.preferences.formatOnSaveFiletypes": ["*"]}


"Scroll the Popup documentation in Coc"
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

"------------Search---------------"
set incsearch

"------------Elixir---------------"
au BufRead,BufNewFile *.ex,*.exs set filetype=elixir
au BufRead,BufNewFile *.eex,*.heex,*.leex,*.sface,*.lexs set filetype=eelixir
au BufRead,BufNewFile mix.lock set filetype=elixir


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


" Coc --- GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

