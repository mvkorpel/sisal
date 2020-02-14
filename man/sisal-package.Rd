% File man/sisal-package.Rd
% This file is part of the sisal package for R.
% Copyright (C) 2015 Aalto University
% Distributed under GPL 2 or later

\encoding{UTF-8}
\name{sisal-package}
\alias{sisal-package}
\docType{package}

\title{ sisal: Sequential input selection algorithm }

\description{

  Implements the \acronym{SISAL} algorithm by Tikka and
  \enc{Hollmén}{Hollmen}.  It is a sequential backward selection
  algorithm which uses a linear model in a cross-validation setting.
  Starting from the full model, one variable at a time is removed based
  on the regression coefficients.  From this set of models, a
  parsimonious (sparse) model is found by choosing the model with the
  smallest number of variables among those models where the validation
  error is smaller than a threshold.  Also implements extensions which
  explore larger parts of the search space and/or use ridge regression
  instead of ordinary least squares.

}

\details{
\tabular{rl}{Package: \tab sisal\cr
Depends: \tab R (>= 3.1.2)\cr
Imports: \tab graphics, grDevices, grid, methods, stats, utils,\cr
         \tab boot, lattice, mgcv, digest, R.matlab, R.methodsS3\cr
Suggests: \tab graph, Rgraphviz, testthat (>= 0.8)\cr
License: \tab GPL (>= 2)\cr
LazyData: \tab yes\cr
}

Index:\preformatted{
bootMSE                 Bootstrap Estimate of Mean Squared Error Using
                        SISAL Object
dynTextGrob             Create Text with Changing Size
laggedData              Create Input Matrix and Output Vector for Time
                        Series Prediction
plot.sisal              Plotting Sequential Input Selection Results
plotSelected.sisal      Plotting Sets of Inputs Produced by Sequential
                        Input Selection
print.sisal             Printing Sequential Input Selection Objects
sisal                   Sequential Input Selection Algorithm (SISAL)
sisal-package           sisal: Sequential input selection algorithm in
                        R
sisalData               Download External Datasets for SISAL
sisalTable              Draw Table with Equally Sized Cells
summary.sisal           Summarizing Sequential Input Selection Results
testSisal               Testing the Sequential Input Selection
                        Algorithm
toy.learn               Toy Data for SISAL (Learning Set)
toy.test                Toy Data for SISAL (Test Set)
tsToy.learn             Toy Time Series Data for SISAL (Learning Set)
tsToy.test              Toy Time Series Data for SISAL (Test Set)
}

Run input selection on your own data with \code{\link{sisal}}.  For demo
purposes, use \code{\link{testSisal}} to run the algorithm on example
data sets.  After input selection, compute bootstrap MSE in test data
with \code{\link{bootMSE}}.
}

\author{
Mikko Korpela \email{mvkorpel@iki.fi}
}

\references{
  Tikka, J. and \enc{Hollmén}{Hollmen}, J. (2008) Sequential input
  selection algorithm for long-term prediction of time series.
  \emph{Neurocomputing}, 71(13\enc{–}{--}15):2604\enc{–}{--}2615.
}

\keyword{ package }
