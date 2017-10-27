# Set up environment

## Get `~/.*rc`

```sh
cp rcs/bashrc ~/.bashrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cp rcs/condarc ~/.condarc
```

## Set up conda environments

### Set up root environment

```sh
conda update --all --yes

conda install --yes conda-build anaconda-client jupyter jupyter_contrib_nbextensions nb_conda yapf click requests isort pylama twine pyinstaller git-lfs bfg

pip install asciinema beautysh
```

### Set up ccal environment

```sh
conda create --name ccal --yes

conda install --name ccal --yes jupyter yapf click pandas hdf5 pytables scikit-learn scipy statsmodels matplotlib seaborn plotly pycrypto bcrypt biopython rpy2 r-mass

conda install --name ccal --channel bioconda --yes pyfaidx

source activate ccal
pip install pytabix
source deactivate
```

### Set up sp environment

```sh
conda create --name sp --yes

conda install --name sp --channel bioconda --yes jupyter yapf htslib picard fqtools bwa hisat2 samtools freebayes bcftools snpeff

conda install --name sp --channel auto --yes fastqp
```

### Set up node environment

```sh
conda create --name node --yes

conda install --channel node --yes nodejs

npm install --global electron electron-packager
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
