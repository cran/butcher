% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/kproto.R
\name{axe-kproto}
\alias{axe-kproto}
\alias{axe_data.kproto}
\alias{axe_fitted.kproto}
\title{Axing a kproto.}
\usage{
\method{axe_data}{kproto}(x, verbose = FALSE, ...)

\method{axe_fitted}{kproto}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed kproto object.
}
\description{
Axing a kproto.
}
\examples{
\dontshow{if (rlang::is_installed("clustMixType")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library(clustMixType)

kproto_fit <- kproto(
  ToothGrowth,
  k = 2,
  lambda = lambdaest(ToothGrowth),
  verbose = FALSE
)

out <- butcher(kproto_fit, verbose = TRUE)
\dontshow{\}) # examplesIf}
}
