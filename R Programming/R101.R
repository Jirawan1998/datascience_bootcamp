1+1
2*2
3*5
5/2
6-2
5%%2 # mod
log(5)
exp(2)
2**5
abs(-10)


# basic knowledge programming
#1.variable
#2.data types
#3.data structures
#4.control flow
#5.function

#1 create varible
income = 28000
expense = 19500
saving = income - expense

# remove varible
rm(saving)
rm(income)
rm(expense)

#2.data types
#numeric, character(text),
#date, logical(TRUE,FALSE)

my_age = 20
my_name = "Tuk"
movie_lover = TRUE 

class(my_age)
class(my_name)

is.numeric(my_age)
is.character(my_age)
is.logical(movie_lover)

## YYYY-MM-DD
wantee = "2023-02-04"
wantee = as.Date(wantee)

#3.data structures
#1.vector
#2.matrix
#3.list
#4.datafrome

friend = c("Tak", "Toy","Marry", "Lisa", "John")
length(friend)
friend[1]
friend[2]

#matrix, vector 2 dimention
m = matrix(1:10, ncol = 2, byrow = TRUE)
n = matrix(c(5,10,2,4), ncol = 2)
m2 = matrix(c(1,2,5,5), ncol = 2)

y = 1:6

#list can collect multiple data types/object
#key = value
my_playlists = list(
  fav_movie = c("The dark knight", "Marvel"),
  fav_song = c("OMG","Diito", "Attention"),
  fav_artist = c("NCT DREAM","Blackpink")
)

#customer_01 
customer_01 = list(
  name = "Tuk",
  location = "BKK",
  age = 24,
  movies = c("Jonh Wick", "Dark Knight")
)

#customer_02 
customer_02 = list(
  name = "John",
  lname = "Wick",
  age = 42,
  movies = "Jonh Wick 4",
  fav_weapon = "A pencil"
)

customer_db = list(
  customer_01,
  customer_02
)

#dataframe
#table in gg sheet/ sql database

data()
mtcars

#create a new dataframe
friends = c("tuk", "toy", "lisa", "rose", "jenny")
ages = c(24, 34, 26, 27,28)
movie_lovers = c(F, F, T, T, T)

df = data.frame(id = 1:5,
          friend = friends, 
           age = ages,
           movie_lover =  movie_lovers)
View(df)

#alternative

#subset
df[ ,2:3]
df[1:3, ]
df[1:3, 2:3]
df[ ,c(1,3)]

df[1,2]
df[1,2] = "Minnie"

# OR in R
## |
df$age >= 28

#4.control flow + function
print("Hello World")

##user difined function

add_two_nums = function(v1,v2) {
  return(v1 + v2)
}

cube = function(x) x**3
my_power = function(base,pow) base**pow

