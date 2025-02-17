# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

# User specific environment
PATH="$HOME/.local/bin:$HOME/bin:$PATH"
export PATH

# User specific aliases and functions
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# Some Greene slurm specific shortcuts
## Show your queued jobs
alias sque='squeue  -u $USER -o "%.24i %.9P %.20j %.8u %.8T %.10M %.9l %.6D %R"'
## sbatch all .SBATCH files in this folder
alias sbatall='for i in *.SBATCH; do [ -f "$i" ] || break; sbatch $i; done'
## Check maximum allowed core and memory usage
alias sallowed='sacctmgr list qos format=maxwall,maxtresperuser%40,name'
## Remove all .out files in this folder
alias rmout='for i in *.out; do [ -f "$i" ] || break; rm $i; done'
## Watch sque, that is pull up a screen where sque is refreshed every two seconds
wsque() {
    watch 'squeue  -u $USER -o "%.24i %.9P %.20j %.8u %.8T %.10M %.9l %.6D %R"'
}
## Watch a file get updated
wcat() {
    watch "cat "$1" | tail -30"
}
## Never have to remember how to git commit again :)
gitcmt() {
    git add -A && git commit -m "$1"
}
