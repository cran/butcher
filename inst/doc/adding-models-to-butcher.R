## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(butcher)

## ----eval = FALSE-------------------------------------------------------------
#  > new_model_butcher(model_class = "blob", package_name = "blobber")

## ----eval = FALSE-------------------------------------------------------------
#  ✔ Setting active project to 'path_to_butcher_package'
#  ✔ Adding 'blobber' to Suggests field in DESCRIPTION
#  ● Use `requireNamespace("blobber", quietly = TRUE)` to test if package is installed
#  ● Then directly refer to functons like `blobber::fun()` (replacing `fun()`).
#  
#  ℹ Writing skeleton files
#  ✔ Writing 'R/blob.R'
#  ✔ Writing 'tests/testthat/test-blob.R'
#  ● Modify 'R/blob.R'
#  ● Modify 'tests/testthat/test-blob.R'

## ----eval = FALSE-------------------------------------------------------------
#  > weigh(fitted_blob_object)
#  # A tibble: 25 x 2
#     object            size
#     <chr>            <dbl>
#   1 terms         4.01
#   2 qr.qr         0.00666
#   3 residuals     0.00286
#   4 fitted.values 0.00286
#   5 effects       0.0014
#   6 coefficients  0.00109
#   7 call          0.000728
#   8 model.mpg     0.000304
#   9 model.cyl     0.000304
#  10 model.disp    0.000304
#  # … with 15 more rows

## ----eval = FALSE-------------------------------------------------------------
#  #' Axing a blob.
#  #'
#  #' blob model objects are created from the blobber package. They are
#  #' generally leveraged for classification ... insert anything relevant
#  #' ... This is where all the blob specific documentation lies.
#  #'
#  #' @param x Model object.
#  #' @param verbose Print information each time an axe method is executed
#  #'  that notes how much memory is released and what functions are
#  #'  disabled. Default is \code{TRUE}.
#  #' @param ... Any additional arguments related to axing.
#  #'
#  #' @return Axed model object.
#  #'
#  #' @name axe-blob
#  NULL
#  
#  #' Remove the call.
#  #'
#  #' @rdname axe-blob
#  #' @export
#  axe_call.blob <- function(x, verbose = TRUE, ...) {
#    old <- x
#    x <- exchange(x, "call", call("dummy_call"))
#    if (verbose) {
#      assess_object(
#        old,
#        x,
#        disabled = c("print", "summary")
#      )
#    }
#    add_butcher_class(x)
#  }

