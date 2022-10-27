# -----------------------------------------------------------------------
# Title: reshape eclsk Math data
# Author: William Murrah
# Description: Reshape with one variable to long
# Created: Thursday, 27 October 2022
# R version: R version 4.2.1 (2022-06-23)
# Project(working) directory: /Users/wmm0017/Projects/QMER/ReshapingDatawithR
# -----------------------------------------------------------------------

library(tidyr)
library(ggplot2)

load("data/eclsk250math.Rdata")

eclsk250math.long <- pivot_longer(eclsk250math, 
                                  cols = contains("mscalk5"),
                                  names_to = "grade",
                                  values_to = "math")

ggplot(eclsk250math.long, aes(x = grade, y = math, group = childid)) + 
  geom_line()

