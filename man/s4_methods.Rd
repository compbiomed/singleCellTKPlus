% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runMusic.R
\name{getMusicResults}
\alias{getMusicResults}
\alias{getMusicResults,SingleCellExperiment-method}
\alias{getMusicResults<-}
\alias{getMusicResults<-,SingleCellExperiment,character-method}
\title{Deconvolution of RNASeq data using single cell data}
\usage{
getMusicResults(x, y)

\S4method{getMusicResults}{SingleCellExperiment}(x, y)

getMusicResults(x, y) <- value

\S4method{getMusicResults}{SingleCellExperiment,character}(x, y) <- value
}
\arguments{
\item{inSCE}{A SingleCellExperiment object.}

\item{analysisType}{Character. Specify which function to run
Available options are  "EstCellProp","PreGroupedClustProp","SingleCellClust"}

\item{analysisName}{Character. User-defined analysis name.
This will be used as the slot name and results can be stored and retrived from SCE object using this name}

\item{markers}{List. list of gene names. Same as group.markers option from MuSiC package. The list include differential expressed genes within groups.
List name must be the same as \code{clusters}. Default is NULL}

\item{clusters}{character, the colData of single cell dataset used as clusters; Default is "cellType"}

\item{samples}{. Default is sampleID.
groups = NULL,}

\item{selectCt}{vector of cell types, default as NULL. If NULL, then use all cell types provided by single cell dataset; NULL, #same as select.ct}

\item{cellSize}{data.frame of cell sizes.same as cell_size; data.frame of cell sizes. 1st column contains the names of cell types, 2nd column has the cell sizes per cell type. Default as NULL. If NULL, then estimate cell size from data;}

\item{ctCov}{logical. If TRUE, use the covariance across cell types; #same as ctCov in MuSiC}

\item{preClusterlist}{list of cell types. The list identify groups of similar cell types.}

\item{verbose}{logical, default as TRUE.}

\item{iter.max}{numeric, maximum iteration number. Default 1000}

\item{nu}{regulation parameter, take care of weight when taking reciprocal 1e-04,}

\item{eps}{Threshold of convergence. Default 0.01,}

\item{centered}{logic, subtract avg of Y and D. Default FALSE}

\item{normalize}{logic, divide Y and D by their standard deviation. Default FALSE}
}
\value{
SingleCellExperiment object containing the outputs of the specified algorithms in the \link{colData} of \code{inSCE}.
}
\description{
A wrapper that performs deconvolution and clustering using MuSiC tool and
SingleCellExperiment object
}
\examples{
data(scExample, package = "singleCellTK")
Add bulk data here
\dontrun{
sce <- runMusic(sce,bulkdata, analysisType = "EstCellProp",analysisName = "test")
}

}
