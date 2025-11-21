run_ls() {
    CMD="ls $1"
    
    eval $CMD
}

if [ -z "$1" ]; then
    exit 1
fi

run_ls "$1"