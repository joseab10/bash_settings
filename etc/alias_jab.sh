alias ll='ls -al --color=auto'
alias ds='du -s -h'            # Display Directory Size in Human Readable Form
alias df='df -h'               # Display Filesystems in Human Readable Form
alias tf='tail -f'             # Display last 10 lines of a file and continue showing it's changes
alias fu='lsof | grep -i'      # Display which process is making use of a file
alias envg='env | grep -i'     # Display environment variables
alias psg='ps -ef | grep -i'
alias vi='vim'
alias wns='watch -n 0.1 nvidia-smi'
alias jtop='screen -c ~/etc/etc/screen_jtop'
#alias mntg='sshfs -o allow_other arceyd@rlgpu7:/home/arceyd/ /mnt/ghome'
#alias umntg='umount /mnt/ghome/'
#alias mntgs='sshfs -o allow_other arceyd@rlgpu7:/home/shared/ /mnt/gshared'
#alias mntgd='sshfs -o allow_other arceyd@rlgpu7:/home/datasets/ /mnt/gdata'
#alias umntgd='umount -o allow_other /mnt/gdata/'
#alias umntgs='umount -o allow_other /mnt/gshared/'
alias mnts='sshfs -o allow_other arceyd@slurm:/home/arceyd/ /mnt/shome'
alias umnts='umount /mnt/shome'
alias mntsw='sshfs -o allow_other arceyd@slurm:/work/dlclarge2/arceyd-padloc /mnt/swork'
alias umntsw='umount /mnt/swork'
alias unpickle='~/etc/bin/pickle_dict_dump.py'
alias jcp='rsync --bwlimit=20000 --progress'
alias docker_ip='docker inspect --format "{{ .NetworkSettings.IPAddress }}" "$@"'
alias docker_pid='docker inspect --format "{{  .State.Pid }}" "$@"'
alias reload_bash='source ~/.bashrc'
