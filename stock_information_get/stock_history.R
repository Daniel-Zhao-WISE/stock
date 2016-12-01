## This is a function to download the stock price from finance.yahoo.com, and it will download to 
## your local working directory with the name "symbol-start_period-end_period" in .csv file
## R version 3.3.2 (2016-10-31)
## System x86_64, mingw32
## --------------------------------------------------------------------------------------------


## -----------------------------------ATTENTION------------------------------------------------
## Unsolved problem
## If the period you want to download doesn't have a trade day, it will download an error html
## file in the .csv format!!!
## --------------------------------------------------------------------------------------------

## Reference: python package ystockquote, version = '0.2.5dev'

## symbol is the stock symbol you want to download
## start_yyyy is the start period's year in yyyy format
## start_mm is the start period's month in mm format
## start_dd is the start period's day in dd format
## end_yyyy is the end period's year in yyyy format
## end_mm is the end period's month in mm format
## end_dd is the end period's day in dd format
## --------------------------------------------------------------------------------------------

stock_history <- function(symbol, start_yyyy, start_mm, start_dd, end_yyyy, end_mm, end_dd){
        Url <- paste0("http://real-chart.finance.yahoo.com/table.csv?a=", start_mm-1,
                      "&ignore=.csv&s=", symbol, "&b=", start_dd, "&e=", end_dd, "&d=",
                      end_mm-1, "&g=d&f=", end_yyyy, "&c=", start_yyyy)
        download.file(Url, paste0(symbol, "-", start_yyyy, "_", start_mm, "_", start_dd,
                                  "-", end_yyyy, "_", end_mm, "_", end_dd, ".csv"), "curl")
}

## --------------------------------------------------------------------------------------------
## Example 1
## stock_history('GOOG', 2016, 2, 1, 2016, 2, 2)
## Download a file called "GOOG-2016_2_1-2016_2_2.csv" file in your working directory

## Example 2
## stock_history('GOOG', 2016, 1, 1, 2016, 1, 2)
## Download a file with error html text in the "GOOG-2016_2_1-2016_2_2.csv" file, because 
## period from 2016_1_1 to 2016_1_2 doesn't involves a trade day