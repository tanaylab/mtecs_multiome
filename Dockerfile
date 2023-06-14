FROM bioconductor/bioconductor_docker:RELEASE_3_12

# Install rpm dependencies
RUN apt-get update && apt-get install -y  git-core libcurl4-openssl-dev libgit2-dev libicu-dev libssl-dev libxml2-dev make pandoc pandoc-citeproc zlib1g-dev libgtk2.0-dev libcairo2-dev libxt-dev xvfb xauth xfonts-base vim && rm -rf /var/lib/apt/lists/*


RUN R -e 'remotes::install_github(repo="tanaylab/mcATAC",ref="6eb816a108c99cfee4af12a0326b2b59f00b9c1a")'
RUN R -e 'remotes::install_github("tanaylab/tgconfig")'
RUN R -e 'remotes::install_github("tanaylab/tglkmeans")'
RUN R -e 'install.packages("tidyverse")'
RUN R -e 'install.packages("dplyr")'
RUN R -e 'install.packages("pheatmap")'
RUN R -e 'install.packages("gridExtra")'
RUN R -e 'install.packages("umap")'
RUN R -e 'install.packages("Matrix")'
RUN R -e 'install.packages("MatrixGenerics")'
RUN R -e 'install.packages("reshape2")'
RUN R -e 'install.packages("ggplot2")'
RUN R -e 'install.packages("ggrepel")'
RUN R -e 'BiocManager::install("tanaylab/metacell")'
RUN R -e 'BiocManager::install("tanaylab/prego")'


RUN git clone https://github.com/tanaylab/mtecs_multiome.git

WORKDIR /mtecs_multiome

#RUN R -e 'source("scripts/download_data.r")'

# Run R
CMD ["R"]
