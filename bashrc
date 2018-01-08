# ==============================================================================
# Return if not running interactively
# ==============================================================================
case $- in
  *i*) ;;
  *) return ;;
esac

# ==============================================================================
# Define colors
# ==============================================================================
# Reset
Color_Off="\x1B[0m"      # Text Reset
NC="\x1B[m"              # Color Reset
# Regular Colors
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
# High Intensity backgrounds
On_IBlack="\x1B[0;100m"  # Black
On_IRed="\x1B[0;101m"    # Red
On_IGreen="\x1B[0;102m"  # Green
On_IYellow="\x1B[0;103m" # Yellow
On_IBlue="\x1B[0;104m"   # Blue
On_IPurple="\x1B[0;105m" # Purple
On_ICyan="\x1B[0;106m"   # Cyan
On_IWhite="\x1B[0;107m"  # White

# ==============================================================================
# Greet
# ==============================================================================
screen -ls

# ==============================================================================
# Don't put duplicate lines or lines starting with space in the history
# ==============================================================================
HISTCONTROL=ignoreboth

# ==============================================================================
# Append to the history file instead of overwriting it
# ==============================================================================
shopt -s histappend

# ==============================================================================
# Set history length
# ==============================================================================
HISTSIZE=1000
HISTFILESIZE=2000

# ==============================================================================
# Check the window size after each command and, if necessary, update the values
# of LINES and COLUMNS
# ==============================================================================
shopt -s checkwinsize

# ==============================================================================
# Make less more friendly for non-text input files
# ==============================================================================
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# ==============================================================================
# Enable color support of ls and also add handy aliases
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
# Enable colored GCC warnings and errors
# ==============================================================================
export GCC_COLORS="error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

# ==============================================================================
# Enable programmable completion features
# ==============================================================================
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# ==============================================================================
# Aliases and functions
# ==============================================================================
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -Fhl'
# Show hidden files
alias la='ls -Fhla'
# Sort by extension
alias lx='ls -FhlXB'
# Sort by size
alias lz='ls -FhlSr'
# Sort by data
alias lt='ls -Fhltr'
# Sort by change time
alias lc='ls -Fhltcr'
# Sort by usage time
alias lu='ls -Fhltur'

alias rm='rm -i'

alias rsync='rsync --verbose --recursive --update --links --perms --executability --times --delete --human-readable --progress --exclude=*.DS_Store* --exclude=*.ipynb_checkpoints* --exclude=*._*'

alias cp='cp -i'

alias mv='mv -i'

alias mkdir='mkdir -vp'

alias du='du -hs'

alias vi=vim

alias sa='source activate'
alias sd='source deactivate'

function pip-publish()
{
  rm -rf build/ *.egg-info dist
  python setup.py sdist
  python setup.py bdist_wheel
  twine upload dist/*
}

function ssh-port()
{
  ssh $1 -f -N -L localhost:$2:localhost:$2
}

# ==============================================================================
# Sanitize
# ==============================================================================
function remove_ds_store()
{
  find . -name .DS_Store -delete
}

function remove_pyc()
{
  find . | grep -E '(__pycache__|\.pyc$)' | xargs rm -rf
}

function chmodall()
{
  find . -not -path '*/.*' -type f -exec chmod 644 {} \;
  find . -not -path '*/.*' -type d -exec chmod 755 {} \;
}

# ==============================================================================
# Compress
# ==============================================================================
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

# Creates an archive (*.tar.gz) from a directory.
function make-tar()
{
  tar cvzf "${1%%/}.tar.gz" "${1%%/}/"
}

# Create a ZIP archive of a file or directory.
function make-zip()
{
  zip -r "${1%%/}.zip" "$1"
}

# ==============================================================================
# Git
# ==============================================================================
function git-cache()
{
  git config --global credential.helper cache
  git config --global credential.helper "cache --timeout=$1"
}

function git-update-repositories-n-times()
{
  for i in $(seq $1);
    do
      i=$((i-1))
      printf "$Yellow$i\n$NC"
      git-update-repositories $i
    done
}

function git-update-repositories()
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

        printf $Cyan
        printf 'git diff --submodule\n'
        printf $NC
        git diff --submodule

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

function git-truncate-history()
{
  git checkout --orphan temp $1
  git commit -m 'Truncated history'
  git rebase --onto temp $1 master
  git checkout master
  git branch -D temp
}

function git-clone-kwatme()
{
  git clone --recursive https://github.com/KwatME/classification
  git clone --recursive https://github.com/KwatME/cluster
  git clone --recursive https://github.com/KwatME/cross_validation
  git clone --recursive https://github.com/KwatME/cryptograph
  git clone --recursive https://github.com/KwatME/dimension_reduction
  git clone --recursive https://github.com/KwatME/environment
  git clone --recursive https://github.com/KwatME/feature
  git clone --recursive https://github.com/KwatME/file
  git clone --recursive https://github.com/KwatME/genome
  git clone --recursive https://github.com/KwatME/geo
  git clone --recursive https://github.com/KwatME/gpg
  git clone --recursive https://github.com/KwatME/grch
  git clone --recursive https://github.com/KwatME/gsea
  git clone --recursive https://github.com/KwatME/hdf5
  git clone --recursive https://github.com/KwatME/information
  git clone --recursive https://github.com/KwatME/jupyter_gui
  git clone --recursive https://github.com/KwatME/kernel_density
  git clone --recursive https://github.com/KwatME/kwatme.com
  git clone --recursive https://github.com/KwatME/linear_algebra
  git clone --recursive https://github.com/KwatME/linear_model
  git clone --recursive https://github.com/KwatME/match
  git clone --recursive https://github.com/KwatME/matrix_decomposition
  git clone --recursive https://github.com/KwatME/mutational_signature
  git clone --recursive https://github.com/KwatME/nd_array
  git clone --recursive https://github.com/KwatME/network
  git clone --recursive https://github.com/KwatME/onco_gps
  git clone --recursive https://github.com/KwatME/plot
  git clone --recursive https://github.com/KwatME/probability
  git clone --recursive https://github.com/KwatME/regression
  git clone --recursive https://github.com/KwatME/sequence
  git clone --recursive https://github.com/KwatME/sequencing_process
  git clone --recursive https://github.com/KwatME/skew
  git clone --recursive https://github.com/KwatME/spro
  git clone --recursive https://github.com/KwatME/support
  git clone --recursive https://github.com/KwatME/tcga
  git clone --recursive https://github.com/KwatME/variant
  git clone --recursive https://github.com/UCSD-CCAL/ccal
}

function git-clone-guardiome()
{
  git clone --recursive https://github.com/Guardiome/genome_ai
  git clone --recursive https://github.com/Guardiome/genome_ai_server
  git clone --recursive https://github.com/Guardiome/genome_ai_ui
  git clone --recursive https://github.com/Guardiome/genome_app
  git clone --recursive https://github.com/Guardiome/genome_app_template
  git clone --recursive https://github.com/Guardiome/genome_apps_for_genome_ai
  git clone --recursive https://github.com/Guardiome/genomeapps.io
  git clone --recursive https://github.com/Guardiome/genotype_to_phenotype
  git clone --recursive https://github.com/Guardiome/pipeline
  git clone --recursive https://github.com/Guardiome/simple_genome_app_template
}

# ==============================================================================
# Make conda path visible
# ==============================================================================
export PATH="$HOME/Jumis/conda/bin:$PATH"

# ==============================================================================
# Style shell prompt
# ==============================================================================
PS1='[ \w ] '
