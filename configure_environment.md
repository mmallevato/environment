# Configure environment

## Get profile

```sh
cp bashrc ~/.bashrc

cp condarc ~/.condarc
```

## Configure conda environment

Get conda from <https://conda.io/miniconda.html> and install

```sh
conda install --channel conda-forge --yes numpy
conda install --channel conda-forge --yes pandas
conda install --channel conda-forge --yes scipy
conda install --channel conda-forge --yes plotly
conda install --channel conda-forge --yes matplotlib
conda install --channel conda-forge --yes scikit-learn
conda install --channel conda-forge --yes rpy2
conda install --channel conda-forge --yes r-mass
conda install --channel conda-forge --yes statsmodels
pip install pyfaidx
pip install GEOparse
conda install --channel conda-forge --yes pytables
conda install --channel conda-forge --yes pytabix
conda install --channel Guardiome --yes pytabix
conda install --channel conda-forge --yes click
pip install ccal

conda install --channel conda-forge --yes pyinstaller
conda install --channel conda-forge --yes yapf
conda install --channel conda-forge --yes isort
conda install --channel conda-forge --yes pylama
conda install --channel conda-forge --yes jupyterlab

conda install --channel conda-forge --yes nodejs
conda install --channel conda-forge --yes yarn
conda install --channel conda-forge --yes twine

conda install --channel conda-forge --yes git
conda install --channel conda-forge --yes git-lfs
conda install --channel conda-forge --yes bfg

conda install --channel conda-forge --yes awscli

conda install --channel bioconda --yes dwgsim skewer fastqc picard seqtk htslib samtools bwa kallisto freebayes bcftools snpeff

if [ "$(uname)" == "Darwin" ]; then :

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  echo 'Configuring sequencing_process_python2.7 environment ...'

  conda create --name sequencing_process_python2.7 --yes python=2.7

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta  # canvas

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then :

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then :

fi

conda update --all --yes
```

## Configure vim

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Configure git

```sh
git config --global user.name username

git config --global user.email email

git config --global credential.helper 'cache --timeout=86400'
```

## Get Jupyter extension

```sh
jupyter labextension install jupyterlab_vim

jupyter labextension install @jupyterlab/plotly-extension
```

## Configure Atom

Install Atom

Install Atom packages

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

## Get browser stuff

-   LastPass
-   Addblock plus
-   Vimium
