# Configure environment

## Get profile

Get .bashrc

Get .condarc

## Configure conda environment

Get conda from <https://conda.io/miniconda.html> and install

```sh
conda install --channel conda-forge --yes numpy pandas scipy plotly matplotlib scikit-learn rpy2 r-mass statsmodels pytables click &&

conda install --channel Guardiome --yes pytabix &&

pip install pyfaidx GEOparse &&

conda install --channel conda-forge --yes pyinstaller yapf isort pylama jupyterlab nodejs yarn twine git git-lfs bfg awscli &&

conda install --channel bioconda --yes dwgsim skewer fastqc picard seqtk htslib samtools bwa kallisto freebayes bcftools snpeff &&

if [ "$(uname)" == "Darwin" ]; then :

  echo 'Darwin'

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  echo 'Configuring sequencing_process_python2.7 environment ...' &&

  conda create --name sequencing_process_python2.7 --yes python=2.7 &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta # canvas

fi

conda update --all --yes
```

## Configure vi

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime &&

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Configure git

```sh
git config --global user.name KwatME &&

git config --global user.email kwatme8@gmail.com
```

## Get Jupyter extension

```sh
jupyter labextension install jupyterlab_vim &&

jupyter labextension install @jupyterlab/plotly-extension
```

## Configure Atom

Install Atom and its package

-   atom-beautify

    Set Python beautifier to be yapf

    Set Python formatter to be yapf

    Check Python Beautify on Save

    Check Markdown Beautiy on Save

-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Add to Ignore Errors and Warnings C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741

-   vim-mode-plus

Install GIMP

## Get browser stuff

-   LastPass
-   Addblock Plus
-   Vimium
