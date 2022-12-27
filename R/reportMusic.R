
# Report render functions for music

#' @title Deconvolution of RNASeq data using single cell data
#' @description A wrapper that performs deconvolution and clustering using MuSiC tool and 
#' SingleCellExperiment object
#' @param inSCE A SingleCellExperiment object.
#' @param analysisType Character. Specify which function to run 
#'  Available options are  "EstCellProp","PreGroupedClustProp","SingleCellClust"
#' @param analysisName Character. User-defined analysis name. 
#' This will be used as the slot name and results can be stored and retrived from SCE object using this name
#' @param markers List. list of gene names. Same as group.markers option from MuSiC package. The list include differential expressed genes within groups. 
#' List name must be the same as `clusters`. Default is NULL
#' @param clusters character, the colData of single cell dataset used as clusters; Default is "cellType"
#' @param samples . Default is sampleID.
#' groups = NULL, 
#' @param selectCt vector of cell types, default as NULL. If NULL, then use all cell types provided by single cell dataset; NULL, #same as select.ct
#' @param cellSize 	data.frame of cell sizes.same as cell_size; data.frame of cell sizes. 1st column contains the names of cell types, 2nd column has the cell sizes per cell type. Default as NULL. If NULL, then estimate cell size from data;
#' @param ctCov logical. If TRUE, use the covariance across cell types; #same as ctCov in MuSiC
#' @param preClusterlist 	list of cell types. The list identify groups of similar cell types.
#' @param verbose logical, default as TRUE.
#' @param iter.max 	numeric, maximum iteration number. Default 1000
#' @param nu  regulation parameter, take care of weight when taking reciprocal 1e-04,
#' @param eps Threshold of convergence. Default 0.01,
#' @param centered logic, subtract avg of Y and D. Default FALSE
#' @param normalize logic, divide Y and D by their standard deviation. Default FALSE
#' @return SingleCellExperiment object containing the outputs of the specified algorithms in the \link{colData} of \code{inSCE}.
#' @export
#' @examples
#' \dontrun{
#' data("musicSCEexample")
#' data("musicBulkexample")
#' music_sce <- reportMusic(inSCE = musicSCEexample, 
#' bulkData = musicBulkexample,
#' analysisName = "test1",
#' analysisType = "EstCellProp", 
#' markers = NULL, 
#' clusters = "cellType", 
#' samples = "sampleID", 
#' preClusterlist = NULL,
#' DEmarkers = NULL,
#' groups = NULL, 
#' selectCt = NULL, 
#' cellSize = NULL, #same as cell_size 
#' ctCov = FALSE, #same as ctCov
#' verbose = TRUE,
#' iterMax = 1000, #same as iter.max 
#' nu = 1e-04,
#' eps = 0.01,
#' centered = FALSE,
#' normalize = FALSE,
#' nonZero = TRUE)
#' output_file = ,
# ' output_dir = NULL)
#' }
#' \dontrun{
#' reportMusicResults(inSCE= music_sce,
#'                   analysisName = "test2",
#'                   analysisType = "EstCellProp", 
#'                   heatmapTitle = "test")


#' }
#'

#' @export

reportMusic <- function(inSCE = inSCE, 
                        bulkData = bulkData,
                        analysisName = "NULL",
                        analysisType = c("EstCellProp","PreGroupedClustProp","SingleCellClust"), 
                        markers = NULL, 
                        clusters = "cellType", 
                        samples = "sampleID", 
                        preClusterlist = NULL,
                        DEmarkers = NULL,
                        groups = NULL, 
                        selectCt = NULL, 
                        cellSize = NULL, #same as cell_size 
                        ctCov = FALSE, #same as ctCov
                        verbose = TRUE,
                        iterMax = 1000, #same as iter.max 
                        nu = 1e-04,
                        eps = 0.01,
                        centered = FALSE,
                        normalize = FALSE,
                        nonZero = TRUE,
                        output_file = NULL,
                        output_dir = NULL) {
  
  if (is.null(output_dir)){
    output_dir<- getwd()
  }
  
  rmarkdown::render(system.file("rmarkdown/reportMusicRun.Rmd",package = "singleCellTKPlus"),
                    params = list(inSCE = inSCE,
                                  bulkData = bulkData,
                                  analysisType = analysisType,
                                  analysisName = analysisName,
                                  markers = markers, 
                                  clusters = clusters,
                                  samples = samples,
                                  preClusterlist = preClusterlist,
                                  DEmarkers = DEmarkers,
                                  groups = groups,
                                  selectCt = selectCt, 
                                  cellSize = cellSize, 
                                  ctCov = ctCov,
                                  verbose = verbose,
                                  iterMax = iterMax, 
                                  nu = nu,
                                  eps = eps,
                                  centered = centered,
                                  normalize = normalize,
                                  nonZero = nonZero,
                                  output_file = output_file,
                                  output_dir = output_dir,
                                  intermediates_dir = output_dir,
                                  knit_root_dir = output_dir))
  
}



reportMusicResults<- function(inSCE,
                              analysisName,
                              analysisType, 
                              heatmapTitle,
                              output_file = NULL,
                              output_dir = NULL) {
  
  if (is.null(output_dir)){
    output_dir<- getwd()
  }
  
  
  
  rmarkdown::render(system.file("rmarkdown/reportMusicResults.Rmd",package = "singleCellTKPlus"),
                    params = list(inSCE = inSCE,
                                  analysisName = analysisName,
                                  analysisType = analysisType,
                                  heatmapTitle = heatmapTitle))
  
  
  
}


reportMusicAll<-function(inSCE = inSCE, 
                         bulkData = bulkData,
                         analysisName = "NULL",
                         analysisType = c("EstCellProp","PreGroupedClustProp","SingleCellClust"), 
                         markers = NULL, 
                         clusters = "cellType", 
                         samples = "sampleID", 
                         preClusterlist = NULL,
                         DEmarkers = NULL,
                         groups = NULL, 
                         selectCt = NULL, 
                         cellSize = NULL, #same as cell_size 
                         ctCov = FALSE, #same as ctCov
                         verbose = TRUE,
                         iterMax = 1000, #same as iter.max 
                         nu = 1e-04,
                         eps = 0.01,
                         centered = FALSE,
                         normalize = FALSE,
                         nonZero = TRUE,
                         output_file = NULL,
                         output_dir = NULL,
                         heatmapTitle = NULL) {
  
  if (is.null(output_dir)){
    output_dir<- getwd()
  }
  
  rmarkdown::render(system.file("rmarkdown/reportMusicAll.Rmd",package = "singleCellTKPlus"),
                    params = list(inSCE = inSCE,
                                  bulkData = bulkData,
                                  analysisType = analysisType,
                                  analysisName = analysisName,
                                  markers = markers, 
                                  clusters = clusters,
                                  samples = samples,
                                  preClusterlist = preClusterlist,
                                  DEmarkers = DEmarkers,
                                  groups = groups,
                                  selectCt = selectCt, 
                                  cellSize = cellSize, 
                                  ctCov = ctCov,
                                  verbose = verbose,
                                  iterMax = iterMax, 
                                  nu = nu,
                                  eps = eps,
                                  centered = centered,
                                  normalize = normalize,
                                  nonZero = nonZero,
                                  heatmapTitle = heatmapTitle,
                                  output_file = output_file,
                                  output_dir = output_dir,
                                  intermediates_dir = output_dir,
                                  knit_root_dir = output_dir))
  
}



  
  
  
