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
# Enable color support of ls and also add handy alias
# ==============================================================================
if [ -x /usr/bin/dircolors ]; then

  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

  alias ls='ls -Fh --color=auto'

  alias dir='dir --color=auto'

  alias vdir='vdir --color=auto'

  alias grep='grep --color=auto'

  alias fgrep='fgrep --color=auto'

  alias egrep='egrep --color=auto'

else

  alias ls='ls -FhG'

fi

# ==============================================================================
# Define alias
# ==============================================================================
alias ..='cd ..'

alias ...='cd ../..'

alias ll='ls -hFl'

alias la='ls -hFla'

alias lt='ls -hFltr'

alias rm='rm -i'

alias cp='cp -i'

alias mv='mv -i'

alias mkdir='mkdir -vp'

alias du='du -hs'

alias rsync='rsync --verbose --recursive --update --links --perms --executability --times --human-readable --progress --exclude=*.DS_Store* --exclude=*.ipynb_checkpoints* --exclude=*._*'

# ==============================================================================
# Define function
# ==============================================================================
function ssh_port() {

  ssh $1 -f -N -L localhost:$2:localhost:$3

}


function chmod_reset() {

  find . -not -path '*/.*' -type f -exec chmod 644 {} \;

  find . -not -path '*/.*' -type d -exec chmod 755 {} \;

}


function remove_junk() {

  find . | grep -E '(__pycache__|\.pyc$|\.DS_Store|\.ipynb_checkpoints)' | xargs rm -rf

}


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


function release_to_pypi() {

  rm -rf build/ *.egg-info dist

  python setup.py sdist

  python setup.py bdist_wheel

  twine upload dist/*

}


function clear_ipynb_output() {

  jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace $@

}


function git_cache() {

  git config --global credential.helper cache

  git config --global credential.helper "cache --timeout=${1-691200}"

}


function git_update_repositories() {

  for d in *

    do

      if [ -d "$d/.git" ]; then

        printf '\n\n\n\n\n\n\n\n'

        printf $Green

        printf '================================================================================\n'

        printf $BIGreen

        printf "$d\n"

        printf $Green

        printf 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n'

        cd $d

        printf $IPurple

        printf 'git status\n'

        printf $NC

        git status

        printf $IYellow

        printf "git submodule foreach --recursive git reset --hard\n"

        printf $NC

        git submodule foreach --recursive git reset --hard

        printf $IPurple

        printf "git submodule foreach --recursive git clean -d --force\n"

        printf $NC

        git submodule foreach --recursive git clean -fd

        printf $IYellow

        printf 'git submodule update --init --remote --recursive\n'

        printf $NC

        git submodule update --init --remote --recursive

        printf $IPurple

        printf 'git add -A\n'

        printf $NC

        git add -A

        printf $IYellow

        printf 'git commit -m $1\n'

        printf $NC

        git commit -m "$1"

        printf $IPurple

        printf 'git pull\n'

        printf $NC

        git pull

        printf $IYellow

        printf 'git push\n'

        printf $NC

        git push

        cd ..

        printf $IPurple

        printf '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'

        printf '================================================================================\n'

        printf $NC

      fi

    done

}


function git_update_repositories_n_times() {

  for i in $(seq $1);

    do

      i=$((i-1))

      printf $On_Green

      printf "$i\n"

      printf $NC

      git_update_repositories "Git sync ($i)"

    done

}


function get_github() {

  mkdir github

  cd github

  mkdir kwatme

  cd kwatme

  git clone --recursive https://github.com/KwatME/environment

  mkdir library

  cd library

  git clone --recursive https://github.com/KwatME/classification

  git clone --recursive https://github.com/KwatME/clustering

  git clone --recursive https://github.com/KwatME/context

  git clone --recursive https://github.com/KwatME/cross_validation

  git clone --recursive https://github.com/KwatME/dimension_scaling

  git clone --recursive https://github.com/KwatME/feature

  git clone --recursive https://github.com/KwatME/feature_x_sample

  git clone --recursive https://github.com/KwatME/gct_gmt

  git clone --recursive https://github.com/KwatME/gene

  git clone --recursive https://github.com/KwatME/genome

  git clone --recursive https://github.com/KwatME/geo

  git clone --recursive https://github.com/KwatME/gps_map

  git clone --recursive https://github.com/KwatME/gsea

  git clone --recursive https://github.com/KwatME/hdf5

  git clone --recursive https://github.com/KwatME/information

  git clone --recursive https://github.com/KwatME/kernel_density

  git clone --recursive https://github.com/KwatME/linear_algebra

  git clone --recursive https://github.com/KwatME/linear_model

  git clone --recursive https://github.com/KwatME/match

  git clone --recursive https://github.com/KwatME/matrix_factorization

  git clone --recursive https://github.com/KwatME/nd_array

  git clone --recursive https://github.com/KwatME/neural_network

  git clone --recursive https://github.com/KwatME/plot

  git clone --recursive https://github.com/KwatME/probability

  git clone --recursive https://github.com/KwatME/regression

  git clone --recursive https://github.com/KwatME/sequence

  git clone --recursive https://github.com/KwatME/sequencing_process

  git clone --recursive https://github.com/KwatME/spro

  git clone --recursive https://github.com/KwatME/support

  git clone --recursive https://github.com/KwatME/tcga

  git clone --recursive https://github.com/KwatME/variant

  cd ..

  mkdir workflow

  cd workflow

  # git clone --recursive https://github.com/KwatME/combine_models_and_infer

  git clone --recursive https://github.com/KwatME/explore_tcga

  git clone --recursive https://github.com/KwatME/find_differential_expression

  git clone --recursive https://github.com/KwatME/model_and_infer

  cd ..

  # mkdir website

  # cd website

  # git clone --recursive https://github.com/Guardiome/cellularcontext.com

  # git clone --recursive https://github.com/KwatME/kwatme.com

  # git clone --recursive https://github.com/Guardiome/update_cellularcontext.com

  # cd ..

  # mkdir omics_app

  # cd omics_app

  # git clone --recursive https://github.com/KwatME/muscle_type

  # git clone --recursive https://github.com/KwatME/random_genome_peek

  # git clone --recursive https://github.com/KwatME/tumor_suppressor

  # cd ..

  cd ..

  # mkdir guardiome

  # cd guardiome

  # git clone --recursive https://github.com/Guardiome/genotype_to_phenotype

  # git clone --recursive https://github.com/Guardiome/omics_ai

  # git clone --recursive https://github.com/Guardiome/omics_ai_server

  # git clone --recursive https://github.com/Guardiome/omics_ai_ui

  # git clone --recursive https://github.com/Guardiome/omics_app

  # git clone --recursive https://github.com/Guardiome/omics_app_template

  # git clone --recursive https://github.com/Guardiome/omics_apps_for_omics_ai

  # git clone --recursive https://github.com/Guardiome/simple_omics_app_template

  # cd ..

  mkdir ccal

  cd ccal

  git clone --recursive https://github.com/UCSD-CCAL/ccal

  cd ..

}


# ==============================================================================
# Make conda path visible
# ==============================================================================
export PATH="$HOME/miniconda3/bin:$PATH"

# ==============================================================================
# Style shell prompt
# ==============================================================================
PS1='[\h] \W $ '
