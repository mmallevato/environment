# Set up environment

## Get `~/.*rc`

```sh
cp bashrc ~/.bashrc

cp condarc ~/.condarc
```

## Set up vim

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Set up conda root environments

### Get miniconda from <https://conda.io/miniconda.html> and install

### Install stuff

```sh
conda update --name base conda --yes &&

conda update --all --yes &&

conda install --channel conda-forge --yes jupyterlab jupyter_contrib_nbextensions nb_conda &&

conda install --channel conda-forge --yes yapf isort pylama &&

pip install beautysh &&

conda install --channel conda-forge --yes twine conda-build anaconda-client pyinstaller &&

pip install spro &&

conda install --channel conda-forge --yes git git-lfs bfg &&

conda install --channel conda-forge --yes numpy xlrd pandas hdf5 pytables scikit-learn scipy statsmodels &&

conda install --channel conda-forge --yes plotly matplotlib &&

conda install --channel conda-forge --yes pycrypto bcrypt &&

conda install --channel conda-forge --yes click flask flask-cors requests &&

conda install --channel conda-forge --yes rpy2 r-mass &&

conda install --channel conda-forge --yes biopython &&

conda install --channel bioconda --yes pyfaidx &&

conda install --channel makman09 --yes pytabix &&

pip install pytabix geoparse &&

conda install --channel bioconda --yes dwgsim skewer fastqc picard gatk4 seqtk htslib samtools bwa hisat2 kallisto freebayes bcftools snpeff &&

pip install fastqp &&

if [ "$(uname)" == "Darwin" ]; then :

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  conda create --name sequencing_process_python2.7 --yes python=2.7 &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta &&  # canvas

  echo 'Set up sequencing_process_python2.7 environment.'

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then :

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then :

fi

conda install --channel node --yes nodejs &&

conda install --channel conda-forge --yes yarn &&

pip install genotype_to_phenotype &&

conda update --all --yes
```

## Set up git

```sh
git config --global user.name 'KwatME'

git config --global user.email kwatme8@gmail.com

git config --global credential.helper 'cache --timeout=86400'
```

## Get Jupyter VIM binder

```sh
jupyter labextension install jupyterlab_vim
```

## Set Jupyter password (for deploying notebook on server)

```sh
jupyter notebook --generate-config

ls -a ~/.jupyter

jupyter notebook password
```

## Get other softwares

-   macOS only

    -   Get xCode
    -   Get brew

-   Chrome

-   Atom

-   hugo

-   VLC media player

-   Shotcut

-   Etcher

## Get Atom packages

-   atom-beautify
-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Ignore 'C901,D100,D101,D102,D103,D104,D105,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741'

-   vim-mode-plus
