library(ggplot2)
library(ggrepel)
library(dplyr)
library(tidyselect)

args <- commandArgs(trailingOnly = T)

## wd --> args[1]
## fn --> args[2]

file_nm = strsplit(args[1],split = ',')%>%unlist()%>%.[1]
mod_col = strsplit(args[1],split = ',')%>%unlist()%>%.[2]

# message("Received Arguments:")

message(sprintf("Received %s Arguments:",length(args)))
message(sprintf("file name: %s",file_nm))
message(sprintf("module_color: %s",mod_col))

message(sprintf("file exists: %s", file.exists(file_nm)))

mod = gsub(file_nm,pattern = '_mean_exp_Feb23.csv',replacement = '')

# setwd(wd)
egc_mean_exp = read.csv(file_nm,header = T,row.names = 1)
egc_mean_exp = egc_mean_exp%>%mutate(log_fc=KO-WT)

message(sprintf("received file. module: %s",mod))

fc_t = quantile(abs(egc_mean_exp$log_fc),0.995)

## removing experiment artefacts (e.g. sex-genes like Xist)
egc_mean_exp = egc_mean_exp[setdiff(rownames(egc_mean_exp),'Xist'),]

##centering figure in the 0 fc:
xlim = max(abs(egc_mean_exp$log_fc))

g<-ggplot(egc_mean_exp,aes(log_fc,WT))+
        geom_point(fill=mod_col,pch=21,color='black')+
        scale_x_continuous(limits = c(-2.22-0.05,2.22+0.05))+
        theme_classic()+theme(axis.title = element_text(size=18),axis.text = element_text(size=12))+      
        geom_text_repel(label=ifelse(abs(egc_mean_exp$log_fc)>=fc_t,rownames(egc_mean_exp),''),size=12,
                        force_pull = 0, nudge_x = 0.03,nudge_y = 0.05,max.overlaps = 20)+
  guides(size='none')+
        labs(y=sprintf('log2 Mean Expression in WT %s cells',gsub('_mod','',mod)),x='log2 FC (KO/WT)')

ggsave(g,filename = sprintf('%s_Feb23.png',mod),width = 16,height = 8)
message("saved figure")