# Set up environment

## Get `~/.*rc`

```bash
cp rcs/bashrc ~/.bashrc

git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

cp rcs/condarc ~/.condarc
```

## Set up conda environments

### Set up global environment

```bash
conda update --all --yes

conda install --yes jupyter jupyter_contrib_nbextensions yapf pylama twine pyinstaller git-lfs bfg

pip install asciinema beautysh
```

### Set up ccal environment

```bash
conda create --name ccal --yes

conda install --name ccal --yes pandas scikit-learn scipy statsmodels matplotlib seaborn plotly pycrypto bcrypt biopython rpy2 r-mass

conda install --name ccal --channel bioconda --yes pyfaidx pytabix
```

### Set up binf environment

```bash
conda create --name binf --yes

conda install --name binf --channel bioconda --yes htslib picard fqtools bwa hisat2 samtools freebayes bcftools snpeff

conda install --name binf --channel auto --yes fastqp
```

### Set up nodejs environment

```bash
conda create --name nodejs --yes

conda install --channel nodejs --yes nodejs

npm install --global electron electron-packager
```

## Get other softwares

- macOS only

  - Get xCode
  - Get brew

- Chrome

- Atom

- hugo

- VLC media player

- Shotcut

## Set Jupyter password (for deploying notebook on server)

```bash
jupyter notebook --generate-config
ls -a ~/.jupyter
jupyter notebook password
```

## Get Jupyter VIM binder

```bash
cd $(jupyter --data-dir)/nbextensions

git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding

jupyter nbextension enable vim_binding/vim_binding
```

## Get Atom packages

- atom-beautify
- autocomplete-python
- ex-mode
- git-plus
- linter-python
- python-tools
- vim-mode-plus
