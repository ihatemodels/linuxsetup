function gethex() {
    echo -n "$1" | od -A n -t x1 | sed 's/ *//g' | tr -d '\n'
}

function pshow() {
    if [ ! -z $1 ] ; then
            ps aux | grep $1
    else
            echo "!! Need name to grep for"
    fi
}

function gitit() {
    git add .
    git commit -a -m "$1"
    git push
}

function extract () {
        if [ -f $1 ] ; then
                case $1 in
                        *.tar.bz2)       tar xjf $1    ;;
                        *.tar.gz)        tar xzf $1    ;;
                        *.bz2)           bunzip2 $1    ;;
                        *.rar)           rar x $1      ;;
                        *.gz)            gunzip $1     ;;
                        *.tar)           tar xf $1     ;;
                        *.tbz2)          tar xjf $1    ;;
                        *.tgz)           tar xzf $1    ;;
                        *.zip)           unzip $1      ;;
                        *.Z)             uncompress $1 ;;
                        *)               echo "'$1' cannot be extracted via extract()" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}
