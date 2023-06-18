# Promiscuous, mimetic and Aire-dependent gene regulation in medullary epithelial thymus cells
This repository contains all the code for reproducing the figures and processed data of Aire-WT & -KO mTECs Multiome analysis. 
The analysis of the RNA data is done with the `metacells` python package, whereas the ATAC data analysis is done with the `mcATAC` R package.

## Quick links

- Metacells paper: Ben-KiKi et al. 2022 [Genome Biology](https://doi.org/10.1186/s13059-022-02667-1)
- Metacells package [Vignette](https://metacells.readthedocs.io/en/latest/Metacells_Vignette.html)

- [mcATAC R package](https://github.com/tanaylab/mcATAC)
  
- mTECs paper: Bornstein, C., Nevo, S., Giladi, A. et al. 2018 [Nature](https://doi.org/10.1038/s41586-018-0346-1)

## Usage
To begin, please clone this repository to your working directory.
make sure that you will not be limited by disk quota, as the necessary files will be quite large.

The repository contains:
* a `Dockerfile` - a docker image created to execute the complete code on your OS without the need of individual package installation.
* 2 Jupyter notebooks (see below)
* some helper scripts

next, pull the docker image and run it, so it will be available on the local web browser (see "Docker" instructions below).

### Running the notebooks
the analysis pipeline and workflow is divided into 2 sections - RNA and ATAC - where the RNA section is meant to be executed first.
Since the RNA notebook is the first to run, a command for downloading the data and extracting it is already embedded at the beginning of it, so you can simply start there and keep going for genreating the figures (however, if you're interested in doing so manually - see below "Downloading the data" section).

once you finish running through the RNA notebook, simply switch to the ATAC notebook.


### Downloading the data
the processed data, as well as the objects generated through the analysis pipeline and other dependencies (e.g. genomic tracks) are all available to download as a .tar.gz file (`mtecs_multiome_data.tar.gz`). 

**NOTE**: A command for downloading the data and extracting it is already embedded at the beginning of the RNA Jupyter notebook (make sure you don't download it again).

if you want to manually download it outside of the notebook, please run the following bash command from a designated working directory created for the project:
``` bash
wget https://mtec-multiome.s3.eu-west-1.amazonaws.com/mtecs_multiome_data.tar.gz
```
   
and then run:
``` bash
tar xvzf mtecs_multiome_data.tar.gz
```

you should have the following directories created:
``` bash
mtecs_multiome/
├── data
├── figs
├── gdb
└── objs
```

you'd probably want to remove the .tar.gz file at this point as it takes up a lot of space

### Docker 

1. Pull the docker image

```bash
docker pull tanaylab/mtecs_multiome:latest
```

2. Download the data (see above).

3. Run the docker container:

```bash
docker run -v $(pwd):/mtecs_multiome -p 8888:8888 tanaylab/mtecs_multiome:latest
```

Connect to the jupyter server running at port 8888.
