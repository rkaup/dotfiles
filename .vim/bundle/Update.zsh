#!/bin/zsh


# Update vim plugins from Mercurial
fromHg=(gundo.vim)
for i in $fromHg; do
    cd $i
    hg pull
    cd ..
done

# Update vim plugins from git
fromGit=(vim-colors-solarized/ vim-surround/ xptemplate/ rainbow_parentheses.vim/)
for i in $fromGit; do
    echo $i
    cd $i
    git pull
    cd ..
done


