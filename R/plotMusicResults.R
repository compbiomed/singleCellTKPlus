#' plotMusicResults function
#'
#' @title Plotting function of runMusic.R
#' @description A wrapper that plots heatmap and cluster plots for results from runMusic.R
#' @param inSCE A \link[SingleCellExperiment]{SingleCellExperiment} object.
#' @param analysisType Character. Specify which function to run 
#'  Available options are  "EstCellProp","PreGroupedClustProp","SingleCellClust"
#' @param heatmapTitle Character. Title for heatmap; Default is NULL
#' @param analysisName Character. User-defined analysis name.
#' This will be used as the slot name and results can be stored and retrived from SCE object using this name
#' @param colDataName The column name(s) in \code{colData} that need
#' to be added to the annotation. See plotSCEHeatmap from SingleCellTK for more info
#' @param rowDataName The column name(s) in \code{rowData} that need
#' to be added to the annotation
#' @param useAssay Choose the assay to be plotted with the heatmap. 
#' @param scale scale input assay if set to TRUE. Default is FALSE
#' @return SingleCellExperiment object containing the outputs of the
#'  specified algorithms in the \link{colData}
#' of \code{inSCE}.
#' 
#' @export


plotMusicResults<- function(inSCE, 
                            analysisType = c("EstCellProp","PreGroupedClustProp","SingleCellClust"),
                            heatmapTitle = NULL,
                            analysisName = NULL,
                            useAssay = NULL,
                            colDataName = NULL,
                            rowDataName = NULL,
                            scale = FALSE){
  
  
  # Plot clusters
  
  .musicPlotclusters<- function(inSCE,analysisName){
    basisObject = metadata(inSCE)[["sctk"]][["music"]][[analysisName]][["Disgn.mtx"]]
    calc_dmat_dist = dist(t(log(basisObject + 1e-6)), method = "euclidean")
    hc1<- hclust(calc_dmat_dist, method = "complete")
    basisObject2 =  metadata(inSCE)[["sctk"]][["music"]][[analysisName]][["M.theta"]]
    calc_RA_dist = dist(t(log(basisObject2 + 1e-8)), method = "euclidean")
    hc2<- hclust(calc_RA_dist,method = "complete")
    p1<-plot(hc1,cex =0.6,hang = -1, main = 'Cluster log(Design Matrix)')
    p2<-plot(hc2,cex =0.6,hang = -1, main = 'Cluster log(Mean of RA)')
    return(list(hc1,hc2))
    
  }
  
  
  # plot heatmap  # use the ones from lab inSCEheatmap? (uses complexheatmap)
  
  .plotHeatmap<- function(inSCE, # 
                          analysisName,
                          heatmapTitle = heatmapTitle, 
                          useAssay = useAssay,
                          colDataName = colDataName,
                          rowDataName = rowDataName,
                          scale = scale){
    
    
    
    col_fun<-colorRamp2(c(0,0.2,0.4,0.6,0.8,1), hcl_palette = "RdBu")
    testBulk<-metadata(inSCE)[["sctk"]][["music"]][[analysisName]][[useAssay]]
    bulkinSCE<-SingleCellExperiment(assays = list(EstProps = testBulk))
    names(assays(bulkinSCE))<-useAssay
    heatmap<-singleCellTK::plotSCEHeatmap(bulkinSCE,  # Check version
                                          useAssay = useAssay, 
                                          rowLabel = T, 
                                          colLabel = T, 
                                          rowTitle = "Subjects",
                                          colTitle = "CellType",
                                          rowLabelSize = 10, 
                                          colLabelSize = 10,
                                          colorScheme = col_fun,
                                          colDataName = colDataName,
                                          rowDataName = rowDataName,
                                          trim = c(0,1),
                                          title = heatmapTitle,
                                          scale = scale)
    return(heatmap)
  }
  
  # sce -> extract bulk -> new_sce -> plotsce
  
  
  
  if(analysisType == "SingleCellClust"){
    plots<-.musicPlotclusters(inSCE,analysisName = analysisName)
    #  metadata(inSCE)$sctk$music[[analysisName]][["Clusters"]]<- temp_results 
  }
  else if(analysisType == "EstCellProp"){
    
    plots<-.plotHeatmap(inSCE,heatmapTitle = heatmapTitle,useAssay = "Est.prop.weighted" ,analysisName = analysisName, colDataName = colDataName, rowDataName = rowDataName,scale = scale )
    # Do if else for pulling the assay data and have one single call for the sce heatmap
    
    #metadata(inSCE)$sctk$music[[analysisName]][["Heatmap"]]<- temp_results 
    
  }
  
  else if(analysisType == "PreGroupedClustProp"){
    
    plots<- .plotHeatmap(inSCE,heatmapTitle = heatmapTitle,useAssay = "Est.prop.weighted.cluster",analysisName = analysisName, colDataName = colDataName, rowDataName = rowDataName,scale = scale  )
    #metadata(inSCE)$sctk$music[[analysisName]][["Heatmap"]]<- temp_results 
    
  }
  
  
  return(plots)
} 

