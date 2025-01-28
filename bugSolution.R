```r
# This improved code uses `dplyr::select` to handle missing columns more gracefully.
# It throws an error if any specified columns are not found, preventing silent failures.
library(dplyr)
data <- data.frame(A = 1:3, B = 4:6, C = 7:9)
cols_to_select <- c("A", "B", "D")
result <- tryCatch({
  select(data, all_of(cols_to_select))
}, error = function(e) {
  message("Error: Some columns not found!")
  return(NULL)
})
print(result)
```