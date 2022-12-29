#library("singleCellTKPlus")
context("testing example data")
data("musicBulkexample",package = "singleCellTKPlus")
data("musicSCEexample",package = "singleCellTKPlus")

inSCE <- musicSCEexample
bulk <- musicBulkexample

inSCE <- runMusic(bulkData = bulk, 
                 inSCE = inSCE,
                 analysisName = "testSingleCellClust",
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="SingleCellClust")

inSCE <- runMusic(bulkData = bulk, 
                 inSCE = inSCE,
                 clusters = 'cellType', groups = 'clusterType', 
                 samples = 'sampleID',  
                 analysisType ="EstCellProp", 
                 analysisName = "testEstCellProp")


test_that("Input SCE is correct", {
  expect_equal(class(inSCE)[1],"SingleCellExperiment")
})

test_that("Input bulk is correct", {
  expect_equal(class(bulk)[1],"matrix")
})

estplot <- plotMusicResults(inSCE, analysisType ="EstCellProp", analysisName = "testEstCellProp", heatmapTitle = "test")
singlecellplot<- plotMusicResults(inSCE, analysisType ="SingleCellClust", analysisName = "testSingleCellClust")

test_that(desc = "plotting test", {
  
  expect_equal(class(estplot)[1], "gg")
})
  






  
  