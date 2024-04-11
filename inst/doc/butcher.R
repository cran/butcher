## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = requireNamespace("parsnip", quietly = TRUE)
)

## ----setup--------------------------------------------------------------------
library(butcher)
library(parsnip)

## ----eval = FALSE-------------------------------------------------------------
#  fitted_model <- boost_tree(mode = "regression") %>%
#    fit(mpg ~ ., data = mtcars)

## -----------------------------------------------------------------------------
parsnip_lm <- linear_reg() %>% 
  fit(mpg ~ ., data = mtcars) 
parsnip_lm

## -----------------------------------------------------------------------------
old_lm <- lm(mpg ~ ., data = mtcars) 
old_lm

## -----------------------------------------------------------------------------
in_house_model <- function() {
  some_junk_in_the_environment <- runif(1e6) # we didn't know about
  lm(mpg ~ ., data = mtcars) 
}

## -----------------------------------------------------------------------------
library(lobstr)
obj_size(in_house_model())

## -----------------------------------------------------------------------------
obj_size(old_lm)

## -----------------------------------------------------------------------------
big_lm <- in_house_model()
weigh(big_lm, threshold = 0, units = "MB")

## -----------------------------------------------------------------------------
library(rlang)
env_print(big_lm$terms)

## -----------------------------------------------------------------------------
cleaned_lm <- axe_env(big_lm, verbose = TRUE)

## -----------------------------------------------------------------------------
weigh(cleaned_lm, threshold = 0, units = "MB")

## -----------------------------------------------------------------------------
weigh(old_lm, threshold = 0, units = "MB")

## -----------------------------------------------------------------------------
butchered_lm <- butcher(big_lm)
predict(butchered_lm, mtcars[, 2:11])

## -----------------------------------------------------------------------------
butchered_lm <- big_lm %>%
  axe_env() %>% 
  axe_fitted()
predict(butchered_lm, mtcars[, 2:11])

