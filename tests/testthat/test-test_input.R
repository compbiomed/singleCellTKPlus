test_that("Input SCE is correct", {
  expect_equal(class(inSCE) == "SingleCellExperiment")
})

test_that("Input bulk is correct", {
  expect_equal(class(bulkData) %in% c("matrix","array"))
})


