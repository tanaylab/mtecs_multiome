# mtecs_multiome

This repository bundles the necessities for reproducing the figures and processed data of mTECs Multiome analysis.
1. to initiate, you will need to download a .zip file (`my_data.tar.gz`) that contains all the required raw data, cached objects and specifications.

   to do that, please run the following bash command from a designated working directory created for the project:
   ``` bash
   wget https://mtec-multiome.s3.eu-west-1.amazonaws.com/mtecs_multiome_data.tar.gz
   ```
   
   and then run:
   ``` bash
   tar xvzf mtecs_multiome_data.tar.gz
   ```

2. analysis pipeline and workflow is divided into 2 sections - RNA and ATAC - where the RNA section is meant to be executed first.
