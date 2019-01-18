# Configure environment

## Set bash profile

[bash_profile](bash_profile)

```sh
mv bash_profile ~/.bash_aliases # Linux

mv bash_profile ~/.bash_profile # macOS
```

## Install miniconda for python 3.7

## Set conda profile

[condarc](condarc)

```sh
mv condarc ~/.condarc
```

## Configure conda environment

```sh
conda install --yes git &&

conda install --yes awscli &&

conda install --yes nodejs &&

conda install --yes jupyterlab &&

conda install --yes isort &&

conda install --yes black &&

pip install clean_ipynb &&

conda install --yes pylama &&

conda install --yes beautysh &&

conda install --yes click &&

conda install --yes pyyaml &&

conda install --yes twine &&

conda install --yes pyinstaller &&

conda install --yes numpy &&

conda install --yes pandas &&

conda install --yes xlrd &&

conda install --yes pytables &&

conda install --yes scipy &&

conda install --yes scikit-learn &&

conda install --yes statsmodels &&

conda install --yes matplotlib &&

conda install --yes seaborn &&

conda install --yes plotly &&

conda install --yes rpy2 &&

conda install --yes r-mass &&

conda install --channel Guardiome --yes pytabix &&

pip install pyfaidx &&

pip install GEOparse &&

conda install --channel bioconda --yes dwgsim &&

conda install --channel bioconda --yes skewer &&

conda install --channel bioconda --yes fastqc &&

conda install --channel bioconda --yes picard &&

conda install --channel bioconda --yes seqtk &&

conda install --channel bioconda --yes htslib &&

conda install --channel bioconda --yes samtools &&

conda install --channel bioconda --yes bwa &&

conda install --channel bioconda --yes kallisto &&

conda install --channel bioconda --yes freebayes &&

conda install --channel bioconda --yes bcftools &&

conda install --channel bioconda --yes snpeff &&

if [ "$(uname)" == "Darwin" ]; then :

  echo "Darwin"

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then

  echo "Configuring sequencing_process_python2.7 environment ..." &&

  conda create --name sequencing_process_python2.7 --yes python=2.7 &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes strelka &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes manta &&

  conda install --name sequencing_process_python2.7 --channel bioconda --yes canvas

fi &&

conda update --all --yes
```

## Install non-conda command line program

sra-tools

gdc-client

firehose_get

## Configure vi

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime &&

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Configure git

```sh
git config --global user.name KwatME &&

git config --global user.email kwatme8@gmail.com &&

git config --global credential.helper cache &&

git config --global credential.helper "cache --timeout=691200" &&

git config --list
```

## Install program

Chrome

Atom

GIMP

Caffeine

## Install chrome extension

LastPass

Addblock Plus

Vimium

## Install atom package

atom-beautify

-   Check Bash > Beautify on Save

-   Check Markdown > Beautify on Save

vim-mode-plus

ex-mode

git-plus

sort-lines

autocomplete-python

linter-pylama

-   Ignore Errors and Warnings > C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741

python-isort

python-black

linter-js-yaml

## Install jupyter extension

```sh
jupyter nbextension install --user https://github.com/lambdalisue/jupyter-vim-binding/archive/master.zip &&

jupyter nbextension enable jupyter-vim-binding-master/vim_binding &&

jupyter nbextension list &&

jupyter labextension install jupyterlab_vim &&

jupyter labextension install @jupyterlab/plotly-extension &&

jupyter labextension list
```

## Configure razer blade stealth

```sh
sudo vim /etc/default/grub
```

Set `GRUB_CMDLINE_LINUX_DEFAULT="button.lid_init_state=open"`

```sh
sudo reboot
```
