#' @export
#' @description prints music desc
#' @name description_runMusic
#' @title prints description of music wrapper parameters 


description_runMusic <- function() {
  return(list(
    introduction = "Single cell deconvolution using MuSiC",
    bulkData = "Bulk RNAseq data",
    analysisName = "Name for the deconvolution analysis, this will be used to store and access results and plots",
    analysisType = "Steps of music deconvolution `c(EstCellProp,PreGroupedClustProp,SingleCellClust)`", 
    markers = "deafult is NULL vector or list of gene names, default as NULL. If NULL, use all genes that provided by both bulk and single cell dataset", 
    clusters = "default is cellType character, the colData of single cell dataset used as clusters", 
    samples = "default is sampleID character,the colData of single cell dataset used as samples", 
    preClusterlist = "pre grouped cluster list" ,
    DEmarkers = "list of group marker",
    groups = "groups passes the column name of higher-cluster in phenoData", 
    selectCt = "vector of cell types, default as NULL. If NULL, then use all cell types provided by single cell dataset", #same as select.ct
    cellSize = "data.frame of cell sizes. 1st column contains the names of cell types, 2nd column has the cell sizes per cell type. Default as NULL. If NULL, then estimate cell size from data", #same as cell_size 
    ctCov = "logical. If TRUE, use the covariance across cell types", #same as ctCov
    verbose = "logical, default as TRUE",
    iterMax = "numeric, maximum iteration number, default 1000", #same as iter.max 
    nu = "regulation parameter, take care of weight when taking reciprocal, default 1e-04",
    eps = "Threshold of convergence, default 0.01",
    centered = "logic, subtract avg of Y and D",
    normalize = "logical, divide Y and D by their standard deviation, default FALSE",
    nonZero = "logical, default as TRUE. If true, remove all gene with zero expression"
  ))
}
