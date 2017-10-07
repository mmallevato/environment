# Set up environment

## Get `~/.*rc`s

```bash
$ cp rcs/bashrc ~/.bashrc
$ cp rcs/condarc ~/.condarc
# https://github.com/amix/vimrc
$ git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
$ sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Get Anaconda

```bash
Get Anaconda
$ conda update --all
$ conda install twine bfg java-jdk nodejs pyinstaller htslib fqtools samtools hisat2 freebayes bcftools snpeff rpy2 bcrypt pycrypto plotly biopython pyfaidx yapf pylama pytabix asciinema
$ pip install beautysh asciinema fastqp
```

## Get node packages

```bash
$ npm install -g electron electron-packager
```

## Get other softwares

- macOS only

  - Get xCode
  - Get brew

- Chrome
- Atom
- hugo
- Shotcut
- VLC media player

## Get Jupyter Notebook extensions

```bash
# http://jupyter-contrib-nbextensions.readthedocs.io/
$ conda install -c conda-forge jupyter_contrib_nbextensions
# https://github.com/lambdalisue/jupyter-vim-binding
$ cd $(jupyter --data-dir)/nbextensions
$ git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
$ jupyter nbextension enable vim_binding/vim_binding
```

## Get Atom packages

- atom-beautify
- autocomplete-python
- ex-mode
- git-plus
- linter-python
- python-tools
- vim-mode-plus
