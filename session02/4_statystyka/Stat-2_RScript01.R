
# Generuj dane ----
# Wygeneruj losowo zestaw danych
# x - dziedzina
?sample()

set.seed(5) # reset generatoras
xs <- sample(x=1:6, size=6, replace=TRUE, prob=NULL)

print(xs)

# 1. Obliczanie sredniej z proby ----
print(mean(xs))

sum(xs) / length(xs)

my.mean <- function(xs) {
  sum(xs) / length(xs)
}

my.mean(xs)

my.mean

# 2. Obliczanie mediany ----
?datasets

print(median(xs))
median(mtcars$mpg)

mtcars

summary(mtcars)

# TODO
my.median <- function(xs) {
  xs.sorted <- sort(xs)
  if((num %% 2) == 0) {
    print(paste(num,"is Even"))
  } else {
    print(paste(num,"is Odd"))
  }
}

summary(xs)

?fivenum
fivenum(xs)


# 3. Kwartyle ----

?quantile

# 4. Wskazniki rozproszenia ----

var(xs)
sd(xs)
IQR(xs)



# 5. Wskazniki ksztaltu (rozkladu) ----


# 6. Klasyczna i czestotliwosciowa definicja prawdopodobienstwa ----

#install.packages('dice')
#library('dice')

v <- c(1,2,3,4,3,2,3,4,2)
v[v ==2] # pokaz wszystkie v spelniajace takie ograniczenie
v==2

print(length(v[v ==2])/length(v))

xs <- sample(x=1:6, size=1000, replace=TRUE, prob=NULL)
print(length(xs[xs ==3])/length(xs))

#--- symulacja
trials <-30
omega <- 1:6
sim.results <-sample(x=omega, size=trials, replace=TRUE,prob=NULL)
prob.sim <- mean(sim.results == 3) # sprawdz gdzie jest 3 (TRUE) a gdy nie ma, to FALSE (mapa)
  # FALSE = 0, TRUE = 1
  # mean oblicza srednia z jedynek przez wszystkie -> prawdopodobienstwo
print(prob.sim)
prob.exact <- 1/6 # exact value
print(prob.exact)
approx.error <- (abs(prob.sim - prob.exact))/prob.exact
approx.error

# spr dla coraz wiecej trials, blad maleje 
# a wartosci symulowane sa coraz bardziej zblizone do obliczonych

# 7. Monty Hall problem ---- 
