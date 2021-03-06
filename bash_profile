# ==============================================================================
# Return if not running interactively
# ==============================================================================
case $- in

  *i*) ;;

  *) return ;;

esac


# ==============================================================================
# Define color
# ==============================================================================
Color_Off="\x1B[0m"

NC="\x1B[m"

Black="\x1B[0;30m"

Red="\x1B[0;31m"

Green="\x1B[0;32m"

Yellow="\x1B[0;33m"

Blue="\x1B[0;34m"

Purple="\x1B[0;35m"

Cyan="\x1B[0;36m"

White="\x1B[0;37m"

BBlack="\x1B[1;30m"

BRed="\x1B[1;31m"

BGreen="\x1B[1;32m"

BYellow="\x1B[1;33m"

BBlue="\x1B[1;34m"

BPurple="\x1B[1;35m"

BCyan="\x1B[1;36m"

BWhite="\x1B[1;37m"

UBlack="\x1B[4;30m"

URed="\x1B[4;31m"

UGreen="\x1B[4;32m"

UYellow="\x1B[4;33m"

UBlue="\x1B[4;34m"

UPurple="\x1B[4;35m"

UCyan="\x1B[4;36m"

UWhite="\x1B[4;37m"

IBlack="\x1B[0;90m"

IRed="\x1B[0;91m"

IGreen="\x1B[0;92m"

IYellow="\x1B[0;93m"

IBlue="\x1B[0;94m"

IPurple="\x1B[0;95m"

ICyan="\x1B[0;96m"

IWhite="\x1B[0;97m"

BIBlack="\x1B[1;90m"

BIRed="\x1B[1;91m"

BIGreen="\x1B[1;92m"

BIYellow="\x1B[1;93m"

BIBlue="\x1B[1;94m"

BIPurple="\x1B[1;95m"

BICyan="\x1B[1;96m"

BIWhite="\x1B[1;97m"

On_Black="\x1B[40m"

On_Red="\x1B[41m"

On_Green="\x1B[42m"

On_Yellow="\x1B[43m"

On_Blue="\x1B[44m"

On_Purple="\x1B[45m"

On_Cyan="\x1B[46m"

On_White="\x1B[47m"

On_IBlack="\x1B[0;100m"

On_IRed="\x1B[0;101m"

On_IGreen="\x1B[0;102m"

On_IYellow="\x1B[0;103m"

On_IBlue="\x1B[0;104m"

On_IPurple="\x1B[0;105m"

On_ICyan="\x1B[0;106m"

On_IWhite="\x1B[0;107m"


# ==============================================================================
# Do not put duplicate lines or lines starting with space in the history
# ==============================================================================
HISTCONTROL=ignoreboth


# ==============================================================================
# Append to the history file instead of overwriting it
# ==============================================================================
shopt -s histappend


# ==============================================================================
# Set history length
# ==============================================================================
HISTSIZE=88888888

HISTFILESIZE=88888888


# ==============================================================================
# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS
# ==============================================================================
shopt -s checkwinsize


# ==============================================================================
# Make less more friendly for non-text input file
# ==============================================================================
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# ==============================================================================
# Enable colored GCC warning and error
# ==============================================================================
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"


# ==============================================================================
# Enable programmable completion feature
# ==============================================================================
if ! shopt -oq posix; then

  if [ -f /usr/share/bash-completion/bash_completion ]; then

    . /usr/share/bash-completion/bash_completion

  elif [ -f /etc/bash_completion ]; then

    . /etc/bash_completion

  fi

fi


# ==============================================================================
# Enable color support
# ==============================================================================
if [ -x /usr/bin/dircolors ]; then

  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias dir="dir --color=auto"

  alias vdir="vdir --color=auto"

  alias grep="grep --color=auto"

  alias fgrep="fgrep --color=auto"

  alias egrep="egrep --color=auto"

fi


# ==============================================================================
# Define alias
# ==============================================================================
alias ..="cd .."

alias ...="cd ../.."

alias ....="cd ../../.."

alias .....="cd ../../../.."

alias ls="ls --human-readable --classify --no-group --color=auto"

alias ll="ls -l"

alias la="ls -l --almost-all"

alias lt="ls -lt"

alias rm="rm --interactive"

alias cp="cp --interactive"

alias mv="mv --interactive"

alias mkdir="mkdir --verbose --parents"

alias du="du --human-readable --total --summarize"

alias df="df --human-readable --total"

alias rsync="rsync --verbose --recursive --update --links --perms --executability --times --human-readable --progress --exclude=*.DS_Store* --exclude=*.ipynb_checkpoints* --exclude=*._*"


# ==============================================================================
# Define cleaning function
# ==============================================================================
function find_and_remove_junk() {

  find | grep -E "(__pycache__|\.pyc$|\.DS_Store|\.ipynb_checkpoints)" | xargs rm -rf

}


