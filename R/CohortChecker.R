# @file CohortChecker.R
#
# Copyright 2025 Observational Health Data Sciences and Informatics
#
# This file is part of CirceR
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#' Check cohort
#' 
#' @description 
#' Checks a cohort expression for warnings
#'
#' @param expression  result of cohortExpressionFromJson containing the cohort expression
#'
#' @return 
#' A jObj
#' 
#' @export
checkCohort <- function(expression) {
  
  cohortChecker <- rJava::new(Class = rJava::J("org.ohdsi.circe.check.Checker"))
  jList <- cohortChecker$check(expression)
  
  rList <- lapply(jList, function(item) {
    item$toMessage()
  })
  
  return(rList)
}
