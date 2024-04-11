## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  eval = requireNamespace("dplyr", quietly = TRUE) & 
         requireNamespace("clisymbols", quietly = TRUE)
)

## ----setup, echo = FALSE, warnings = FALSE, message = FALSE-------------------
suppressWarnings(library(butcher))
suppressWarnings(library(dplyr))
suppressWarnings(library(clisymbols))

method_df <- function(method_name) {
  m <- as.vector(utils::methods(method_name))
  tibble::tibble(class = gsub(paste0(method_name, "[.]"), "", m),
                 !!method_name := clisymbols::symbol$tick)
}

replace_na <- function(x) {
  x[is.na(x)] <- " "
  x
}

out <- method_df("axe_call") %>% 
  full_join(method_df("axe_ctrl")) %>% 
  full_join(method_df("axe_data")) %>% 
  full_join(method_df("axe_env")) %>% 
  full_join(method_df("axe_fitted")) %>%
  replace_na() %>%
  knitr::kable()
out

