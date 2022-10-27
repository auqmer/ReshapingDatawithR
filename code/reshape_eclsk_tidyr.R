# -----------------------------------------------------------------------
# Title: reshape eclsk math, reading, science  data
# Author: William Murrah
# Description: Reshape with one variable to long
# Created: Thursday, 27 October 2022
# R version: R version 4.2.1 (2022-06-23)
# Project(working) directory: /Users/wmm0017/Projects/QMER/ReshapingDatawithR
# -----------------------------------------------------------------------

library(tidyr)
library(ggplot2)

load("data/eclsk250.Rdata")

eclsk250.long <- pivot_longer(eclsk250, 
                                  cols =c(contains("mscalk5"),
                                             contains("rscalk5"),
                                             contains("sscalk5")),
                                  names_to = c("grade", "subject"),
                                  names_sep = c(2,3),
                                  values_to = "score")

ggplot(eclsk250.long, aes(x = grade, y = score, group = childid)) + 
  geom_line() + facet_grid(subject ~ .)

