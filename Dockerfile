# Note: the dockerfile is assumed to be built from the wiser project directory
FROM jupyter/datascience-notebook:r-4.1.1

# Install rpm dependencies
USER root
RUN apt-get update && apt-get install -y git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev libgtk2.0-dev libhiredis-dev libcairo2-dev libxt-dev xvfb xauth xfonts-base vim && rm -rf /var/lib/apt/lists/*
USER ${NB_UID}

ENV GITHUB_PAT=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

# Install BiocManager and reticulate
RUN R -e 'install.packages("BiocManager", repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("reticulate", repos = "http://cran.us.r-project.org")'

RUN pip3 install metacells
RUN pip3 install anndata
RUN pip3 install adjustText

RUN R -e 'remotes::install_github(repo="tanaylab/mcATAC",ref="6eb816a108c99cfee4af12a0326b2b59f00b9c1a")'
RUN R -e 'remotes::install_github("tanaylab/tgconfig")'
RUN R -e 'remotes::install_github("tanaylab/tglkmeans")'
RUN R -e 'install.packages("tidyverse",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("dplyr",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("pheatmap",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("gridExtra",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("Matrix",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("MatrixGenerics",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("reshape2",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("ggplot2",repos = "http://cran.us.r-project.org")'
RUN R -e 'install.packages("ggrepel",repos = "http://cran.us.r-project.org")'
RUN R -e 'BiocManager::install("tanaylab/metacell")'
RUN R -e 'BiocManager::install("tanaylab/prego")'

ENV JUPYTER_ENABLE_LAB=yes

USER root

RUN git clone https://github.com/tanaylab/mtecs_multiome.git

WORKDIR /mtecs_multiome

RUN chown -R ${NB_UID} /mtecs_multiome
RUN chgrp -R ${NB_GID} /mtecs_multiome

USER ${NB_UID}

RUN touch /mtecs_multiome/.here

#RUN R -e 'source("scripts/download_data.r")'

