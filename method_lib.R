# ------------------------------------------------------------------------------------------
# ML_Lib
# METHOD LIBRARY
# ------------------------------------------------------------------------------------------

method_lib <- list(
  
  # Recursive Partioning Tree
  rpart = list(name = "regr.rpart",
               params = list(
                 # Add Parameter Ranges below
                 minsplit = list(name = "minsplit", type = "Integer", lower = 1, upper = 100, values = NULL),
                 maxdepth = list(name = "maxdepth", type = "Integer", lower = 1, upper = 30, values = NULL),
                 cp = list(name = "cp", type = "Numeric", lower = 0, upper = 0.3, values = NULL)
               )
  ),
  
  
  # Conditional Inference Tree
  ctree = list(name = "regr.ctree",
               params = list(
                 # Add Parameter Ranges below
                 mincriterion = list(name = "mincriterion", type = "Numeric", lower = 0, upper = 1, values = NULL),
                 maxdepth = list(name = "maxdepth", type = "Integer", lower = 1, upper = 30, values = NULL),
                 minsplit = list(name = "minsplit", type = "Integer", lower = 1, upper = 100, values = NULL)
               )
  ),
  
  # Evolutionary Learning of Globally Optimal Trees
  evtree = list(name = "regr.evtree",
               params = list(
                 # Add Parameter Ranges below
                 alpha = list(name = "alpha", type = "Numeric", lower = 0, upper = 0.3, values = NULL),
                 maxdepth = list(name = "minbucket", type = "Integer", lower = 1, upper = 30, values = NULL),
                 minsplit = list(name = "minsplit", type = "Integer", lower = 1, upper = 100, values = NULL),
                 niterations = list(name = "niterations", type = "Integer", lower = 100, upper = 10000, values = NULL),
                 ntrees = list(name = "ntrees", type = "Integer", lower = 10, upper = 200, values = NULL)
               )
  ),

  # Random Forest
  randomForest = list(name = "regr.randomForest",
                params = list(
                  # Add Parameter Ranges below
                  alpha = list(name = "mtry", type = "Integer", lower = 2, upper = 188, values = NULL),
                  ntree = list(name = "ntree", type = "Integer", lower = 100, upper = 3000, values = NULL),
                  nodesize = list(name = "nodesize", type = "Integer", lower = 5, upper = 200, values = NULL)
                )
  ),

  # Stochastic Gradient Boosting
  gbm = list(name = "regr.gbm",
                      params = list(
                        # Add Parameter Ranges below
                        interaction.depth = list(name = "interaction.depth", type = "Integer", lower = 1, upper = 20, values = NULL),
                        n.trees = list(name = "n.trees", type = "Integer", lower = 100, upper = 500, values = NULL),
                        n.minobsinnode = list(name = "n.minobsinnode", type = "Integer", lower = 5, upper = 200, values = NULL),
                        shrinkage = list(name = "shrinkage", type = "Numeric", lower = 0, upper = 0.3, values = NULL)
                      )
  ),

  # Extreme gradient boosting
  xgboost = list(name = "regr.xgboost",
             params = list(
               # Add Parameter Ranges below
               nrounds = list(name = "nrounds", type = "Integer", lower = 1, upper = 80, values = NULL),
               max_depth = list(name = "max_depth", type = "Integer", lower = 2, upper = 15, values = NULL),
               eta = list(name = "eta", type = "Numeric", lower = 0.1, upper = 0.4, values = NULL)
             )
  )
)
