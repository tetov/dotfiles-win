" pre plugins
set nocompatible " get rid of Vi compatibility mode. SET FIRST!

if !exists('g:vscode')
  let g:ale_disable_lsp = 1
  let g:coc_global_extensions = [
  \   '@yaegassy/coc-ansible',
  \   'coc-pairs',
  \   'coc-clang-format-style-options',
  \   'coc-clangd',
  \   'coc-css',
  \   'coc-docker',
  \   'coc-git',
  \   'coc-highlight',
  \   'coc-html',
  \   'coc-json',
  \   'coc-lists',
  \   'coc-markdownlint',
  \   'coc-prettier',
  \   'coc-pydocstring',
  \   'coc-pyright',
  \   'coc-sh',
  \   'coc-svg',
  \   'coc-toml',
  \   'coc-vimlsp',
  \   'coc-xml',
  \   'coc-yaml',
  \]

  " Automatic installation vim-plug
  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
endif

" vim-plug configuration
let plugged_dir = has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged'
call plug#begin(plugged_dir)

if exists('g:vscode')
  " Only for vscode
  Plug 'asvetliakov/vim-easymotion', { 'as': 'vsc-easymotion' }
else
  " for vim and nvim but not in vscode

  " Plug 'dense-analysis/ale'
  Plug 'ChesleyTan/wordCount.vim'
  Plug 'MikeDacre/tmux-zsh-vim-titles'
  Plug 'airblade/vim-gitgutter'
  Plug 'bkad/CamelCaseMotion'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'dbeniamine/todo.txt-vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'godlygeek/tabular'
  Plug 'itchyny/lightline.vim'
  Plug 'jeffkreeftmeijer/vim-numbertoggle'
  Plug 'jreybert/vimagit'                  " Commit chunks and more
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'kevinoid/vim-jsonc'
  Plug 'kopischke/vim-stay'                " Remembers cursor locations in buffers
  Plug 'maximbaz/lightline-ale'
  Plug 'mengelbrecht/lightline-bufferline'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'puremourning/vimspector', {'do': ':VimspectorInstall --all'}
  Plug 'qpkorr/vim-renamer'                " Bulk rename in vim
  Plug 'quentindecock/vim-cucumber-align-pipes'
  Plug 'samoshkin/vim-mergetool'           " Mergetool
  Plug 'sheerun/vim-wombat-scheme'
  Plug 'tpope/vim-commentary'              " Comment and uncomment
  Plug 'tpope/vim-fugitive'                " Git
  Plug 'tpope/vim-repeat'                  " Allows repetition (with .) for plugin commands
  Plug 'tpope/vim-sensible'                " Sensible standards
  Plug 'tpope/vim-sleuth'                  " Guess tab width
  Plug 'tpope/vim-surround'                " Operate on surrounding characters
  Plug 'tpope/vim-unimpaired'
  Plug 'tpope/vim-vinegar'
  Plug 'vim-pandoc/vim-pandoc'
  Plug 'vim-pandoc/vim-pandoc-syntax'
  Plug 'wellle/tmux-complete.vim'
  Plug 'wincent/terminus'

  if has('nvim')
    " only for nvim
    Plug 'ryanoasis/vim-devicons'
  else
    " only for vim
    Plug 'sheerun/vim-polyglot'              " Lots of more syntax highlighting
    Plug 'tpope/vim-dispatch'
    Plug 'tmux-plugins/vim-tmux-focus-events' " For shared vim tmux clipboard

  endif
endif

call plug#end()

" builtin opts
set ffs=unix,dos,mac
set hidden
set updatetime=300
set shortmess+=c
set signcolumn=yes
" gVIM
set guioptions=g

" TABS
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4
set expandtab               " tabs are spaces

set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=                   " See :h cinoptions-values
set copyindent              " Make autoindent use the same chars as prev line

" General UI
set number relativenumber   " Show relative number and normal number.
set showcmd                 " show command in bottom bar
set cursorline              " highlight current line
set cursorcolumn            " highlight current column
filetype indent on          " load filetype-specific indent files
set lazyredraw              " redraw only when we need to.
set showmatch               " highlight matching [{()}]
set wrap                    " Wrap lines
set textwidth=0             " No automatic breaks
set linebreak               " Break long lines by word, not char
set scrolloff=20            " Lines to keep visible below and above
let g:EditorConfig_max_line_indicator = "none"
let &colorcolumn=80

" SEARCH
set hlsearch                " highlight matches
set ignorecase              " Make searches case-insensitive.

