let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin(expand('~/.config/nvim/plugged'))

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'yuki-ycino/fzf-preview.vim', { 'do': ':FzfPreviewInstall' }
  Plug 'liuchengxu/vim-clap'
  
  " Visual Plugins
  Plug 'mhinz/vim-startify'                  | " Startup screen
  Plug 'ryanoasis/vim-devicons'              | " Dev icons
  Plug 'vim-airline/vim-airline'             | " Airline
  Plug 'vim-airline/vim-airline-themes'      | " Status line
  Plug 'psliwka/vim-smoothie'                | " Nicer scrolling

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " Tool Plugins
  Plug 'dstein64/vim-startuptime'        | " Measure startuptime
  Plug 'duggiefresh/vim-easydir'         | " Crete files in dirs that dont exist
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-renderer-devicons.vim'
  Plug 'unblevable/quick-scope'          | " Highlight for a unique character in every word on a line to help you use f, F and family
  Plug 'moll/vim-bbye'                   | " Delete buffers without closing windows or messing up layout
  Plug 'ap/vim-buftabline'               | " Buffer list that lives in the tabline
  Plug 'easymotion/vim-easymotion'
  
  Plug 'editorconfig/editorconfig-vim'      | " Import tabs etc from editorconfig

  " Syntax Plugins
  Plug 'sheerun/vim-polyglot'
  Plug 'ekalinin/dockerfile.vim'     | " Syntax for Dockerfile
  Plug 'alcesleo/vim-uppercase-sql'  | " Uppercase in sql files

  Plug 'SirVer/ultisnips'
  Plug 'bogado/file-line' | " Opening a file in a given line

call plug#end()

let mapleader=";"

let g:gruvbox_contrast_light="hard"
let g:airline_theme="papercolor"
let g:fern#renderer = "devicons"

set background=light
colorscheme gruvbox 

set hidden        " Hides buffers instead of closing them
set noshowcmd     " Don't show last command
set softtabstop=2 " Change number of spaces that a <Tab> counts for during editing ops
set shiftwidth=2  " Indentation amount for < and > commands.
" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab autoindent            " Tab key actions
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set incsearch ignorecase smartcase hlsearch             " Highlight text while searching
set fillchars+=vert:\▏                                  " Requires a patched nerd font
set wrap breakindent                                    " Wrap long lines to the width set by tw
set tw=90                                               " Auto wrap lines that are longer than that
set emoji                                               " Enable emojis
set clipboard+=unnamedplus                              " Use the clipboard as the default register
set termguicolors                                       " Enable true color support
cmap w!! w !sudo tee %                                  " Allow to save files you opened without write permissions via sudo
set number                                              " Enable line numbers
let g:indentLine_setConceal = 0                         " Actually fix the annoying markdown links conversion
au BufEnter * set fo-=c fo-=r fo-=o                     " Stop annoying auto commenting on new lines
set title                                               " Tab title as file name
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set viminfo='1000

hi clear CursorLineNr                                   " use the theme color for relative number
hi CursorLineNr gui=bold                                " make relative number bold

" Performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" ============================================================================ "
" ===                                 COC                                  === "
" ============================================================================ "

" list of the extensions required
let g:coc_global_extensions = [
            \'coc-css',
            \'coc-html',
            \'coc-json',
            \'coc-lists',
            \'coc-pairs',
            \'coc-prettier',
            \'coc-snippets',
            \'coc-syntax',
            \'coc-tabnine',
            \'coc-tsserver',
            \'coc-ultisnips',
            \'coc-yank',
            \]

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

hi CocInfoSign  ctermfg=Blue guifg=#0EBFE9

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visul placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<tab>'
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<S-tab>'

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" use `:SI` for organize import of current buffer
command! -nargs=0 SI   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Quickly open config files
noremap <leader>rc :e ~/.config/nvim/init.vim<CR>
noremap <leader>rz :e ~/.zshrc<CR>
noremap <leader>rx :e ~/.config/kitty/kitty.conf<CR>

" Save file
nnoremap <silent> <Leader>w :write<CR>
nnoremap <silent> <Leader>q :q<CR>

" Select all lines
nnoremap <C-A> ggVG<CR>

nnoremap <C-S> :write<CR>
nnoremap <C-W> :Bwipeout<CR>
nnoremap <C-Q> :bufdo :Bwipeout<CR>

" Tabs
nnoremap <C-V> :bp<CR>
nnoremap <C-F> :bn<CR>

" Clear search highlight
nnoremap <ESC> :noh<CR><ESC>

" Replace word from 0 register
nnoremap <C-p> cw<C-r>0<ESC>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <Leader>j :FzfPreviewProjectFiles<CR>  
nmap <Leader>k :FzfPreviewProjectGrep .<CR>  
nmap <Leader>l :FzfPreviewMrwFiles<CR>  
nmap <leader>b :Fern . -drawer <CR>:set norelativenumber nonumber<CR>

" Switch between splits using ctrl + {h,j,k,l}
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Bubble single lines(move)
nmap <C-Up> :m .-2<CR>
nmap <C-Down> :m  .+1<CR>

" Bubble multiple lines
vnoremap <silent> <C-Up>  @='"zxk"zP`[V`]'<CR>
vnoremap <silent> <C-Down>  @='"zx"zp`[V`]'<CR>

" Reload vim config
nmap <Leader>R :so $MYVIMRC<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-l>"

" Quickscope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#552b8c' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#a001a0' gui=underline ctermfg=81 cterm=underline

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif

" Relative numbers on normal mode only
augroup numbertoggle
  autocmd!
  autocmd InsertLeave * set relativenumber
  autocmd InsertEnter * set norelativenumber
augroup END

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let g:fzf_preview_buffers_jump = 1
let g:fzf_preview_command='bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}'
let g:fzf_preview_lines_command = 'bat --color=always --theme="ansi-dark" --style=grid --plain'
let g:fzf_preview_grep_cmd='rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" ".shellescape(<q-args>)."| tr -d "\017"'
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_dev_icon_prefix_string_length = 3