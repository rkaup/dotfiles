#!/bin/zsh
into=~
links=(.vimrc .vim .ackrc .gitconfig gitignore .zshrc)
for l in $links; do
    # TODO deal with errors here better and make sure path is properly quoted
    echo ln -s "$PWD/$l" "$into/$l"
    ln -s "$PWD/$l" "$into/$l"
done

