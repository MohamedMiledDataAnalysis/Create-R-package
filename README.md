# finbasic (R)

Basic financial functions: loan payment and net present value.

## Install

```r
devtools::install()          # from this folder
devtools::load_all()         # load without installing, while developing
```

## Use

```r
library(finbasic)

loan_payment(200000, 0.045, 25)      # 1111.66
npv(0.10, c(-1000, 300, 400, 500))   # -21.04
?loan_payment                        # documentation
```

## Test

```r
devtools::test()
```

After editing the `#'` comments in `R/finbasic.R`, run `devtools::document()` to regenerate `NAMESPACE` and the help pages in `man/`.
