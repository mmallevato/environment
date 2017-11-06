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

conda install --yes jupyter jupyter_contrib_nbextensions nb_conda isort yapf pylama twine conda-build anaconda-client pyinstaller git git-lfs bfg

pip install spro asciinema beautysh
```

### Set up ccal environment

```sh
conda create --name ccal --yes

conda install --name ccal --yes jupyter yapf click requests pandas hdf5 pytables scikit-learn scipy statsmodels matplotlib seaborn plotly pycrypto bcrypt biopython rpy2 r-mass

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

### Set up flask environment

```sh
conda create --name flask --yes

conda install --name flask --yes flask flask-cors
```

### Set up node environment

```sh
conda create --name node --yes

conda install --channel node --yes nodejs

npm install --global electron electron-packager
```

### Set up guardiome environment

```sh
conda create --name guardiome --yes

conda install --name guardiome --yes jupyter yapf flask flask-cors spro pandas hdf5 pytables biopython genotype_to_phenotype

conda install --name guardiome --yes --channel bioconda pyfaidx

source activate guardiome
pip install pytabix
source deactivate
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
