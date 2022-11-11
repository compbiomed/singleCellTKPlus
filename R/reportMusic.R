
# Report render functions for music


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



  
  
  
