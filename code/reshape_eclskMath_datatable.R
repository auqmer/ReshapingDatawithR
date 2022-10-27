# -----------------------------------------------------------------------
# Title: reshape eclsk Math data
# Author: William Murrah
# Description: Reshape with one variable to long
# Created: Thursday, 27 October 2022
# R version: R version 4.2.1 (2022-06-23)
# Project(working) directory: /Users/wmm0017/Projects/QMER/ReshapingDatawithR
# -----------------------------------------------------------------------

library(data.table)
library(ggplot2)

load("data/eclsk250math.Rdata")

eclsk250math <- data.table(eclsk250math)

eclsk250math.long <- melt(eclsk250math, 
                                  measure.vars = c("x1mscalk5","x2mscalk5", 
                                                   "x3mscalk5", "x4mscalk5", 
                                                   "x5mscalk5", "x6mscalk5", 
                                                   "x7mscalk5", "x8mscalk5", 
                                                   "x9mscalk5"),
                                  variable.name = "grade",
                                  value.name = "math")

ggplot(eclsk250math.long, aes(x = grade, y = math, group = childid)) + 
  geom_line()

