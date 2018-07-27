# Configure environment

## Get profile

```sh
cp bashrc ~/.bashrc

cp condarc ~/.condarc
```

## Configure conda environment

### Get conda from <https://conda.io/miniconda.html> and install

### Install stuff using conda

```sh
conda update --all --yes

conda install --channel conda-forge --yes jupyterlab nodejs yarn twine pyinstaller pefile git git-lfs bfg yapf isort pylama numpy pandas xlrd hdf5 pytables scipy scikit-learn statsmodels cython matplotlib plotly pycrypto bcrypt click flask flask-cors requests biopython rpy2 r-mass

conda install --channel Guardiome --yes pytabix

pip install geoparse ccal

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

### Install Atom

### Install Atom packages

-   atom-beautify

    Set `Python` beautifier to be `yapf`

-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Ignore C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741

-   vim-mode-plus

## Get browser stuff

-   LastPass
-   Addblock plus
-   Vimium
