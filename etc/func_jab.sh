# Set the title of the Gnome Terminal window/tab
settitle() {
    printf "\e]2;$*\a"
    #TITLE="\[\e]2;$*\a\]"
}

# Set the usable GPUs for CUDA
scuda () {
    export CUDA_VISIBLE_DEVICES=$1
    echo CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES
}

