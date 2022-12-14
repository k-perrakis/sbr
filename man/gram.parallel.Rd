% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gram.parallel.R
\name{gram.parallel}
\alias{gram.parallel}
\title{Function gram.parallel}
\usage{
gram.parallel(X, cl, ...)
}
\arguments{
\item{X}{a standardized feature matrix.}

\item{cl}{the number of cores to use. Must be provided by the user.}

\item{...}{additional arguments passed from function \code{\link{gram}}. One can additionanly use block matrix multiplication within each core. Warning: in this case argument block.size must not exceed floor(ncol(X)/number of cores) - 1.}
}
\value{
Returns the inner-product Gram matrix.
}
\description{
Function for calculating the (inner-product) Gram matrix that allows for block-matrix multiplication performed in parallel.
}
\examples{
X <- matrix(rnorm(100 * 300), 100, 300)
G0 <- gram(X)                        # usual matrix multiplication
cores <- detectCores() - 1
cores <- makeCluster(cores)
registerDoParallel(cores)
G1 <- gram.parallel(X, cl = cores)   # parallel matrix multiplication
stopCluster(cores)
all.equal(G0, G1)
}
\references{
Perrakis, K., Mukherjee, S. and the Alzheimers Disease Neuroimaging Initiative. (2018) Scalable Bayesian regression in high dimensions with multiple data sources. \url{https://arxiv.org/pdf/1710.00596.pdf}
}
\seealso{
\code{\link{gram}}
}
\author{
Konstanstinos Perrakis \email{konstantinos.perrakis@dzne.de}

Sach Mukherjee \email{sach.mukherjee@dzne.de}
}
