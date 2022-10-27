# -----------------------------------------------------------------------
# Title: create ECLSK250 data sets
# Author: William Murrah
# Description: description
# Created: Thursday, 27 October 2022
# R version: R version 4.2.1 (2022-06-23)
# Project(working) directory: /Users/wmm0017/Projects/QMER/ReshapingDatawithR
# -----------------------------------------------------------------------
# Packages used:
library(dplyr)

# file path to data directory
data_path <- "~/qmer/projects/ECLSK11_GrowthCurvePaper2022/data/"

load(paste0(data_path,"eclsk250.Rdata"))

# Create math only data
eclsk250math <- eclsk250 %>% 
  select(c("childid", "x_chsex_r", "x_raceth_r", 
           "x12sesl", contains("mscalk5")))

save(eclsk250, file = "data/eclsk250.Rdata")

save(eclsk250math, file = "data/eclsk250math.Rdata")

# clean up environment
rm(data_path)
     