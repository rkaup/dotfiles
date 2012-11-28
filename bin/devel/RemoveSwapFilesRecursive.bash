#!/bin/bash
swap_files=`find . -name '.*.sw[pno]'`
if [ -z "$swap_files" ]; then
    echo "No swap files."
    exit 0
fi
cmd=`echo $swap_files | xargs echo rm`
echo $cmd
read -p "If you want to do this, press y. " -n 1 -r
echo
if [[ ! $REPLY =~  ^[Yy]$ ]]; then
    exit 1
fi
eval $cmd

