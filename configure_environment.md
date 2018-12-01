# Configure environment

## Get profile

Save [bashrc](bashrc) as `~/.bashrc` (for Linux) or `~/.bash_profile` (for macOS)

Save [condarc](condarc) as `~/.condarc`

## Configure `conda` environment

Install [conda](https://conda.io/miniconda.html)

Install `conda` stuff:

```sh
conda install --channel conda-forge --yes numpy pandas xlrd scipy plotly matplotlib scikit-learn rpy2 r-mass statsmodels pytables click &&

conda install --channel Guardiome --yes pytabix &&

pip install pyfaidx GEOparse &&

conda install --channel conda-forge --yes pyinstaller yapf isort pylama beautysh jupyterlab nodejs yarn twine git git-lfs bfg awscli &&

conda install --channel bioconda --yes dwgsim skewer fastqc picard seqtk htslib samtools bwa kallisto freebayes bcftools snpeff &&

# conda-env remove --yes --name sequencing_process_python2.7 &&

if [ "$(uname)" == "Darwin" ]; then :

  echo 'Darwin'

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  echo 'Configuring sequencing_process_python2.7 environment ...' &&

  conda create --name sequencing_process_python2.7 --yes python=2.7 &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta canvas

fi &&

conda update --all --yes
```

## Configure `vi`

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime &&

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Configure `atom`

Install [atom](https://atom.io/)

Install `atom` stuff:

-   atom-beautify

    Check `Bash` > `Beautify on Save`

    Check `Markdown` > `Beautify on Save`

-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Add to `Ignore Errors and Warnings` `C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741`

-   vim-mode-plus

## Get `jupyter` extension

```sh
jupyter nbextension install --user https://github.com/drillan/jupyter-black/archive/master.zip

jupyter nbextension enable vim_binding/vim_binding

jupyter nbextension install --user https://github.com/lambdalisue/jupyter-vim-binding/archive/master.zip

jupyter nbextension enable jupyter-black-master/jupyter-black
```

## Get other software

-   Chrome
-   GIMP

## Get browser stuff

-   LastPass
-   Addblock Plus
-   Vimium
