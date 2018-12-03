# Configure environment

## Get profile

Save [bashrc](bashrc) as `~/.bashrc` (for Linux) or as `~/.bash_profile` (for macOS)

Save [condarc](condarc) as `~/.condarc`

## Configure `conda` environment

Install [conda](https://conda.io/miniconda.html)

Install `conda` stuff:

```sh
conda install --channel conda-forge --yes git &&
conda install --channel conda-forge --yes git-lfs &&
conda install --channel conda-forge --yes bfg &&

conda install --channel conda-forge --yes awscli &&

conda install --channel conda-forge --yes nodejs &&
conda install --channel conda-forge --yes yarn &&

conda install --channel conda-forge --yes jupyterlab &&
conda install --channel conda-forge --yes jupyter_contrib_nbextensions &&

conda install --channel conda-forge --yes isort &&
conda install --channel conda-forge --yes black &&
pip install clean_ipynb &&
conda install --channel conda-forge --yes pylama &&

conda install --channel conda-forge --yes click &&

conda install --channel conda-forge --yes twine &&

conda install --channel conda-forge --yes pyinstaller &&

conda install --channel conda-forge --yes numpy &&
conda install --channel conda-forge --yes pandas &&
conda install --channel conda-forge --yes xlrd &&

conda install --channel conda-forge --yes pytables &&

conda install --channel conda-forge --yes scipy &&

conda install --channel conda-forge --yes scikit-learn &&
conda install --channel conda-forge --yes statsmodels &&

conda install --channel conda-forge --yes plotly &&
conda install --channel conda-forge --yes matplotlib &&

conda install --channel conda-forge --yes rpy2 &&
conda install --channel conda-forge --yes r-mass &&

conda install --channel bcbio --yes pytabix &&
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
  conda install --name sequencing_process_python2.7 --channel bioconda --yes canvas &&

fi &&

conda update --all --yes
```

## Configure `vi`

```sh
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime &&

sh ~/.vim_runtime/install_awesome_vimrc.sh
```

## Configure `git`

```sh
git config --global user.name KwatME &&
git config --global user.email kwatme8@gmail.com &&
git config --global credential.helper cache &&
git config --global credential.helper "cache --timeout=691200" &&
git config --list
```

## Configure `atom`

Install [atom](https://atom.io/)

Install `atom` stuff:

-   atom-beautify

    -   Check `Bash` > `Beautify on Save`
    -   Check `Markdown` > `Beautify on Save`


-   vim-mode-plus
-   ex-mode

-   git-plus

-   sort-lines

-   autocomplete-python

-   linter-pylama

    -   Add to `Ignore Errors and Warnings` `C901,D100,D101,D102,D103,D104,D105,D107,D202,D203,D205,D212,D301,D400,E50,E125,E251,E741`


-   linter-python

-   python-isort
-   python-black

-   beautysh

## Get `jupyter` extension

```sh
jupyter nbextension install --user https://github.com/drillan/jupyter-black/archive/master.zip &&

jupyter nbextension enable jupyter-black-master/jupyter-black &&

jupyter nbextension install --user https://github.com/lambdalisue/jupyter-vim-binding/archive/master.zip &&

jupyter nbextension enable vim_binding/vim_binding
```

## Configure web browser

Install [Chorme](https://www.google.com/chrome/)

Get extension:

-   LastPass
-   Addblock Plus
-   Vimium
