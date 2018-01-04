set encoding=utf-8

" python
let g:python_host_prog=$PYENV_ROOT.'/versions/neovim-2/bin/python'
let g:python3_host_prog=$PYENV_ROOT.'/versions/neovim-3/bin/python'

" dein
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.dotfiles/editor/dein/repos/github.com/Shougo/dein.vim
let s:dein_dir=expand($HOME/.dotfiles/.'/editor/dein/')

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:dein_dir . 'plugins.toml', {'lazy': 0})
  call dein#load_toml(s:dein_dir . 'lazy.toml', {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax enable

" vim
autocmd FileType vim setlocal tabstop=2 shiftwidth=2

" ==============================================================================
" I/O
" ==============================================================================

if has('nvim')
  set clipboard+=unnamedplus
else
  set clipboard=unnamed,autoselect
endif

if !has('nvim')
  if has('mouse')
    set mouse=a
    if has('mouse_sgr')
      set ttymouse=sgr
    elseif v:version > 703 || v:version is 703 && has('patch632')
      set ttymouse=sgr
    else
      set ttymouse=xterm2
    endif
  endif
endif

set mouse=a

" ==============================================================================
" keybindings
" ==============================================================================

inoremap <silent> fd <esc>

" ==============================================================================
" search
" ==============================================================================

set hlsearch
set incsearch
set ignorecase
set smartcase

" ==============================================================================
" view
" ==============================================================================

set t_Co=256

if (has("termguicolors"))
  set termguicolors
endif

if has('nvim')
  colorscheme tender
endif

set showtabline=2

set splitright
set splitbelow

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

" ヴィジュアル選択範囲カラー
if has('nvim')
  hi Visual guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=0 gui=NONE cterm=NONE
  hi VisualNOS guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=0 gui=NONE cterm=NONE
endif

" 検索ハイライトカラー
if has('nvim')
  hi IncSearch guifg=#f43753 ctermfg=235 guibg=NONE ctermbg=15 gui=NONE cterm=NONE
  hi Search guifg=#ffffff ctermfg=15 guibg=#f43753 ctermbg=NONE gui=underline,bold cterm=underline,bold
endif

" ==============================================================================
" others
" ==============================================================================

set noswapfile