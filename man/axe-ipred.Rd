% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ipred.R
\name{axe-ipred}
\alias{axe-ipred}
\alias{axe-regbagg}
\alias{axe-classbagg}
\alias{axe-survbagg}
\alias{axe_call.regbagg}
\alias{axe_call.classbagg}
\alias{axe_call.survbagg}
\alias{axe_ctrl.regbagg}
\alias{axe_ctrl.classbagg}
\alias{axe_ctrl.survbagg}
\alias{axe_data.regbagg}
\alias{axe_data.classbagg}
\alias{axe_data.survbagg}
\alias{axe_env.regbagg}
\alias{axe_env.classbagg}
\alias{axe_env.survbagg}
\title{Axing a bagged tree.}
\usage{
\method{axe_call}{regbagg}(x, verbose = FALSE, ...)

\method{axe_call}{classbagg}(x, verbose = FALSE, ...)

\method{axe_call}{survbagg}(x, verbose = FALSE, ...)

\method{axe_ctrl}{regbagg}(x, verbose = FALSE, ...)

\method{axe_ctrl}{classbagg}(x, verbose = FALSE, ...)

\method{axe_ctrl}{survbagg}(x, verbose = FALSE, ...)

\method{axe_data}{regbagg}(x, verbose = FALSE, ...)

\method{axe_data}{classbagg}(x, verbose = FALSE, ...)

\method{axe_data}{survbagg}(x, verbose = FALSE, ...)

\method{axe_env}{regbagg}(x, verbose = FALSE, ...)

\method{axe_env}{classbagg}(x, verbose = FALSE, ...)

\method{axe_env}{survbagg}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed \verb{*_bagg} object.
}
\description{
\verb{*_bagg} objects are created from the \pkg{ipred} package, which
is used for bagging classification, regression and survival trees.
}
\examples{
\dontshow{if (rlang::is_installed(c("ipred", "rpart"))) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library(ipred)

fit_mod <- function() {
  boop <- runif(1e6)
  bagging(y ~ x, data.frame(y = rnorm(1e4), x = rnorm(1e4)))
}

mod_fit <- fit_mod()
mod_res <- butcher(mod_fit)

weigh(mod_fit)
weigh(mod_res)
\dontshow{\}) # examplesIf}
}
