#!/bin/zsh

if [ ! -d rainbow_parentheses.vim ]; then git clone --progress https://github.com/kien/rainbow_parentheses.vim.git; fi
if [ ! -d vim-colors-solarized ]; then git clone --progress git://github.com/altercation/vim-colors-solarized.git; fi
if [ ! -d vim-surround ]; then git clone --progress git://github.com/tpope/vim-surround.git; fi
if [ ! -d vim-fugitive ]; then git clone --progress git://github.com/tpope/vim-fugitive.git; fi
if [ ! -d vim-glsl ]; then git clone --progress git@github.com:rkaup/vim-glsl.git; fi
if [ ! -d bufkill.vim ]; then git clone --progress git@github.com:rkaup/bufkill.vim.git; fi

