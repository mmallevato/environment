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
PROMPT_COMMAND="history -a"
PS1="(\W) > "


# =============================================================== #
# Environment
# =============================================================== #
export PATH="$HOME/Jumis/tools/anaconda/bin:$PATH"
export PATH="$HOME/Jumis/tools/bin:$PATH"

# Jupyter
alias nb="jupyter notebook ~"
alias nbserver="ipython notebook --no-browser --port=9000"
alias nbclient="ssh -N -f -L localhost:9999:localhost:9000"


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
alias df='df -Th'
alias h='history'
alias j='jobs -l'


# =============================================================== #
# Sanitize
# =============================================================== #
alias chmodall="find . -not -path '*/.*' -type f -exec chmod 644 {} \; && find . -not -path '*/.*' -type d -exec chmod 755 {} \;"
alias chownu="sudo chown -vR $USER ."
alias rmemp="find . -type f -size 0 -exec rm -f '{}' +"
alias rmpyc="find . | grep -E '(__pycache__|\.pyc$)' | xargs rm -rf"
alias rmdsstore="sudo find / -name .DS_Store -delete"


# =============================================================== #
# Compression
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

function gittrunc()
{
    git checkout --orphan temp $1
    git commit -m "Truncated history"
    git rebase --onto temp $1 master
    git checkout master
    git branch -D temp
}

function gitsync()
{
    for d in *
    do
        if [ -d $d ]; then
            printf '\n\n\n\n\n\n\n\n\n\n********************************************************************************\n'
            printf '%s\n' $d
            printf '********************************************************************************\n'
            cd $d

            printf '\n********** git status **********\n'
            git status

            printf "\n********** git submodule foreach 'git stash' **********\n"
            git submodule foreach 'git stash'

            printf '\n********** git submodule update --init --remote --recursive **********\n'
            git submodule update --init --remote --recursive

            printf '\n********** git diff --submodule **********\n'
            git diff --submodule

            printf '\n********** git add -A **********\n'
            git add -A

            printf "\n********** git commit -m $1 **********\n"
            git commit -m "$1"

            printf '\n********** git pull **********\n'
            git pull

            printf '\n********** git push **********\n'
            git push

            cd ..
            printf '\n********************************************************************************\n'
            printf '********************************************************************************\n'
        fi
    done
}

function git-clone-kwatme ()
{
    git clone --recursive https://github.com/KwatME/mutationalsignature;
    git clone --recursive https://github.com/KwatME/match;
    git clone --recursive https://github.com/KwatME/bayesian;
    git clone --recursive https://github.com/KwatME/plot;
    git clone --recursive https://github.com/KwatME/gsea;
    git clone --recursive https://github.com/KwatME/environment
    git clone --recursive https://github.com/KwatME/file;
    git clone --recursive https://github.com/KwatME/dnaexecution;
    git clone --recursive https://github.com/KwatME/clustering;
    git clone --recursive https://github.com/KwatME/variant;
    git clone --recursive https://github.com/KwatME/skew;
    git clone --recursive https://github.com/KwatME/helper;
    git clone --recursive https://github.com/KwatME/feature;
    git clone --recursive https://github.com/KwatME/dimensionreduction;
    git clone --recursive https://github.com/KwatME/kde;
    git clone --recursive https://github.com/KwatME/oncogps;
    git clone --recursive https://github.com/KwatME/tcga;
    git clone --recursive https://github.com/KwatME/sequence;
    git clone --recursive https://github.com/KwatME/regression;
    git clone --recursive https://github.com/KwatME/network;
    git clone --recursive https://github.com/KwatME/matrixdecomposition;
    git clone --recursive https://github.com/KwatME/linearmodel;
    git clone --recursive https://github.com/KwatME/linearalgebra;
    git clone --recursive https://github.com/KwatME/information;
    git clone --recursive https://github.com/KwatME/hdf5;
    git clone --recursive https://github.com/KwatME/dataplay;
    git clone --recursive https://github.com/KwatME/classification;
    git clone --recursive https://github.com/KwatME/ccal;
    git clone --recursive https://github.com/KwatME/jupytergui;
    git clone --recursive https://github.com/KwatME/encryption;
}
