# ------------------------------------------------------------------------------------------
# ML_Lib
# METHOD LIBRARY
# ------------------------------------------------------------------------------------------

      method_lib <- list(
        decision_tree_r = list(name = "regr.rpart",
                               params = list(
                                 minsplit = list(name = "minsplit", type = "Integer", lower = 10, upper = 50, values = NULL),
                                 minbucket = list(name = "minbucket", type = "Integer", lower = 10, upper = 50, values = NULL)
                               )
      )
      )
      