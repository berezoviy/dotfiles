call plug#begin(expand('~/.config/nvim/plugged'))

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  :" Visual Plugins
  Plug 'mhinz/vim-startify'                  | " Startup screen
  Plug 'nathanaelkane/vim-indent-guides'     | " Show indentation
  Plug 'ryanoasis/vim-devicons'              | " Dev icons
  Plug 'vim-airline/vim-airline'             | " Airline
  Plug 'vim-airline/vim-airline-themes'      | " Status line
  Plug 'psliwka/vim-smoothie'                | " Nicer scrolling

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  
  " Tool Plugins
  Plug 'dstein64/vim-startuptime'        | " Measure startuptime
  Plug 'duggiefresh/vim-easydir'         | " Crete files in dirs that don't exist
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-renderer-devicons.vim'

  
  " Code Formatting Plugins {{{
  Plug 'editorconfig/editorconfig-vim'      | " Import tabs etc from editorconfig

  " Syntax Plugins
  Plug 'sheerun/vim-polyglot'
  Plug 'ekalinin/dockerfile.vim'     | " Syntax for Dockerfile
  Plug 'tmux-plugins/vim-tmux'       | " Syntax for Tmux conf files

  Plug 'honza/vim-snippets'

  Plug 'ayu-theme/ayu-vim'
  Plug 'morhetz/gruvbox'
  Plug 'yuki-ycino/fzf-preview.vim'
  Plug 'bogado/file-line'
  Plug 'shougo/neomru.vim'
  Plug 'ryanoasis/vim-devicons'

call plug#end()

let g:fern#renderer = "devicons"

let ayucolor="light" " for mirage version of theme
let g:gruvbox_contrast_light="hard"
set background=light
colorscheme gruvbox 
" colorscheme gruvbox

" Hides buffers instead of closing them
set hidden

" Don't show last command
set noshowcmd

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" ============================================================================ "
" ===                                 COC                                  === "
" ============================================================================ "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Backups
set nobackup
set nowritebackup

set cmdheight=2

set updatetime=300

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

"Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let mapleader=";"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

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

let g:coc_snippet_next = '<tab>'
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Save file
nnoremap <silent> <Leader>w :write<CR>

" Reload vim config
nmap <Leader>R :so $MYVIMRC<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <Leader>p :FzfPreviewProjectFiles<CR>  
nmap <Leader>F :FzfPreviewProjectGrep<CR>  
nmap <leader>b :Fern . -drawer<CR>:set norelativenumber nonumber<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)


" Open the vimrc file anytime
noremap <leader>rc :e ~/.config/nvim/init.vim<CR>

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" use `:SI` for organize import of current buffer
command! -nargs=0 SI   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" === Search === "
" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Enable line numbers
set number

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse " " top to bottom

" use rg by default
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


" floating fzf window with borders
function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

" Files + devicons + floating fzf
function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --theme="OneHalfDark" --style=numbers,changes --color always {2..-1}"'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m --reverse ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': 'call CreateCenteredFloatingWindow()'})

endfunction
