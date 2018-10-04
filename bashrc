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
# Reset
Color_Off="\x1B[0m"      # Text Reset
NC="\x1B[m"              # Color Reset

# Regular
Black="\x1B[0;30m"       # Black
Red="\x1B[0;31m"         # Red
Green="\x1B[0;32m"       # Green
Yellow="\x1B[0;33m"      # Yellow
Blue="\x1B[0;34m"        # Blue
Purple="\x1B[0;35m"      # Purple
Cyan="\x1B[0;36m"        # Cyan
White="\x1B[0;37m"       # White

# Bold
BBlack="\x1B[1;30m"      # Black
BRed="\x1B[1;31m"        # Red
BGreen="\x1B[1;32m"      # Green
BYellow="\x1B[1;33m"     # Yellow
BBlue="\x1B[1;34m"       # Blue
BPurple="\x1B[1;35m"     # Purple
BCyan="\x1B[1;36m"       # Cyan
BWhite="\x1B[1;37m"      # White

# Underline
UBlack="\x1B[4;30m"      # Black
URed="\x1B[4;31m"        # Red
UGreen="\x1B[4;32m"      # Green
UYellow="\x1B[4;33m"     # Yellow
UBlue="\x1B[4;34m"       # Blue
UPurple="\x1B[4;35m"     # Purple
UCyan="\x1B[4;36m"       # Cyan
UWhite="\x1B[4;37m"      # White

# High Intensity
IBlack="\x1B[0;90m"      # Black
IRed="\x1B[0;91m"        # Red
IGreen="\x1B[0;92m"      # Green
IYellow="\x1B[0;93m"     # Yellow
IBlue="\x1B[0;94m"       # Blue
IPurple="\x1B[0;95m"     # Purple
ICyan="\x1B[0;96m"       # Cyan
IWhite="\x1B[0;97m"      # White

# Bold High Intensity
BIBlack="\x1B[1;90m"     # Black
BIRed="\x1B[1;91m"       # Red
BIGreen="\x1B[1;92m"     # Green
BIYellow="\x1B[1;93m"    # Yellow
BIBlue="\x1B[1;94m"      # Blue
BIPurple="\x1B[1;95m"    # Purple
BICyan="\x1B[1;96m"      # Cyan
BIWhite="\x1B[1;97m"     # White

# Background
On_Black="\x1B[40m"      # Black
On_Red="\x1B[41m"        # Red
On_Green="\x1B[42m"      # Green
On_Yellow="\x1B[43m"     # Yellow
On_Blue="\x1B[44m"       # Blue
On_Purple="\x1B[45m"     # Purple
On_Cyan="\x1B[46m"       # Cyan
On_White="\x1B[47m"      # White

# High Intensity Background
On_IBlack="\x1B[0;100m"  # Black
On_IRed="\x1B[0;101m"    # Red
On_IGreen="\x1B[0;102m"  # Green
On_IYellow="\x1B[0;103m" # Yellow
On_IBlue="\x1B[0;104m"   # Blue
On_IPurple="\x1B[0;105m" # Purple
On_ICyan="\x1B[0;106m"   # Cyan
On_IWhite="\x1B[0;107m"  # White

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
# Define aliase
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
alias rsync='rsync --verbose --recursive --update --links --perms --executability --times --delete --human-readable --progress --exclude=*.DS_Store* --exclude=*.ipynb_checkpoints* --exclude=*._*'

# ==============================================================================
# Define function
# ==============================================================================
function ssh_port()
{
  ssh $1 -f -N -L localhost:$2:localhost:$2
}

function chmod_all()
{
  find . -not -path '*/.*' -type f -exec chmod 644 {} \;
  find . -not -path '*/.*' -type d -exec chmod 755 {} \;
}

function remove_junk()
{
  find . | grep -E '(__pycache__|\.pyc$|\.DS_Store|\.ipynb_checkpoints)' | xargs rm -rf
}

