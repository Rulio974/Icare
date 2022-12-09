#!/bin/bash

I=""


function auto() {


    iw dev | grep -Po '^\sInterface\s\K.*$' | cat -n > tmp.txt
    cat tmp.txt
    word_count=$(wc -l tmp.txt | cut -d " " -f 1)


    echo -e "\033[1;31m\nchoisir l'interface : \c"

    read interface

    if [[ $interface -gt $word_count ]]
    then
        echo "erreur choix interface"
        rm tmp.txt
        exit 0
    fi

    sed_interface="${interface}p"

    I=$(iw dev | grep -Po '^\sInterface\s\K.*$' | sed -n $sed_interface)

    rm tmp.txt


}

function run() {

    sudo ifconfig $I down
    sudo iwconfig $I mode monitor
    sudo ifconfig $I up

    exit 0

}



function help() {
    echo "usage : ./monitor_mode.sh <option> <interface>"
    echo "-a : list interfaces"
    echo "-m : manual"

    exit 0

}



while getopts "ham:" option; do
    case "${option}" in
        a)
            auto
            run
            ;;
        m)
            I=${OPTARG}
            run
            ;;
        ?)
            help
            exit 0
            ;;
        h)
            help
            exit 0
            ;;
        
        
    esac
done

help



