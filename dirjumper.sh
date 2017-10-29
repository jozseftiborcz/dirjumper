function _dirjumper() {
    res=`dirjumper - complete ${COMP_WORDS[@]:1}`
    COMPREPLY=( $res )
}

function dj() {
    res=( `dirjumper ${@:1}` )
    if [ ${#res[@]} -gt 1 ]; then
        echo "-->${res[@]}"
    else
        cd ${res[0]}
    fi
}

function ldj() {
    res=( `dirjumper ${@:1}` )
    if [ ${#res[@]} -gt 1 ]; then
        echo "-->${res[@]}"
    else
        ls ${res[0]}
    fi
}

function lldj() {
    res=( `dirjumper ${@:1}` )
    if [ ${#res[@]} -gt 1 ]; then
        echo "-->${res[@]}"
    else
        ls -lat ${res[0]}
    fi
}

complete -F _dirjumper dj
complete -F _dirjumper ldj
complete -F _dirjumper lldj

