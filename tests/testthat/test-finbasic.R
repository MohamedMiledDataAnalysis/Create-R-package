# Tests, run with devtools::test(): the equivalent of tests/test_core.py in Python.

test_that("loan_payment gives the known value", {
  expect_equal(loan_payment(200000, 0.045, 25), 1111.66, tolerance = 0.005 / 1111.66)
})

test_that("loan_payment handles a zero rate", {
  expect_equal(loan_payment(12000, 0, 1), 1000)
})

test_that("loan_payment rejects bad input", {
  expect_error(loan_payment(-1, 0.05, 10))
})

test_that("npv gives the known value", {
  expect_equal(npv(0.10, c(-1000, 300, 400, 500)), -21.04, tolerance = 0.005 / 21.04)
})
