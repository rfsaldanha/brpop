.zenodo_data <- function(file_name) {
  tryCatch(
    {
      path <- zendown::zen_file(
        deposit_id = zenodo_deposit,
        file_name = file_name,
        quiet = TRUE
      )
      readRDS(file = path)
    },
    error = function(cond) {
      message(zendown_error_message)
      message(conditionMessage(cond))
      NULL
    }
  )
}
