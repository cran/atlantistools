% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/convert-relative-initial.R
\name{convert_relative_initial}
\alias{convert_relative_initial}
\title{Calculate relative timeseries using the initial value as benchmark.}
\usage{
convert_relative_initial(data, col = "atoutput")
}
\arguments{
\item{data}{Dataframe to apply the transformation to.}

\item{col}{Character value giving the name of the column to transform.
Default is \code{"atoutput"}.}
}
\value{
Dataframe with transformed column 'col'.
}
\description{
Calculate relative timeseries using the initial value as benchmark.
}
\examples{
df <- convert_relative_initial(ref_structn)
head(df[df$layer == 1, ], n = 15)
}
