context("Check Cohorts")
library(CirceR)

test_that("cohort checking is performed", {
  cohortJson <- paste(readLines("resources/simpleCohort.json"),collapse="\n")
  cohortExpressionObj <- cohortExpressionFromJson(cohortJson)
  warnings <- checkCohort(cohortExpressionObj)
  
  expect_true(length(warnings) == 2)
})

