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
conda update --all --yes &&

# For Jupyter
conda install --channel conda-forge --yes jupyter jupyter_contrib_nbextensions nb_conda &&

# For coding
conda install --channel conda-forge --yes yapf isort pylama &&
pip install beautysh asciinema &&

# For managing
conda install --channel conda-forge --yes twine conda-build anaconda-client pyinstaller &&
pip install spro &&

# For git
conda install --channel conda-forge --yes git git-lfs bfg &&

# For computing
conda install --channel conda-forge --yes numpy xlrd pandas hdf5 pytables scikit-learn scipy statsmodels &&

# For plotting
conda install --channel conda-forge --yes matplotlib seaborn plotly &&

# For cryptography
conda install --channel conda-forge --yes pycrypto bcrypt &&

# For server
conda install --channel conda-forge --yes click flask flask-cors requests &&

# For R
conda install --channel conda-forge --yes rpy2 r-mass &&

# For bioinformatics
conda install --channel conda-forge --yes biopython &&
conda install --channel bioconda --yes pyfaidx &&
conda install --channel makman09 --yes pytabix &&
pip install pytabix geoparse &&

# For sequencing process
# conda create --name sequencing_process --yes &&

conda install --channel bioconda --yes dwgsim skewer fastqc picard gatk4 seqtk htslib samtools bwa hisat2 kallisto freebayes bcftools snpeff &&
pip install fastqp &&

conda create --name sequencing_process_python2.7 --yes python=2.7 &&

conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka manta &&  # canvas

# For node
conda install --channel node --yes nodejs yarn &&

# For Guardiome
conda install --channel conda-forge --yes markdown &&
pip install genotype_to_phenotype
```

## Set up git

```sh
git config --global user.name 'KwatME'
git config --global user.email kwatme8@gmail.com
git config --global credential.helper 'cache --timeout=86400'
```

## Set Jupyter password

```sh
jupyter notebook --generate-config
ls -a ~/.jupyter
jupyter notebook password
```

## Get Jupyter VIM binder from <https://github.com/lambdalisue/jupyter-vim-binding>

## Get other softwares

-   macOS only

    -   Get xCode
    -   Get brew

-   Chrome

-   Atom

-   hugo

-   VLC media player

-   Shotcut

## Get Atom packages

-   atom-beautify
-   autocomplete-python
-   ex-mode
-   git-plus
-   git-time-machine
-   linter-pylama

    Ignore `C901,D100,D104,D202,D203,D205,D212,D400,E251,E125,E50`

-   vim-mode-plus