" Leader key
let mapleader = ","
let maplocalleader = ","

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" Enter and backspaces moves through paragraphs in normal mode
nnoremap <BS> {
onoremap <BS> {
vnoremap <BS> {

nnoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
onoremap <expr> <CR> empty(&buftype) ? '}' : '<CR>'
vnoremap <CR> }

colorscheme wombat

" CamelCaseMotion
let g:camelcasemotion_key = '<leader>'

" Python
autocmd FileType python setlocal indentkeys-=<:>

if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

else
  set clipboard^=unnamed,unnamedplus

  " folding
  set foldenable                    " enable folding
  set foldlevelstart=10             " open most folds by default
  set foldnestmax=10                " 10 nested fold max
  set foldmethod=indent
  let g:markdown_folding=1

  " space open/closes folds
  nnoremap <space> za

  " edit/source vimrc
  nmap <leader>ev :edit $MYVIMRC <CR>
  nmap <leader>es :so $MYVIMRC <CR>


  " spell
  set rtp+=/usr/share/vim/vimfiles/
  set rtp+=~/.vim/spell/
  set spell spl=sv,en " Select language
  set nospell " Turn it off at start
  nmap <F7> :set spell! <CR>

  " No undercurls thanks
  hi SpellBad ctermfg=117 ctermbg=203 guifg=#8ac6f2 guibg=#e5786d
  hi SpellCap ctermfg=240 ctermbg=180 guifg=#585858 guibg=#cae682
  hi SpellRare ctermfg=203 ctermbg=117 guifg=#e5786d guibg=#8ac6f2
  hi SpellLocal ctermfg=252 ctermbg=235 guifg=#d0d0d0 guibg=#242424

  " Open last file edited
  nmap <C-e> :e#<CR>

  " Move between open buffers.
  nmap <C-n> :bnext<CR>
  nmap <C-p> :bprev<CR>
  " Built in fuzzy find from https://github.com/mcantor/no_plugins
  set path+=**

  " Tweaks for netrw (file-browser) from https://github.com/mcantor/no_plugins
  let g:netrw_banner=0        " disable annoying banner
  let g:netrw_altv=1          " open splits to the right
  let g:netrw_liststyle=3     " tree view
  let g:netrw_winsize = 25
  let g:netrw_dirhistmax=0    " no history file


  " BACKUP
  set backup
  set swapfile
  set writebackup
  set undofile

  " append timestamp to backup files
  au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

  if !has('win32')

    if has('nvim')
      silent execute '!mkdir -p "'.$HOME.'/.local/share/nvim/backup"'
      silent execute '!mkdir -p "'.$HOME.'/.local/share/nvim/swp"'
      silent execute '!mkdir -p "'.$HOME.'/.local/share/nvim/undo"'

      set backupdir=~/.local/share/nvim/backup//
      set directory=~/.local/share/nvim/swp//
      set undodir=~/.local/share/nvim/undo//

      set pyxversion=3

    else
      silent execute '!mkdir -p "'.$HOME.'/.vim/backup"'
      silent execute '!mkdir -p "'.$HOME.'/.vim/swp"'
      silent execute '!mkdir -p "'.$HOME.'/.vim/undo"'

      set backupdir=~/.vim/backup//
      set directory=~/.vim/swp//
      set undodir=~/.vim/undo//

    endif
  endif

  " " Remaps split movement to CTRL + hjkl
  " nnoremap <C-J> <C-W><C-J>
  " nnoremap <C-K> <C-W><C-K>
  " nnoremap <C-L> <C-W><C-L>
  " nnoremap <C-H> <C-W><C-H>

  " Set tab to 2 spaces for some filetypes
  autocmd FileType html setlocal sw=2 sts=2
  autocmd FileType js setlocal sw=2 sts=2
  autocmd FileType jsx setlocal sw=2 sts=2
  autocmd FileType json setlocal sw=2 sts=2
  autocmd FileType yaml setlocal sw=2 sts=2
  autocmd FileType yaml.ansible setlocal sw=2 sts=2
  autocmd FileType toml setlocal sw=2 sts=2

  " Set filetype to yaml.ansible on inventory/hosts file
  augroup ansible_vim_fthosts
    autocmd!
    autocmd BufNewFile,BufRead hosts setfiletype yaml.ansible
  augroup END

  " Open splits to the right and below
  set splitbelow
  set splitright

  " Allow saving of files as sudo when I forgot to start vim using sudo.
  " https://stackoverflow.com/a/7078429
  cmap w!! w !sudo tee > /dev/null %

  " PLUGINS

  " vimspector
  let g:vimspector_enable_mappings = 'HUMAN'

  " fzf
  if executable('rg')
    set grepprg='rg\ --vimgrep\ --smart-case\ --follow\ --hidden'


  function! RipgrepFzf(query, fullscreen)
    let command_fmt = 'rg --hidden --column --line-number --no-heading --color=always --smart-case -- %s || true'
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
  endfunction

  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
  endif

  " Mapping selecting mappings
  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  nnoremap <silent> <C-p> :Files<CR>
  nnoremap <silent> <Leader>b :Buffers<CR>
  nnoremap <silent> <Leader>f :RG<CR>
  nnoremap <silent> <Leader>/ :BLines<CR>
  nnoremap <silent> <Leader>' :Marks<CR>
  nnoremap <silent> <Leader>g :Commits<CR>
  nnoremap <silent> <Leader>H :Helptags<CR>
  nnoremap <silent> <Leader>hh :History<CR>
  nnoremap <silent> <Leader>h: :History:<CR>
  nnoremap <silent> <Leader>h/ :History/<CR>

  " gitgutter
  highlight! link SignColumn LineNr
  let g:gitgutter_set_sign_backgrounds = 1


  " COC

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
      call CocActionAsync('doHover')
    else
      execute '!' . &keywordprg . " " . expand('<cword>')
    endif
  endfunction

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call <SID>show_documentation()<CR>

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>fs  <Plug>(coc-format-selected)
  nmap <leader>fs  <Plug>(coc-format-selected)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocAction('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  let g:coc_filetype_map = {
    \ 'yaml.ansible': 'ansible',
    \ }

  " Settings for vim-stay, what to save between sessions
  set viewoptions=cursor,slash,unix

  " SuperTab
  let g:SuperTabDefaultCompletionType = "<c-n>"
  let g:SuperTabContextDefaultCompletionType = "<c-n>"

  " Pandoc
  " make markdown files not appears as pandoc files to w0rp/ale
  let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
  let g:pandoc#folding#fold_yaml=1
  let g:pandoc#folding#fdc=0
  let g:pandoc#formatting#textwidth=80
  let g:pandoc#formatting#mode="a"

  " ALE
  let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'python': ['autopep8', 'isort'],
  \   'css': ['prettier', 'stylelint'],
  \   'html': ['tidy'],
  \   'sh': ['shfmt'],
  \   'json': ['prettier'],
  \}

  nmap ]a :ALENextWrap<CR>
  nmap [a :ALEPreviousWrap<CR>
  nmap ]A :ALELast
  nmap [A :ALEFirst

  nmap <F8> <Plug>(ale_fix)

  " Lightline
  set noshowmode  " don't show vim mode in cmd line

  let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \       'left': [
  \           ['mode', 'paste'],
  \           ['venv', 'gitbranch', 'filename', 'modified']
  \       ],
  \       'right': [
  \           ['lineinfo'],
  \           ['percent'],
  \           ['fileformat', 'fileencoding', 'filetype'],
  \           ['readonly', 'cocstatus', 'currentfunction'],
  \           ['linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok']
  \       ]
  \   },
  \   'component_function': {
  \       'gitbranch': 'fugitive#head',
  \       'venv': 'virtualenv#statusline',
  \   },
  \   'component_type': {
  \       'buffers': 'tabsel',
  \       'readonly': 'error',
  \       'linter_checking': 'right',
  \       'linter_infos': 'right',
  \       'linter_warnings': 'warning',
  \       'linter_errors': 'error',
  \       'linter_ok': 'right',
  \   },
  \   'component_expand': {
  \       'linter_checking': 'lightline#ale#checking',
  \       'linter_infos': 'lightline#ale#infos',
  \       'linter_warnings': 'lightline#ale#warnings',
  \       'linter_errors': 'lightline#ale#errors',
  \       'linter_ok': 'lightline#ale#ok',
  \       'buffers':'lightline#bufferline#buffers'
  \   },
  \}

  let g:lightline#ale#indicator_checking = "\uf110"
  let g:lightline#ale#indicator_infos = "\uf129"
  let g:lightline#ale#indicator_warnings = "\uf071"
  let g:lightline#ale#indicator_errors = "\uf05e"
  let g:lightline#ale#indicator_ok = "\uf00c"

  " local vimrc (project specific settings)
  set exrc
  " Disables unsafe commands in project vimrcs
  set secure

endif
