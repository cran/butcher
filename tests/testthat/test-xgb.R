# TODO: this particular model relies on a setup and teardown infrastructure
# since saving the model object from xgboost in R results in a handle
# (pointer) to an internal xgboost model that is invalid

test_that("xgb.Booster + linear solver + predict() works", {
  skip_on_cran()
  skip_if_not_installed("xgboost")
  suppressPackageStartupMessages(library(xgboost))
  # Load data
  data(agaricus.train)
  data(agaricus.test)
  bst <- xgboost(data = agaricus.train$data,
                 label = agaricus.train$label,
                 eta = 1,
                 nthread = 2,
                 nrounds = 2,
                 eval_metric = "logloss",
                 objective = "binary:logistic",
                 verbose = 0)
  x <- axe_call(bst)
  expect_equal(x$call, rlang::expr(dummy_call()))
  x <- axe_env(bst)
  expect_lt(lobstr::obj_size(x), lobstr::obj_size(bst))
  x <- butcher(bst)
  expect_equal(xgb.importance(model = x),
               xgb.importance(model = bst))
  expect_equal(predict(x, agaricus.test$data),
               predict(bst, agaricus.test$data))
  expect_equal(xgb.dump(x, with_stats = TRUE),
               xgb.dump(bst, with_stats = TRUE))
})

test_that("xgb.Booster + tree-learning algo + predict() works", {
  skip_on_cran()
  skip_if_not_installed("xgboost")
  suppressPackageStartupMessages(library(xgboost))
  # Load data
  data(agaricus.train)
  data(agaricus.test)
  dtrain <- xgb.DMatrix(data = agaricus.train$data,
                        label = agaricus.train$label)
  bst <- xgb.train(data = dtrain,
                   booster = "gblinear",
                   nthread = 2,
                   nrounds = 2,
                   eval_metric = "logloss",
                   objective = "binary:logistic",
                   print_every_n = 10000L)
  x <- axe_call(bst)
  expect_equal(x$call, rlang::expr(dummy_call()))
  x <- axe_env(bst)
  expect_lt(lobstr::obj_size(x), lobstr::obj_size(bst))
  x <- butcher(bst)
  expect_equal(xgb.importance(model = x),
               xgb.importance(model = bst))
  expect_equal(predict(x, agaricus.test$data),
               predict(bst, agaricus.test$data))
  expect_equal(xgb.dump(x, with_stats = TRUE),
               xgb.dump(bst, with_stats = TRUE))
})
