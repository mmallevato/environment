# Set up environment

## Get `~/.*rc`

```sh
cp rcs/bashrc ~/.bashrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cp rcs/condarc ~/.condarc
```

## Set up conda root environments

```sh
conda update --all --yes

# For Jupyter
conda install --yes jupyter jupyter_contrib_nbextensions nb_conda

# For coding
conda install --yes yapf isort pylama
pip install beautysh asciinema

# For managing
conda install --yes twine conda-build anaconda-client pyinstaller
pip install spro

# For git
conda install --yes git git-lfs bfg

# For computing
conda install --yes numpy pandas hdf5 pytables scikit-learn scipy statsmodels

# For plotting
conda install --yes matplotlib seaborn plotly

# For cryptography
conda install --yes pycrypto bcrypt

# For server
conda install --yes click flask flask-cors requests

# For R
conda install --yes rpy2 r-mass

# For bioinformatics
conda install --yes biopython
conda install --channel bioconda --yes pyfaidx
pip install pytabix

# For sequencing process
conda install --channel bioconda --yes htslib picard fqtools bwa hisat2 samtools freebayes bcftools snpeff
conda install --channel auto --yes fastqp

# For node
conda install --channel node --yes nodejs
npm install --global electron electron-packager

# For Guardiome
conda install --yes genotype_to_phenotype markdown
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

## Set Jupyter password (for deploying notebook on server)

```sh
jupyter notebook --generate-config
ls -a ~/.jupyter
jupyter notebook password
```

## Get Jupyter VIM binder

```sh
cd $(jupyter --data-dir)/nbextensions

git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding

jupyter nbextension enable vim_binding/vim_binding
```

## Get Atom packages

-   atom-beautify
-   autocomplete-python
-   ex-mode
-   git-plus
-   linter-python
-   vim-mode-plus
