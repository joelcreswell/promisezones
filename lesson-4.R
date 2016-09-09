## Tidy data concept

counts_df <- data.frame(
  day = c("Monday", ...),
  wolf = c(2, 1, 3),
  hare = c(...),
  ...
)

## Reshaping multiple columns in category/value pairs

library(tidyr)
counts_gather <- gather(counts_df, ...)

counts_spread <- spread(counts_gather, ...)

## Exercise 1

...

## Read comma-separated-value (CSV) files

surveys <- ...

## Subsetting and sorting

library(dplyr)
surveys_1990_winter <- filter(...)

surveys_1990_winter <- select(surveys_1990_winter, ...)

sorted <- ...(surveys1990_winter, ...)

## Exercise 2

...

## Grouping and aggregation

surveys_1990_winter_gb <- group_by(...)

counts_1990_winter <- summarize(..., count = n())

## Exercise 3

...

## Transformation of variables

prop_1990_winter <- mutate(...)

## Exercise 4

...

## Chainning with pipes

prop_1990_winter_piped <- surveys %>%
  filter(year == 1990, month %in% 1:3)
  ... # select all columns but year
  ... # group by species_id
  ... # summarize with counts
  ... # mutate into proportions
