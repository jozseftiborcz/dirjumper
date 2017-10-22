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

complete -F _dirjumper dj
