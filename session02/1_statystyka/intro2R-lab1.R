R.version.string

getRversion()

help(help)

?help

?"+"

library(help = "stats")

2+2

2^5

FALSE == FALSE

T == TRUE

3 > 2

2 +
2  

print("My name is Inigo Montoya. You killed my father. Prepare to die.")

?print

cat("My name is Inigo Montoya. You killed my father. Prepare to die.")

?cat

cat('aa', 'bb')

?c

xs <- c(1,2,3,4,5)
ys <- c(10,20,30,40,50)
cat(xs, ys)

print("My name is Inigo Montoya.", "You killed my father.", "Prepare to die.") # !!!

#ca # naciskamy klawisz [TAB], wybieramy z listy "cat", otwieramy nawias i... kontynuujemy wg nastepnej linii :)
cat(c('a','b'))
cat('a', 'b')

?getwd
getwd()
setwd("~/Documents/git/data-science-postgrad/session02/1_statistics")

x1 <- 10
.x2 <- 3.5
x.3 <- "abc"

ls()
?ls
ls(all.names = T)

?rm
rm(x.3)

# -------------------- Clear Session

x1 <- TRUE
class(x1)
?logical
is.logical(x1)

?numeric
?integer
?complex
?character
?vector

0.1 + 0.1 == 0.2
0.1 + 0.1 + 0.1 == 0.3
0.1 + 0.1 + 0.1

maxN <- 2^.Machine$double.digits
maxN + 1 == maxN
