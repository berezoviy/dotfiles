call plug#begin(expand('~/.config/nvim/plugged'))

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  
  :" Visual Plugins
  Plug 'mhinz/vim-startify'                  | " Startup screen
  Plug 'nathanaelkane/vim-indent-guides'     | " Show indentation
  Plug 'neoclide/coc-highlight'              | " Displays hex colors in actual color
  Plug 'ryanoasis/vim-devicons'              | " Dev icons
  Plug 'vim-airline/vim-airline'             | " Airline
  Plug 'vim-airline/vim-airline-themes'      | " Status line
  Plug 'psliwka/vim-smoothie'                | " Nicer scrolling
  
  " Tool Plugins
  Plug 'dstein64/vim-startuptime'        | " Measure startuptime
  Plug 'duggiefresh/vim-easydir'         | " Crete files in dirs that don't exist
  Plug 'inkarkat/vim-ingo-library'       | " Spellcheck dependency
  Plug 'inkarkat/vim-spellcheck'         | " Spelling errors to quickfix list
  Plug 'inkarkat/vim-spellcheck'         | " Spelling errors to quickfix list

  " CoC Plugins {{{
  Plug 'neoclide/coc.nvim',     { 'branch': 'release' }
  Plug 'neoclide/coc-css',      | " CSS language server
  Plug 'neoclide/coc-eslint',   | " Eslint integration
  Plug 'neoclide/coc-html',     | " Html language server
  Plug 'neoclide/coc-json',     | " JSON language server
  Plug 'neoclide/coc-lists',    | " Arbitrary lists
  Plug 'neoclide/coc-pairs',    | " Auto-insert language aware pairs
  Plug 'neoclide/coc-snippets', | " Provides snippets
  Plug 'neoclide/coc-tslint',   | " Tslint integration
  Plug 'neoclide/coc-tsserver', | " TypeScript language server
  
  " Code Formatting Plugins {{{
  Plug 'editorconfig/editorconfig-vim'      | " Import tabs etc from editorconfig
  Plug 'neoclide/coc-prettier' | " Prettier for COC

  " Syntax Plugins
  Plug 'sheerun/vim-polyglot'
  Plug 'ekalinin/dockerfile.vim'     | " Syntax for Dockerfile
  Plug 'tmux-plugins/vim-tmux'       | " Syntax for Tmux conf files

  Plug 'ayu-theme/ayu-vim'
  Plug 'morhetz/gruvbox'
  Plug 'yuki-ycino/fzf-preview.vim'
  Plug 'bogado/file-line'
  Plug 'shougo/neomru.vim'

call plug#end()

let ayucolor="mirage" " for mirage version of theme
colorscheme ayu
" colorscheme gruvbox

" Hides buffers instead of closing them
set hidden

" Don't show last command
set noshowcmd

" Change number of spaces that a <Tab> counts for during editing ops
set softtabstop=2

" Indentation amount for < and > commands.
set shiftwidth=2


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

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Open lazygit
nnoremap <silent> <Leader>' :call OpenTerm('lazygit', 0.8)<CR>

" Save file
nnoremap <silent> <Leader>w! :write<CR>

" Reload vim config
nmap <Leader>R :so $MYVIMRC<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

nmap <Leader>p :FzfPreviewProjectFiles<CR>  
nmap <Leader>F :FzfPreviewProjectGrep<CR>  

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
function! LayoutTerm(size, orientation) abort
  let timeout = 16.0
  let animation_total = 150.0
  let timer = {
    \ 'size': a:size,
    \ 'step': 1,
    \ 'steps': animation_total / timeout
  \}

  if a:orientation == 'horizontal'
    resize 1
    function! timer.f(timer)
      execute 'resize ' . string(&lines * self.size * (self.step / self.steps))
      let self.step += 1
    endfunction
  else
    vertical resize 1
    function! timer.f(timer)
      execute 'vertical resize ' . string(&columns * self.size * (self.step / self.steps))
      let self.step += 1
    endfunction
  endif
  call timer_start(float2nr(timeout), timer.f, {'repeat': float2nr(timer.steps)})
endfunction

" Open autoclosing terminal, with optional size and orientation
function! OpenTerm(cmd, ...) abort
  let orientation = get(a:, 2, 'horizontal')
  if orientation == 'horizontal'
    new | wincmd J
  else
    vnew | wincmd L
  endif
  call LayoutTerm(get(a:, 1, 0.5), orientation)
  call termopen(a:cmd, {'on_exit': {j,c,e -> execute('if c == 0 | close | endif')}})
endfunction
