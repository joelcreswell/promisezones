## Libraries and data

library(dplyr)
library(...)
surveys <- read.csv(..., na.strings = "") %>%
  filter(!is.na(species_id), !is.na(sex), !is.na(weight))

## Constructing layered graphics in ggplot

ggplot(...,
       ...) +
  ...

ggplot(data = surveys,
       aes(x = species_id, y = weight)) +
  ...
  geom_point(...,
             ...,
             ...)

## Exercise 1

...

## Adding and customizing scales

surveys_dm <- filter(surveys, ...)
ggplot(...,
       aes(x = year, y = weight)) +
  geom_point(...,
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  ...

year_wgt <- ggplot(data = surveys_dm,
                   aes(...,
                       ...,
                       ...)) +
  geom_point(aes(shape = sex),
             size = 3,
             stat = "summary",
             fun.y = "mean") +
  geom_smooth(method = "lm")
year_wgt

year_wgt <- year_wgt +
  scale_color_manual(...,
                     ...) +
  ...(values = c(3, 2),
      labels = c("Female", "Male"))
year_wgt

## Exercise 2

...

## Axes, labels and themes

histo <- ggplot(data = surveys_dm,
                aes(x = weight, fill = sex)) +
  geom_ ...
histo

title <- expression(paste(italic("Dipodomys merriami"),
                          " weight distribution"))
histo <- histo +
  ...(title = title,
       x = "Weight (g)",
       y = "Count") +
  scale_x_continuous(limits = c(20, 60),
                     breaks = c(20, 30, 40, 50, 60),
                     expand = c(0, 0)) +
  scale_y_continuous(expand = c(0, 0))
histo

histo <- histo +
  theme_bw() +
  theme(legend.position = c(0.2, 0.5),
        plot.title = ...,
        ... = element_text(...),
        ... = element_text(size = 13, vjust = 0))
histo

## Facets

surveys_dm$month <- as.factor(surveys_dm$month)
levels(surveys_dm$month) <- c("January", "February", "March", "April", "May", "June",
                              "July", "August", "September", "October", "November", "December")

ggplot(data = surveys_dm,
       aes(x = weight)) +
  geom_histogram() +
  ...
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)")

ggplot(data = surveys_dm,
       aes(x = weight, fill = month)) +
  ...
  facet_wrap( ~ month) +
  labs(title = "DM weight distribution by month",
       x = "Count",
       y = "Weight (g)") +
  guides(fill = FALSE)

## Exercise 3

...

