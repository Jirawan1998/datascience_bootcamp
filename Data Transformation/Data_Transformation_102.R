#install packages ("tidyverse)
# dplyr tidyr ggplot2

install.packages("tidyverse")
library(tidyverse)

# data.frame vs tibble 

df_tribble <- tibble(id = 1:3, name = c("toy", "jisoo", "lisa"))
df <- data.frame(id = 1:3, name = c("toy", "jisoo", "lisa"))

#convert data frame to tribble
mtcars
mtcars_tribble <- tibble(mtcars)

# sample_n

set.seed(42)
sample_n(mtcars, size = 5)

sample_frac(mtcars, size = 0.5, replace = T)

slice(mtcars, 1:5)

mtcars %>%
  slice(1:5)

mtcars %>%
  slice(c(1,3,5))

mtcars %>%
  slice( sample(nrow(mtcars),10))
