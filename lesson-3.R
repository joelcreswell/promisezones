# Database connections from R

library(RSQLite)
con <- dbConnect(...)
dbGetQuery(con, "pragma foreign_keys = on")
...

# Two ways to access data

plots <- dbReadTable(con, "plots")
surveys <- dbReadTable(...)
...

dbGetQuery(con, "select species_id, weight
                 ...
                 ...
                 ...)

# Exercise 1

...

# Primary keys

dbGetQuery(con, ...)

# Foreign keys

dbGetQuery(con, "...
                 ...
                 values (35549, 1, ..., 'M')")


# One-to-Many Relationship

df <- dbGetQuery(con, "select weight, month, plot_type
                       ...
                       ...
                       where weight is not null")
str(df)

## Exercise 2

...
