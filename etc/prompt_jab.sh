BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHT_GRAY="\e[37m"

GRAY="\e[90m"
LIGHT_RED="\e[91m"
LIGHT_GREEN="\e[92m"
LIGHT_YELLOW="\e[93m"
LIGHT_BLUE="\e[94m"
LIGHT_MAGENTA="\e[95m"
LIGHT_CYAN="\e[96m"
WHITE="\e[97m"

BOLD="\e[1m"
FAINT="\e[2m"
ITALIC="\e[3m"
UNDERL="\e[4m"

RESET="\e[0m"

FMT_USR=${RED}
FMT_HST=${RED}${BOLD}${UNDERL}
FMT_ENV=${GREEN}
FMT_GIT=$LIGHT_MAGENTA
FMT_DIR=$LIGHT_BLUE

export GIT_PS1_SHOWDIRTYSTATE=1
export VIRTUAL_ENV_DISABLE_PROMPT=1

__curr_env(){
        ENV_PS1=""
        if [ -f /.dockerenv ]; then
                ENV_PS1+="🅓 $(hostname)"
        fi
        if [ ! -z "$CONDA_DEFAULT_ENV" ]; then
                if [ ! -z "$ENV_PS1" ]; then
                        ENV_PS1+=" | "
                fi
                ENV_PS1+="🅒 $(basename $CONDA_DEFAULT_ENV)"
        fi
        if [ ! -z "$VIRTUAL_ENV" ]; then
                if [ ! -z "$ENV_PS1" ]; then
                        ENV_PS1+=" | "
                fi
                ENV_PS1+="🅥 $(basename $VIRTUAL_ENV)"
        fi
        if [ ! -z "$ENV_PS1" ]; then
                echo " ⟨${ENV_PS1}⟩"
        fi
}

# '\u' adds the name of the current user to the prompt
# '\h' adds the hostname of the current computer
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
PS1="\n${FMT_USR}\u@${RESET}"
PS1+="${FMT_HST}\h${RESET}${FMT_USR}:${RESET}"
PS1+="${FMT_ENV}\$(__curr_env)${RESET}"
PS1+="${FMT_GIT}\$(__git_ps1)${RESET}"
PS1+="${FMT_DIR} …/\W${RESET}"
PS1+="\n${LIGHT_GRAY}$ ${RESET}"