function find_and_reset_mode() {

  find -not -path "*/.*" -type f -exec chmod 644 {} \;

  find -not -path "*/.*" -type d -exec chmod 755 {} \;

}


function find_and_clean_py() {

  find -name "*.py" -exec isort {} \; -exec black {} \;

}


function find_and_clean_ipynb() {

  find -name "*.ipynb" -exec clean_ipynb {} \;

}


# ==============================================================================
# Define compression function
# ==============================================================================
function extract() {

  if [ -f $1 ] ; then

    case $1 in

      *.tar.bz2) tar xvjf $1   ;;

      *.tar.gz)  tar xvzf $1   ;;

      *.bz2)     bzip2 -dk $1  ;;

      *.rar)     unrar x $1    ;;

      *.bz2)     bzip2 -dk $1  ;;

      *.gz)      gunzip $1     ;;

      *.tar)     tar xvf $1    ;;

      *.tbz2)    tar xvjf $1   ;;

      *.tgz)     tar xvzf $1   ;;

      *.zip)     unzip $1      ;;

      *.Z)       uncompress $1 ;;

      *.7z)      7z x $1       ;;

      *)         echo "Cannot extract $1." ;;

    esac

  else

    echo "$1 is not a valid compressed file."

  fi

}


function make_tar() {

  tar cvzf "${1%%/}.tar.gz" "${1%%/}/"

}


function make_zip() {

  zip -r "${1%%/}.zip" "$1"

}


# ==============================================================================
# Define git function
# ==============================================================================
function git_update_repositories() {

  for d in *

    do

      if [ -d "$d/.git" ]; then

        printf "\n\n\n\n\n\n\n\n"

        printf $BIBlack

        printf "================================================================================\n"

        printf $BIGreen

        printf "$d\n"

        printf $BIBlack

        printf "vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n"

        cd $d

        printf $BIYellow

        printf "git status\n"

        printf $NC

        git status

        printf $BIPurple

        printf "git submodule foreach --recursive git reset --hard\n"

        printf $NC

        git submodule foreach --recursive git reset --hard

        printf $BIYellow

        printf "git submodule foreach --recursive git clean -d --force\n"

        printf $NC

        git submodule foreach --recursive git clean -fd

        printf $BIPurple

        printf "git submodule update --init --remote --recursive\n"

        printf $NC

        git submodule update --init --remote --recursive

        printf $BIYellow

        printf "git add -A\n"

        printf $NC

        git add -A

        printf $BIPurple

        printf "git commit -m $1\n"

        printf $NC

        git commit -m "$1"

        printf $BIYellow

        printf "git pull\n"

        printf $NC

        git pull

        printf $BIPurple

        printf "git push\n"

        printf $NC

        git push

        cd ..

        printf $BIBlack

        printf "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n"

        printf "================================================================================\n"

        printf $NC

      fi

    done

}


function get_github() {

  mkdir github && cd github

  git clone https://github.com/KwatME/environment

  git clone https://github.com/KwatME/ccal

  git clone https://github.com/KwatME/clean_ipynb

  git clone https://github.com/KwatME/spro

  # git clone https://github.com/KwatME/combine_models_and_infer

  git clone https://github.com/KwatME/explore_tcga

  git clone https://github.com/KwatME/find_differential_expression

  git clone https://github.com/KwatME/model_and_infer

  # git clone https://github.com/KwatME/kwatme.com

  # git clone https://github.com/KwatME/muscle_type

  # git clone https://github.com/KwatME/random_genome_peek

  # git clone https://github.com/KwatME/tumor_suppressor

  # git clone https://github.com/Guardiome/genotype_to_phenotype

  # git clone https://github.com/Guardiome/omics_ai

  # git clone https://github.com/Guardiome/omics_ai_server

  # git clone https://github.com/Guardiome/omics_ai_ui

  # git clone https://github.com/Guardiome/omics_app

  # git clone https://github.com/Guardiome/omics_app_template

  # git clone https://github.com/Guardiome/omics_apps_for_omics_ai

  # git clone https://github.com/Guardiome/omicsapps.com

  # git clone https://github.com/Guardiome/simple_omics_app_template

  # git clone https://github.com/Guardiome/cellularcontext.com

  # git clone https://github.com/Guardiome/update_cellularcontext.com

}


# ==============================================================================
# Define other function
# ==============================================================================
function release_to_pypi() {

  rm -rf build/ *.egg-info dist

  python setup.py sdist

  python setup.py bdist_wheel

  twine upload dist/*

}


function ssh_port() {

  ssh $1 -f -N -L localhost:$2:localhost:$3

}


# ==============================================================================
# Make conda path visible
# ==============================================================================
export PATH="$HOME/miniconda3/bin:$PATH"


# ==============================================================================
# Style shell prompt
# ==============================================================================
PS1="[\h] \W $ "
