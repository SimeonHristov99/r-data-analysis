################################################################################
# General
################################################################################

# The "Hello, world" program.
print('Hello, world')

identical('hello', "hello")

# R as a Calculator
1 * 2 * 3 * 4 * 5
sqrt(10)
pi; exp(1) # ; for multiple commands
round(10.6)

# assign values to variables
x <- 1
y <- 2
z = 3 # = and <- are equivalent

# display the value of a variable
x
print(x)
structure(x)
x + 5
print(x <- 5)
x + y

ls() # list the names of all objects in the current env
rm(list=ls()) # remove all object from the list. In this case, cleans the env.


################################################################################
# Variable Types
################################################################################

num_x = as.numeric(10.1) # an object that can be interpreted as a number
is.numeric(num_x)
is.numeric("hello")

?NumericConstants
int_x = as.integer(10.1) # stored as "10L" where L is a qualifier for integer
int_x

compl = as.complex(10+2i)
str_x = as.character("10+2i")

factor_x = as.factor(10) # used to represent categories
gender = factor(c('male', 'female', 'female', 'male'))
levels(gender) # because 'f' comes before 'm'
nlevels(gender)

logical_x = as.logical(TRUE)
logical_x = as.logical(0)
is.logical(logical_x)

# casting
as.numeric(TRUE)
as.character(10)
as.integer(10.6)
as.numeric("Hello")
10 + factor_x
10 + as.numeric(factor_x)
10 + as.numeric(as.character(factor_x))

# check the type of a variable
x = 2
class(x)
class(num_x)
class(int_x)
class(factor_x)


################################################################################
# Vectors
################################################################################

vec_x = c(3, 2, 1)
vec_x
vec_x[0]
vec_x[1] # get the element at idx 0
vec_x[-1] # remove the element at idx 1
vec_x[c(TRUE, FALSE, TRUE)]

# if one element is a string, every element becomes a string
vec_x = c('one', 2:10, as.factor(99))
vec_x
length(vec_x)
class(vec_x) # character
as.integer(vec_x)
vec_x = 1:5
vec_x
vec_x[1] = 'one'
class(vec_x) # character
as.integer(vec_x)
vec_x[c(2, 3, 1)] = c(6, 7, 8)
class(vec_x) # character
vec_x[] = 5:1
class(vec_x) # character

vec_x = 5:1
class(vec_x) # integer

# Mean, Median, Mode

Modes <- function(x) {
  ux <- unique(x)
  tab <- tabulate(match(x, ux))
  ux[tab == max(tab)]
}

vec_x = c(1:20, 100.5)
vec_x
class(vec_x)

mean(vec_x)
mean(as.integer(vec_x))
vec_x = as.integer(vec_x)
mean(vec_x)

sd(vec_x)

median(vec_x)

mad(vec_x) # mean absolute deviance

Modes(vec_x)

# which and any
any(abs(vec_x - median(vec_x)) > 3 * mad(vec_x))
# return the position of the element
pos = which(abs(vec_x - median(vec_x)) > 3 * mad(vec_x))
pos
vec_x[pos]

rm(list=ls())


################################################################################
# Functions
################################################################################

mean.and.sd <- function(x){
  av <- mean(x)
  sdev <- sd(x)
  return(c(mean=av, SD=sdev))
}


################################################################################
# Data frames
################################################################################
rm(list=ls())

v1<-1:10
v2<-seq(0,1,length=10)
v3<-letters[1:10]
d1<-data.frame(vector1=v1,vector2=v2,ABC=v3)
str(d1)
d1$ABC
d1$binary <-c(rep(TRUE,times=5),rep(FALSE,times=5))

d2<-data.frame(vector1=v1,ABC=v3,stringsAsFactors =FALSE)
d2$factor<-as.factor(rep(c("male","female"),times=5))
str(d2)

# mtcars dataset
data(mtcars)
mtcars
head(mtcars)
edit(mtcars)
str(mtcars)
colnames(mtcars)[1:5]
rownames(mtcars)[1:5]
mtcars$mpg
mtcars[,1]
mtcars[1,]

edit(mtcars)
data()
data("longley")
edit(longley)

save(mtcars,file = "Data/testData1.rda")
save(mtcars,iris,file = "Data/testData2.rda")

rm(list=ls())

load("Data/testData2.rda")
ls()
list.files()
file.path("Data/testData2.rda")

install.packages("data.table")        # install package
installed.packages()                  # installed packages
#update.packages()                     # keep up to date all packages
library(data.table)                   # load package 
require(data.table)                   # load package 
?data.table                           # read
?fread                                # read

write.table(mtcars,file = "Data/mmtcars.txt", row.names = FALSE)
df <- read.table("Data/mmtcars.txt")

write.csv(women,"Data/wData.csv")
read.csv("Data/wData.csv")

x<-read.table("https://s3.amazonaws.com/assets.datacamp.com/blog_assets/test.txt")
x
str(x)
nrow(x)
ncol(x)
colnames(x)<-c("Var1", "Var2","Var3") 
rownames(x)<-x[,1]
names(x)
y<-x[1:5,2:3]
y

install.packages("readxl")
library(readxl)
datasets<-system.file("extdata/datasets.xlsx",package = "readxl")
data_iris=read_excel(datasets)
