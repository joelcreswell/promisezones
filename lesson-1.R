## Scripting in the editor

... <- c(...)

... <- data.frame(...)

## Anatomy of a function

function(...) {         # The arguments, or input, to the function goes here.  
   ...                  # The body of the function goes here.
   return(...)          # Any output of the function goes here.
}

## Change the url for the origin repo

system('git remote set-url origin ...')

## Install missing packages

requirements <- c('tidyr', 'ggplot2', 'RSQLite', 'rmarkdown')
missing <- setdiff(..., rownames(installed.packages()))
if (...) {
  install.packages(missing)
}
