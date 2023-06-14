# Promiscuous, mimetic and Aire-dependent gene regulation in medullary epithelial thymus cells
This repository contains all the code for reproducing the figures and processed data of Aire-WT & -KO mTECs Multiome analysis. 
The analysis of the RNA data is done with the `metacells` python package, whereas the ATAC data analysis is done with the `mcATAC` R package.

### Quick links

- Metacells paper: Ben-KiKi et al. 2022 [Genome Biology](https://doi.org/10.1186/s13059-022-02667-1)

- mTECs paper: Bornstein, C., Nevo, S., Giladi, A. et al. 2018 [Nature](https://doi.org/10.1038/s41586-018-0346-1)

- [mcATAC R package](https://github.com/tanaylab/mcATAC) 

### Usage
1. to initiate, you will need to download a .zip file (`mtecs_multiome_data.tar.gz`) that contains all the required raw data, cached objects and specifications.

   to do that, please run the following bash command from a designated working directory created for the project:
   ``` bash
   wget https://mtec-multiome.s3.eu-west-1.amazonaws.com/mtecs_multiome_data.tar.gz
   ```
   
   and then run:
   ``` bash
   tar xvzf mtecs_multiome_data.tar.gz
   ```

2. analysis pipeline and workflow is divided into 2 sections - RNA and ATAC - where the RNA section is meant to be executed first.
