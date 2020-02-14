\name{NEWS}
\title{sisal News}

\section{Changes in version 0.48 (2020-02-14)}{

  \subsection{User-visible changes}{
    \itemize{

      \item In \code{sisalData()}, default value of \code{dataset} has
      been changed due to missing online datasets (invalid
      \acronym{URL}s).

    }
  }

  \subsection{Bug fixes}{
    \itemize{

      \item In internal function \code{validDetails.sisalTable()}, fixed
      two cases where \code{&&} was using arguments of length more than
      one. Thanks to Henrik Bengtsson for reporting the bug.

      \item In \code{sisal()}, text progress bar (if used) is closed
      after use.

    }
  }
  
}
