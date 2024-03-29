test_that("rda + predict() works", {
  skip_on_cran()
  skip_if_not_installed("klaR")
  suppressPackageStartupMessages(library(klaR))
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- rda(cyl ~ ., data = mtcars)
  x <- axe_call(fit)
  expect_equal(x$call, rlang::expr(dummy_call()))
  x <- axe_env(fit)
  expect_identical(attr(x$terms, ".Environment"), rlang::base_env())
  x <- butcher(fit)
  expect_equal(predict(x, mtcars[1:3, ]),
               predict(fit, mtcars[1:3, ]))
})

test_that("NaiveBayes + predict() works", {
  skip_on_cran()
  skip_if_not_installed("klaR")
  suppressPackageStartupMessages(library(klaR))
  mtcars$cyl <- as.factor(mtcars$cyl)
  fit <- NaiveBayes(cyl ~ ., data = mtcars[,1:6])
  x <- axe_call(fit)
  expect_equal(x$call, rlang::expr(dummy_call()))
  x <- axe_data(fit)
  expect_identical(x$x, data.frame())
  x <- butcher(fit)
  expect_equal(predict(x, mtcars[1:3, 1:6]),
               predict(fit, mtcars[1:3, 1:6]))
})
