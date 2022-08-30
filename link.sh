#!/bin/sh

dot_path=$(cd ~/dotfiles/dot/; pwd)
dot_path_len=${#dot_path}
home_path=$(cd ~/; pwd)
base_name=`basename -- "$0"`

find ${dot_path} -type f | {
    while read line; do
        if [[ ${line} =~ ^${dot_path}.*$ ]] ; then
            path_to=${home_path}${line:${dot_path_len}}
            if [[ ! ${line:${dot_path_len}+1} == ${base_name} ]] ; then
                ln -sf ${line} ${path_to}
                echo ${line} "to" ${path_to}
            fi
        fi
    done
}
