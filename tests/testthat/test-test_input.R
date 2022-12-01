#library("singleCellTKPlus")
context("testing example data")
data("musicBulkexample",package = "singleCellTKPlus")
data("musicSCEexample",package = "singleCellTKPlus")

inSCE = musicSCEexample
bulk = musicBulkexample

inSCE = runMusic(bulkData = bulk, 
                 inSCE = new_sce_with_music_basis,
                 analysisName = "testSingleCellClust",
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="SingleCellClust")

inSCE = runMusic(bulkData = bulk, 
                 inSCE = new_sce_with_music_basis,
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="EstCellProp", 
                 analysisName = "testEstCellProp")


test_that("Input SCE is correct", {
  expect_equal(class(inSCE) == "SingleCellExperiment")
})

test_that("Input bulk is correct", {
  expect_equal(class(bulk) %in% c("matrix","array"))
})



test_that(desc = "plotting test", {
  estplot <- plotMusicResults(inSCE, analysisType ="EstCellProp", analysisName = "testEstCellProp")
  expect_is(estplot, c("gg","ggplot"))
  
  singlecellplot<- plotMusicResults(inSCE, analysisType ="SingleCellClust", analysisName = "testSingleCellClust")
})
  






  
  