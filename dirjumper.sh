function _dirjumper() {
    res=`dirjumper complete ${COMP_WORDS[@]:1}`
    COMPREPLY=( $res )
}

function __dj() {
    res=( `dirjumper propose ${@:2}` )
    if [ ${#res[@]} -gt 1 ]; then
        echo "-->${res[@]}"
    else
        if [ "$res" = "" ]; then
            echo "no matching path"
        else
            eval $1 ${res[0]}
        fi
    fi
}

function dj() {
    __dj 'cd' ${@:1}
}

function ldj() {
    __dj 'ls' ${@:1}
}

function lldj() {
    __dj 'ls -lat' ${@:1}
}

complete -F _dirjumper dj
complete -F _dirjumper ldj
complete -F _dirjumper lldj

