## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = requireNamespace("parsnip", quietly = TRUE)
)

## ----setup--------------------------------------------------------------------
library(butcher)
library(parsnip)

## ---- warning = F, message = F, eval = F--------------------------------------
#  library(rpart)
#  
#  fitted_model <- boost_tree(trees = 15) %>%
#    set_engine("C5.0") %>%
#    fit(as.factor(am) ~ disp + hp, data = mtcars)

## ---- warning = F, message = F, eval = F--------------------------------------
#  library(sparklyr)
#  
#  sc <- spark_connect(master = "local")
#  
#  mtcars_tbls <- sdf_copy_to(sc, mtcars[, c("am", "disp", "hp")])
#  
#  fitted_model <- boost_tree(trees = 15) %>%
#    set_engine("spark") %>%
#    fit(am ~ disp + hp, data = mtcars_tbls)

## ---- warning = F, message = F------------------------------------------------
parsnip_lm <- linear_reg() %>% 
  set_engine("lm") %>% 
  fit(mpg ~ ., data = mtcars) 
parsnip_lm

## ---- warning = F, message = F------------------------------------------------
old_lm <- lm(mpg ~ ., data = mtcars) 
old_lm

## ---- warning = F, message = F------------------------------------------------
in_house_model <- function() {
  some_junk_in_the_environment <- runif(1e6) # we didn't know about
  lm(mpg ~ ., data = mtcars) 
}

## ---- warning = F, message = F------------------------------------------------
library(lobstr)
obj_size(in_house_model())

## ---- warning = F, message = F------------------------------------------------
obj_size(old_lm)

## ---- warning = F, message = F------------------------------------------------
big_lm <- in_house_model()
butcher::weigh(big_lm, threshold = 0, units = "MB")

## ---- warning = F, message = F------------------------------------------------
library(rlang)
env_print(big_lm$terms)

## ---- warning = F, message = F------------------------------------------------
cleaned_lm <- butcher::axe_env(big_lm, verbose = TRUE)

## ---- warning = F, message = F------------------------------------------------
butcher::weigh(cleaned_lm, threshold = 0, units = "MB")

## ---- warning = F, message = F------------------------------------------------
butcher::weigh(old_lm, threshold = 0, units = "MB")

## ---- warning = F, message = F------------------------------------------------
butchered_lm <- butcher::butcher(big_lm)
predict(butchered_lm, mtcars[, 2:11])

## ---- warning = F, message = F------------------------------------------------
butchered_lm <- big_lm %>%
  butcher::axe_env() %>% 
  butcher::axe_fitted()
predict(butchered_lm, mtcars[, 2:11])

