#install packages
install.packages("dplyr")

# load package
library(dplyr)

#read csv file 
imdb <- read.csv("imdb.csv", stringsAsFactors = FALSE)
View(imdb)

# review data structure
glimpse(imdb)

# print head and tail of data
head(imdb, 5)
tail(imdb, 5)

# select column
select(imdb, MOVIE_NAME, RATING)
select(imdb,1, 1)

select(imdb, movie_name = MOVIE_NAME, released_year = YEAR)

# pipe operator
imdb %>% 
  select(movie_name = MOVIE_NAME, released_year = YEAR) %>% 
  head()

# filter data
filter(imdb, SCORE >= 9.0)
imdb %>% filter(SCORE >= 9.0)

names(imdb) <- tolower(names(imdb))

# select and filter
imdb %>%
  select(movie_name, year, score) %>%
  filter(score >=9 & year > 2000)

imdb %>%
  select(movie_name, length, score) %>%
  filter(score == 8.8 | score == 8.3)

imdb %>%
  select(movie_name, length, score) %>%
  filter(score %in% c(8.3, 8.8, 9.0))

# filter string columns
imdb %>%
  select(movie_name, genre, rating) %>%
  filter(grepl("Drama", imdb$genre)) %>%
  head(5)

imdb %>%
  select(movie_name) %>%
  filter(grepl("King", imdb$movie_name))

# Create New Columns
imdb %>%
  select(movie_name, score, length) %>%
  mutate(score_group = if_else(score >= 9, "high rating", "low rating"),
          length_group = if_else(length >= 120, "long film", "short film"))

imdb %>%
  select(movie_name, score) %>%
  mutate(score = score + 0.1) %>%
  head(5)

## arrange data
head(imdb)

imdb %>%
  select(movie_name, length) %>%
  arrange(length) %>%
  head(5)

imdb %>%
  select(movie_name, length) %>%
  arrange(desc(length)) %>%
  head(5)

imdb %>%
  select(movie_name, rating, length) %>%
  arrange(rating, desc(length)) %>%
  head(10)

# summarise and group
imdb %>%
  filter(rating != "") %>%
  group_by(rating) %>%
  summarise(sum_length = sum(length),
            mean_length = mean(length),
            sd_length = sd(length),
            min_length = min(length),
            max_length = max(length),
            n = n())

# join data
favorite_film <- data.frame(id = c(5, 10, 25, 30 ,98))

favorite_film %>%
  inner_join(imdb, by = c("id" = "no"))

# write csv file (export result)
imdb_prep <- imdb %>%
  select(movie_name, released_year = year, rating, length, score) %>%
  filter(rating == "R" & released_year > 2000)

write.csv(imdb_prep, "imdb_prep.csv", row.names = FALSE)
