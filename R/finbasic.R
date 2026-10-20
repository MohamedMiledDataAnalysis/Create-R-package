# The package functions: the equivalent of src/finbasic/core.py in Python.
# The #' comments are roxygen2 documentation: devtools::document() turns them
# into the help pages (man/*.Rd) and the export list (NAMESPACE).

#' Monthly payment of a fixed-rate loan
#'
#' @param principal Amount borrowed.
#' @param rate Annual interest rate as a decimal (0.045 for 4.5%).
#' @param years Term of the loan in years.
#' @return The fixed monthly payment.
#' @examples
#' loan_payment(200000, 0.045, 25)
#' @export
loan_payment <- function(principal, rate, years) {
  if (principal <= 0 || years <= 0 || rate < 0) {
    stop("principal and years must be positive, rate must be 0 or more")
  }
  n <- years * 12
  r <- rate / 12
  if (r == 0) {
    return(principal / n)
  }
  principal * r / (1 - (1 + r)^-n)
}

#' Net present value of cash flows
#'
#' @param rate Discount rate per period (0.10 for 10%).
#' @param cash_flows Numeric vector, one value per period, starting at period 0.
#' @return The value today of all the cash flows.
#' @examples
#' npv(0.10, c(-1000, 300, 400, 500))
#' @export
npv <- function(rate, cash_flows) {
  t <- seq_along(cash_flows) - 1   # periods 0, 1, 2, ...
  sum(cash_flows / (1 + rate)^t)
}
