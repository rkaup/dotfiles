#!/bin/zsh

# Update vim plugins from Mercurial
fromHg=(gundo.vim)
for i in $fromHg; do
    echo "Updating $i"
    cd $i
    hg pull
    cd ..
done

# Update vim plugins from git
fromGit=(vim-colors-solarized/ vim-surround/ xptemplate/ rainbow_parentheses.vim/ vim-fugitive/ vim-glsl/ bufkill.vim/ clang_complete/)
for i in $fromGit; do
    echo "Updating $i"
    cd $i
    git pull
    cd ..
done


