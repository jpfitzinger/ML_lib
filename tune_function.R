# ------------------------------------------------------------------------------------------
# ML_Lib
# MODEL TUNING
# ------------------------------------------------------------------------------------------

      tune <- function(dta, response, method, scale = FALSE, featureSelect = NULL, parallel = TRUE, cores = 4) {
        
        # STEP 1: LOAD DATA AND DEPENDENCIES ----
        
        library(mlr)
        library(mlrMBO)
        library(caret)
        library(parallelMap)
        library(dplyr)
        
        configureMlr(on.learner.warning = "quiet", show.learner.output = FALSE)
        
        source("method_lib.R")
        
        sample <- createDataPartition(y=dta[,response],p=0.75,list=F)
        dta.train <- dta[sample,]
        dta.test <- dta[-sample,]
        
        # STEP 2: SET UP TASKS ----
        
        train.task <- makeRegrTask(data = dta.train, target = response) 
        if (scale == T) train.task <- normalizeFeatures(train.task, method = "standardize")
        test.task <- makeRegrTask(data = dta.test, target = response) 
        if (scale == T) test.task <- normalizeFeatures(test.task, method = "standardize")
        full.task <- makeRegrTask(data = rbind(dta.test,dta.train), target = response)
        if (scale == T) full.task <- normalizeFeatures(full.task, method = "standardize")
        
        if (!is.null(featureSelect)) {
          train.task <- filterFeatures(train.task, method = featureSelect[1], abs = featureSelect[2])
        }
        
        # STEP 3: SET UP LEARNER ----
        
        learn <- makeLearner(method_lib[[method]]$name, predict.type = "response")
        params <- lapply(method_lib[[method]]$params, 
                         function(x) paste("make",x$type,"Param('",x$name,"',lower=",x$lower,",upper=",x$upper,")",sep=""))
        grid <- parse(text = paste("makeParamSet(", paste(as.vector(unlist(params)), collapse = ","), ")", sep = "")) %>% eval
        
        # STEP 4: TUNE THE MODEL ----
        
        ctrl <- makeMBOControl()
        ctrl <- setMBOControlTermination(ctrl, iters = 20)
        surrogate.lrn <- makeLearner("regr.km", predict.type = "se")
        tune.ctrl <- makeTuneControlMBO(learner = surrogate.lrn, mbo.control = ctrl)
        
        if (parallel == T) parallelStartMulticore(cpus = cores)
        result <- tuneParams(learner = learn, resampling = cv10, task = train.task, par.set = grid, control = tune.ctrl, show.info = FALSE)
        if (parallel == T) parallelStop()
        
        # STEP 5: OUTPUT ----
        
        learn <- setHyperPars(learn, par.vals = result$x)
        final_model <- mlr::train(learn, train.task)
        
        prediction <- predict(final_model, full.task)
        train.RMSE <- measureRMSE(prediction$data$truth[-c(1:nrow(dta.test))], prediction$data$response[-c(1:nrow(dta.test))])
        test.RMSE <- measureRMSE(prediction$data$truth[c(1:nrow(dta.test))], prediction$data$response[c(1:nrow(dta.test))])
        
        output <- list(model = final_model, best_tune = result$x, train.RMSE = train.RMSE, test.RMSE = test.RMSE)
        
        return(output)
        
      }
      