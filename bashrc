# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# =============================================================== #
# Greet
# =============================================================== #
date
screen -ls


function _exit()
{
    date
}
trap _exit EXIT


# =============================================================== #
# Shell Prompt
# =============================================================== #
PS1="(\W) > "


# =============================================================== #
# Environment
# =============================================================== #
export PATH="$HOME/Jumis/tools/anaconda/bin:$PATH"

# Jupyter
alias nbserver="ipython notebook --no-browser --port=8000"
alias nbclient="ssh -N -f -L localhost:9999:localhost:8000"


# =============================================================== #
# Aliases and functions
# =============================================================== #
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ls='ls -FhG'
alias la='ls -Fla'          #  Show hidden files.
alias lx='ls -FlXB'         #  Sort by extension. (does not work on OSX)
alias lk='ls -FlSr'         #  Sort by size, biggest last.
alias lt='ls -Fltr'         #  Sort by date, most recent last.
alias lc='ls -Fltcr'        #  Sort by/show change time, most recent last.
alias lu='ls -Fltur'        #  Sort by/show access time, most recent last.

alias rm='rm -i'

alias cp='cp -i'

alias mv='mv -i'

alias mkdir='mkdir -vp'

alias rsync='rsync --verbose --recursive --links --perms --times --delete --delete-excluded --human-readable --progress --exclude=*.DS_Store* --exclude=*.ipynb_checkpoints* --exclude=*._*'

alias du='du -hs'


# =============================================================== #
# Sanitize
# =============================================================== #
alias chmodall="find . -not -path '*/.*' -type f -exec chmod 644 {} \; && find . -not -path '*/.*' -type d -exec chmod 755 {} \;"
alias chownu="sudo chown -vR $USER ."
alias rmemp="find . -type f -size 0 -exec rm -f '{}' +"
alias rmpyc="find . | grep -E '(__pycache__|\.pyc$)' | xargs rm -rf"
alias rmdsstore="sudo find / -name .DS_Store -delete"


# =============================================================== #
# Compress
# =============================================================== #
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bzip2 -dk $1    ;;
            *.rar)       unrar x $1      ;;
            *.bz2)       bzip2 -dk $1    ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via >extract<" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}


# Creates an archive (*.tar.gz) from given directory.
function maketar() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }


# Create a ZIP archive of a file or folder.
function makezip() { zip -r "${1%%/}.zip" "$1" ; }


# =============================================================== #
# Git
# =============================================================== #
alias gitcch="git config --global credential.helper cache; git config --global credential.helper 'cache --timeout=36000'"


function gitsync()
{
    for d in *
    do
        if [ -d $d ]; then
            printf '\n\n\n\n\n\n\n\nvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n'
            printf '%s\n' $d
            printf 'vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv\n'
            cd $d

            printf '\n******** git status ********\n'
            git status

            printf "\n******** git submodule foreach 'git reset --hard' ********\n"
            git submodule foreach 'git reset --hard'

            printf "\n******** git submodule foreach 'git clean -fd' ********\n"
            git submodule foreach 'git clean -fd'

            printf '\n******** git submodule update --init --remote --recursive ********\n'
            git submodule update --init --remote --recursive

            printf '\n******** git diff --submodule ********\n'
            git diff --submodule

            printf '\n******** git add -A ********\n'
            git add -A

            printf "\n******** git commit -m $1 ********\n"
            git commit -m "$1"

            printf '\n******** git pull ********\n'
            git pull

            printf '\n******** git push ********\n'
            git push

            cd ..
            printf '\n^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^\n'
        fi
    done
}


function gittrunc()
{
    git checkout --orphan temp $1
    git commit -m "Truncated history"
    git rebase --onto temp $1 master
    git checkout master
    git branch -D temp
}


function gitclonekwatme ()
{
    git clone --recursive https://github.com/KwatME/bayesian;
    git clone --recursive https://github.com/KwatME/ccal;
    git clone --recursive https://github.com/KwatME/classification;
    git clone --recursive https://github.com/KwatME/clustering;
    git clone --recursive https://github.com/KwatME/dataplay;
    git clone --recursive https://github.com/KwatME/dimensionreduction;
    git clone --recursive https://github.com/KwatME/encryption;
    git clone --recursive https://github.com/KwatME/environment;
    git clone --recursive https://github.com/KwatME/file;
    git clone --recursive https://github.com/KwatME/firebrowse;
    git clone --recursive https://github.com/KwatME/gsea;
    git clone --recursive https://github.com/KwatME/hdf5;
    git clone --recursive https://github.com/KwatME/helper;
    git clone --recursive https://github.com/KwatME/information;
    git clone --recursive https://github.com/KwatME/jupytergui;
    git clone --recursive https://github.com/KwatME/kde;
    git clone --recursive https://github.com/KwatME/linearalgebra;
    git clone --recursive https://github.com/KwatME/linearmodel;
    git clone --recursive https://github.com/KwatME/match;
    git clone --recursive https://github.com/KwatME/matrixdecomposition;
    git clone --recursive https://github.com/KwatME/mutationalsignature;
    git clone --recursive https://github.com/KwatME/network;
    git clone --recursive https://github.com/KwatME/oncogps;
    git clone --recursive https://github.com/KwatME/plot;
    git clone --recursive https://github.com/KwatME/processing;
    git clone --recursive https://github.com/KwatME/regression;
    git clone --recursive https://github.com/KwatME/sequence;
    git clone --recursive https://github.com/KwatME/skew;
    git clone --recursive https://github.com/KwatME/tcga;
}

function gitcloneguardiome ()
{
    git clone --recursive https://github.com/Guardiome/create-genome-app;
    git clone --recursive https://github.com/Guardiome/feature;
    git clone --recursive https://github.com/Guardiome/g2p;
    git clone --recursive https://github.com/Guardiome/genome;
    git clone --recursive https://github.com/Guardiome/genome-ai;
    git clone --recursive https://github.com/Guardiome/genome-ai-server;
    git clone --recursive https://github.com/Guardiome/genome-ai-ui;
    git clone --recursive https://github.com/Guardiome/genomeapptools;
    git clone --recursive https://github.com/Guardiome/raspberrypi;
    git clone --recursive https://github.com/Guardiome/variant;
}
