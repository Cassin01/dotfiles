#!/bin/sh

dot="dot/"
dot_len=${#dot}

dot_path=$(cd ~/dotfiles/${dot}; pwd)
home_path=$(cd ~/; pwd)

git ls-files ${dot_path} | {
    while read line ; do
        body_path=${line:${dot_len}}
        path_to=${home_path}/${body_path}
        path_from=${dot_path}/${body_path}
        ln -sf ${path_from} ${path_to}
        echo "linked" ${path_from} "with" ${path_to}
    done
}
