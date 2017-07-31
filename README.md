# ML_lib

This repository contains a wrapper function for Machine Learning tasks.

Usage example: 

```
source("tune_function.R")
nids <- read.csv("./Data/NIDS_factors.csv")
model <- tune(dta = nids, response = "income", method = "ctree", defaults.only = F)
```

The function loads the file "method_lib.R". This file needs to be updated to include all methods.

Use the following code to view available tuning parameters to be added to method_lib:

```
library(mlr)
getParamSet("regr.rpart")
# Shows tuning parameters for rpart
```

The idea is to populate method_lib with as many methods as possible. The tuning function currently only supports mlr.
