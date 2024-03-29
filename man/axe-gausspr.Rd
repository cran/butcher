% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gausspr.R
\name{axe-gausspr}
\alias{axe-gausspr}
\alias{axe_call.gausspr}
\alias{axe_data.gausspr}
\alias{axe_env.gausspr}
\alias{axe_fitted.gausspr}
\title{Axing a gausspr.}
\usage{
\method{axe_call}{gausspr}(x, verbose = FALSE, ...)

\method{axe_data}{gausspr}(x, verbose = FALSE, ...)

\method{axe_env}{gausspr}(x, verbose = FALSE, ...)

\method{axe_fitted}{gausspr}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed gausspr object.
}
\description{
gausspr objects are created from \pkg{kernlab} package, which
provides a means to do classification, regression, clustering,
novelty detection, quantile regression and dimensionality
reduction. Since fitted model objects from \pkg{kernlab} are S4,
the \code{butcher_gausspr} class is not appended.
}
\examples{
\dontshow{if (rlang::is_installed("kernlab")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
library(kernlab)

test <- gausspr(Species ~ ., data = iris, var = 2)

out <- butcher(test, verbose = TRUE)

# Example with simulated regression data
x <- seq(-20, 20, 0.1)
y <- sin(x)/x + rnorm(401, sd = 0.03)
test2 <- gausspr(x, y)
out <- butcher(test2, verbose = TRUE)
\dontshow{\}) # examplesIf}
}