function extract()
{
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

function make_tar()
{
  tar cvzf "${1%%/}.tar.gz" "${1%%/}/"
}

function make_zip()
{
  zip -r "${1%%/}.zip" "$1"
}

function release_to_pypi()
{
  rm -rf build/ *.egg-info dist
  python setup.py sdist
  python setup.py bdist_wheel
  twine upload dist/*
}

function clear_ipynb_output()
{
  jupyter nbconvert --ClearOutputPreprocessor.enabled=True --inplace *.ipynb
}

function git_cache()
{
  git config --global credential.helper cache
  git config --global credential.helper "cache --timeout=$1"
}

function git_status_repositories()
{
  for d in *
    do
      if [ -d "$d/.git" ]; then
        printf '\n\n\n\n\n\n\n\n'
        printf $Purple
        printf '================================================================================\n'
        printf $Blue
        printf "$d\n"
        printf $Purple
        printf $NC
        cd $d
        git status
        cd ..
        printf $Purple
        printf '================================================================================\n'
        printf $NC
      fi
    done
}

function git_update_repositories()
{
  for d in *
    do
      if [ -d "$d/.git" ]; then
        printf '\n\n\n\n\n\n\n\n'
        printf $Purple
        printf '================================================================================\n'
        printf $Blue
        printf "$d\n"
        printf $Purple
        printf 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n'
        printf $NC
        cd $d
        printf $Yellow
        printf 'git status\n'
        printf $NC
        git status
        printf $Cyan
        printf "git submodule foreach 'git stash'\n"
        printf $NC
        git submodule foreach 'git stash'
        printf $Yellow
        printf "git submodule foreach 'git reset --hard'\n"
        printf $NC
        git submodule foreach 'git reset --hard'
        printf $Cyan
        printf "git submodule foreach 'git clean -fd'\n"
        printf $NC
        git submodule foreach 'git clean -fd'
        printf $Yellow
        printf 'git submodule update --init --remote --recursive\n'
        printf $NC
        git submodule update --init --remote --recursive
        printf $Yellow
        printf 'git add -A\n'
        printf $NC
        git add -A
        printf $Cyan printf 'git commit -m $1\n'
        printf $NC
        git commit -m "$1"
        printf $Yellow
        printf 'git pull\n'
        printf $NC
        git pull
        printf $Cyan
        printf 'git push\n'
        printf $NC
        git push
        cd ..
        printf $Purple
        printf '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
        printf '================================================================================\n'
        printf $NC
      fi
    done
}

function git_update_repositories_n_times()
{
  for i in $(seq $1);
    do
      i=$((i-1))
      printf "$Yellow$i\n$NC"
      git_update_repositories $i
    done
}

function git_clone_kwatme_libary()
{
  git clone --recursive https://github.com/KwatME/classification
  git clone --recursive https://github.com/KwatME/clustering
  git clone --recursive https://github.com/KwatME/context
  git clone --recursive https://github.com/KwatME/cross_validation
  git clone --recursive https://github.com/KwatME/dimension_scaling
  git clone --recursive https://github.com/KwatME/feature
  git clone --recursive https://github.com/KwatME/feature_x_sample
  git clone --recursive https://github.com/KwatME/gct_gmt
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
}

function git_clone_kwatme_workflow()
{
  git clone --recursive https://github.com/KwatME/explore_tcga
  git clone --recursive https://github.com/KwatME/find_differential_expression
  git clone --recursive https://github.com/KwatME/model_and_infer
}

function git_clone_kwatme_website()
{
  git clone --recursive https://github.com/Guardiome/cellularcontext.com
  git clone --recursive https://github.com/KwatME/kwatme.com
  git clone --recursive https://github.com/Guardiome/update_cellularcontext.com
}

function git_clone_kwatme_omics_apps()
{
  git clone --recursive https://github.com/KwatME/muscle_type
  git clone --recursive https://github.com/KwatME/random_genome_peek
  git clone --recursive https://github.com/KwatME/tumor_suppressor
}

function git_clone_guardiome()
{
  git clone --recursive https://github.com/Guardiome/genotype_to_phenotype
  git clone --recursive https://github.com/Guardiome/omics_ai
  git clone --recursive https://github.com/Guardiome/omics_ai_server
  git clone --recursive https://github.com/Guardiome/omics_ai_ui
  git clone --recursive https://github.com/Guardiome/omics_app
  git clone --recursive https://github.com/Guardiome/omics_app_template
  git clone --recursive https://github.com/Guardiome/omics_apps_for_omics_ai
  git clone --recursive https://github.com/Guardiome/simple_omics_app_template
}

function git_clone_ccal()
{
  git clone --recursive https://github.com/UCSD-CCAL/ccal
}

function git_truncate_history()
{
  git checkout --orphan temp $1
  git commit -m 'Truncated history'
  git rebase --onto temp $1 master
  git checkout master
  git branch -D temp
}

# ==============================================================================
# Make conda path visible
# ==============================================================================
export PATH="$HOME/miniconda3/bin:$PATH"

# ==============================================================================
# Style shell prompt
# ==============================================================================
PS1='[\h] \W $'
