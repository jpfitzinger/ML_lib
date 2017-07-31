# ------------------------------------------------------------------------------------------
# ML_Lib
# METHOD LIBRARY
# ------------------------------------------------------------------------------------------

method_lib <- list(
  
  # Decision Tree
  rpart = list(name = "regr.rpart",
               params = list(
                 # Add Parameter Ranges below
                 minsplit = list(name = "minsplit", type = "Integer", lower = 10, upper = 11, values = NULL),
                 minbucket = list(name = "minbucket", type = "Integer", lower = 10, upper = 15, values = NULL)
               )
  ),
  
  # Conditional Tree
  ctree = list(name = "regr.ctree",
               params = list(
                 # Add Parameter Ranges below
                 minsplit = list(name = "minsplit", type = "Integer", lower = 1, upper = 5, values = NULL),
                 minbucket = list(name = "minbucket", type = "Integer", lower = 10, upper = 50, values = NULL),
                 mtry = list(name = "mtry", type = "Integer", lower = 0, upper = 10, values = NULL)
               )
  )
)
