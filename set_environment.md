# Set up environment

## Get profile

```sh
cp bashrc ~/.bashrc

cp condarc ~/.condarc
```

## Set up conda root environment

### Get conda from <https://conda.io/miniconda.html> and install

### Install stuff using conda

```sh
conda update --all --yes

conda install --channel conda-forge --yes jupyterlab

conda install --channel conda-forge --yes yapf isort pylama

conda install --channel conda-forge --yes git git-lfs bfg

conda install --channel conda-forge --yes pyinstaller twine

conda install --channel conda-forge --yes numpy pandas xlrd hdf5 pytables scipy scikit-learn statsmodels

conda install --channel conda-forge --yes matplotlib plotly

conda install --channel conda-forge --yes pycrypto bcrypt

conda install --channel conda-forge --yes click flask flask-cors requests

conda install --channel conda-forge --yes rpy2 r-mass

conda install --channel conda-forge --yes biopython

conda install --channel Guardiome --yes pytabix

conda install --channel conda-forge --yes cython pefile

pip install geoparse

conda install --channel bioconda --yes dwgsim skewer fastqc picard seqtk htslib samtools bwa kallisto freebayes bcftools snpeff

if [ "$(uname)" == "Darwin" ]; then :

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  conda create --name sequencing_process_python2.7 --yes python=2.7

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta  # canvas

  echo 'Set up sequencing_process_python2.7 environment.'

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then :

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then :

fi

conda install --channel conda-forge --yes nodejs yarn

pip install genotype_to_phenotype

pip install ccal

conda update --all --yes
```

## Set up vim

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Set up git

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

## Get other software

-   macOS

    -   Get xCode
    -   Get brew

-   Chrome

-   Atom

## Get browser extension

-   LastPass
-   Addblock plus
-   Vimium

## Get Atom package

-   atom-beautify

    Set `Python` beautifier to be `yapf`

-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Ignore C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741

-   vim-mode-plus
