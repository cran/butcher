% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flexsurvreg.R
\name{axe-flexsurvreg}
\alias{axe-flexsurvreg}
\alias{axe_call.flexsurvreg}
\alias{axe_env.flexsurvreg}
\title{Axing an flexsurvreg.}
\usage{
\method{axe_call}{flexsurvreg}(x, verbose = FALSE, ...)

\method{axe_env}{flexsurvreg}(x, verbose = FALSE, ...)
}
\arguments{
\item{x}{A model object.}

\item{verbose}{Print information each time an axe method is executed.
Notes how much memory is released and what functions are
disabled. Default is \code{FALSE}.}

\item{...}{Any additional arguments related to axing.}
}
\value{
Axed flexsurvreg object.
}
\description{
flexsurvreg objects are created from the \pkg{flexsurv} package. They
differ from survreg in that the fitted models are not limited to certain
parametric distributions. Users can define their own distribution, or
leverage distributions like the generalized gamma, generalized F, and
the Royston-Parmar spline model.
}
\examples{
\dontshow{if (rlang::is_installed("flexsurv")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# Load libraries
library(parsnip)
library(flexsurv)

# Create model and fit
flexsurvreg_fit <- surv_reg(mode = "regression", dist = "gengamma") \%>\%
  set_engine("flexsurv") \%>\%
  fit(Surv(Tstart, Tstop, status) ~ trans, data = bosms3)

out <- butcher(flexsurvreg_fit, verbose = TRUE)

# Another flexsurvreg model object
wrapped_flexsurvreg <- function() {
  some_junk_in_environment <- runif(1e6)
  fit <- flexsurvreg(Surv(futime, fustat) ~ 1,
                     data = ovarian, dist = "weibull")
  return(fit)
}

out <- butcher(wrapped_flexsurvreg(), verbose = TRUE)
\dontshow{\}) # examplesIf}
}
