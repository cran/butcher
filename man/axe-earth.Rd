% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/earth.R
\name{axe-earth}
\alias{axe-earth}
\alias{axe_call.earth}
\alias{axe_data.earth}
\alias{axe_fitted.earth}
\title{Axing an earth object.}
\usage{
\method{axe_call}{earth}(x, verbose = FALSE, ...)

\method{axe_data}{earth}(x, verbose = FALSE, ...)

\method{axe_fitted}{earth}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed earth object.
}
\description{
earth objects are created from the \pkg{earth} package, which
is leveraged to do multivariate adaptive regression splines.
}
\examples{
\dontshow{if (rlang::is_installed("parsnip")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Load libraries
library(parsnip)

# Create model and fit
earth_fit <- mars(mode = "regression") \%>\%
  set_engine("earth") \%>\%
  fit(Volume ~ ., data = trees)

out <- butcher(earth_fit, verbose = TRUE)

# Another earth model object
suppressWarnings(suppressMessages(library(earth)))
earth_mod <- earth(Volume ~ ., data = trees)
out <- butcher(earth_mod, verbose = TRUE)
\dontshow{\}) # examplesIf}
}
