
set.seed(123)

# 1.1 Podstawowe elementy jezyka R ----
# http://github.com/rstudio/cheatsheets/raw/master/base-r.pdf).


# 1.2 Srednia z proby ----
# Napisz kilka wariantów funkcji obliczającej średnią z próby (zadanej jako wektor v); 
# kolejne warianty mogą wykorzystywać np. różne rodzaje pętli (for, while, repeat). 
# Porównaj działanie z funkcją biblioteczną mean.

v <- sample(x=1:10, size=10, replace=TRUE, prob=NULL)
print(v)

# Version 1
my.mean1 <- function(xs) {
  sum(xs) / length(xs)
}

# Version 2
my.mean2 <- function(xs) {
  sum = 0
  for (i in xs) {
    sum <- sum + i
  }
  sum / length(v)
}

# Version 3
my.mean3 <- function(xs) {
  xs_len = length(xs)
  sum = 0
  i = 0
  repeat {
    sum <- sum + xs[i+1]
    i <- i + 1
    if (i >= xs_len) {
      break
    }
  }
  sum/xs_len
}

print(my.mean1(v))
print(my.mean2(v))
print(my.mean3(v))
print(mean(v))


# 1.3 Srednia ucinana ----
# Napisz funkcję obliczającą średnią ucinaną (o parametrze k) elementów wektora v.
# truncated mean, trimmed mean
# https://pl.wikipedia.org/wiki/%C5%9Arednia_ucinana

#install.packages("DescTools")
library("DescTools")

v <- sample(x=1:10, size=10, replace=TRUE, prob=NULL)
print(v)

k = 0.2

my.truncated.mean <- function(xs, trunc_prc=0) {
  xs.sorted <- sort(xs)
  if (trunc_prc > 0.5) trunc_prc <- 0.5
  if (trunc_prc < 0) trunc_prc <- 0
  xs.trimmed <- Trim(xs.sorted, trim=trunc_prc)
  mean(xs.trimmed)
}

my.truncated.mean(v, k)
mean(v, trim = k)

?mean


# 1.4 Srednia winsorowska ----
# Napisz funkcję obliczającą średnią winsorowską (o parametrze k) elementów wektora v.
# Winsorized mean
# https://pl.wikipedia.org/wiki/%C5%9Arednia_winsorowska
# https://www.r-bloggers.com/winsorization/

v <- sample(x=1:10, size=10, replace=TRUE, prob=NULL)
print(v)

k = 0.3

my.winsor <- function (xs, trunc_prc) {
  xs.sorted <- sort(xs)
  print(xs.sorted)
  
  if(trunc_prc < 0 || trunc_prc > 0.5) {
    stop("trunc_prc musi byc z przedzialu [0,.5]")
  }
  lim <- quantile(xs, probs=c(trunc_prc, 1-trunc_prc)) # pozycje odciecia
  xs.sorted[xs.sorted < lim[1]] <- lim[1] # zamien elementy na pozycjach po lewej
  xs.sorted[xs.sorted > lim[2]] <- lim[2] # a potem po prawej
  
  print(lim)
  print(lim[1])
  print(lim[2])
  xs.sorted
}

my.winsor(v, k)


# 1.5 Mediana proby ----
# Napisz funkcję obliczającą medianę próby (zadanej jako wektor v). 
# Porównaj działanie z funkcją biblioteczną median.

v1 <- sample(x=1:10, size=10, replace=TRUE, prob=NULL)
v2 <- sample(x=1:10, size=9, replace=TRUE, prob=NULL)
print(v1)
print(v2)

my.median <- function(xs) {
  xs.sorted <- sort(xs)
  #print(xs.sorted)
  len <- length(xs)
  pos <- (len + 1) / 2
  if ((len %% 2) == 0) {
    median <- (xs.sorted[pos] + xs.sorted[pos+1]) / 2
  } else {
    median <- xs.sorted[pos]
  }
}

print(my.median(v1))
print(median(v1))
print(my.median(v2))
print(median(v2))


# 1.6 Rozstep proby ----
# Napisz funkcję obliczającą rozstęp próby (zadanej jako wektor v).

v <- sample(x=1:10, size=3, replace=TRUE, prob=NULL)
print(v)

my.range <- function(xs) {
  max(xs) - min(xs)
}

print(my.range(v))


# 1.7 Wariancja w probie ----
# Napisz funkcję obliczającą wariancję w próbie (zadanej jako wektor v). 
# Porównaj działanie z funkcją biblioteczną var. 
# Czy można wykorzystać tę funkcję do obliczenia wariancji dla całej populacji?

v <- sample(x=1:10, size=30, replace=TRUE, prob=NULL)
print(v)

my.var <- function(xs) {
  n <- length(xs)
  m <- mean(xs)
  #mean((m - xs)^2) * n / (n - 1)
  sum((xs - m)^2 / (n - 1))
}

print(my.var(v))
print(var(v))

# Odp: Dla wektora o bardzo wielu wartosciach n, roznica miedzy wartoscia wariancji dla proby
# i populacji jest nieistotna (moznaby bylo wtedy korzystac z tej samej funkcji). Dla malych n
# wartosc wariancji proby jest wieksza (robi sie to dlatego, zeby skompensowac brak pelnej 
# informacji o populacji). 


# 1.8 Odchylenie standardowe w probie ----
# Napisz funkcję obliczającą odchylenie standardowe w próbie (zadanej jako wektor v).
# Porównaj działanie z funkcją biblioteczną sd. 
# Czy można wykorzystać tę funkcję do obliczenia odchylenia standardowego dla całej populacji?

my.sd <- function(xs) {
  sqrt(my.var(xs))
}

print(my.sd(v))
print(sd(v))

# Odp: Jako, ze do obliczenia odchylenia standardowego wykorzystuje sie wartosc wariancji,
# odpowiedz na pytanie jest taka sama jak w 1.7.


# 1.9 Odchylenie przecietne ----
# Napisz funkcję obliczającą odchylenie przeciętne od wartości średniej dla próby 
# (zadanej jako wektor v).

my.average.absolute.deviation <- function(xs) {
  n <- length(xs)
  m <- mean(xs)
  #mean(abs(v-mean(v)))
  sum(abs(xs - m)) / n
}

print(my.average.absolute.deviation(v))
print(mean(abs(v-mean(v))))
# https://stackoverflow.com/questions/31095550/why-do-the-results-of-madx-differ-from-the-expected-results


# 1.10 Kwartyl dolny ----
# Napisz funkcję obliczającą kwartyl dolny (pierwszy) próby (zadanej jako wektor v). 
# Porównaj działanie z funkcją biblioteczną fivenum.

# https://tolstoy.newcastle.edu.au/R/e17/help/att-1067/Quartiles_in_R.pdf
# https://www.statystyczny.pl/jak-obliczamy-kwantyle/
# https://lagunita.stanford.edu/courses/course-v1:Medicine+IPE21CC+ongoing/wiki/HRP258/example-r-classwork-solutions-using-r/calculating-inner-quartile-range-r/

v <- sample(x=1:10, size=7, replace=TRUE, prob=NULL)
print(v)

# Version 1
my.quartile <- function(xs) {
  xs.sorted <- sort(xs)
  len <- length(xs.sorted)
  m <- (len + 1) / 2 # Pozycja elementu mediany
  if (len %% 2) {
    l <- m-1/2
    u <- m+1/2
  } else {
    l <- m-1 
    u <- m+1
  }
  c(Q1=median(xs.sorted[1:l]), Q2=median(xs.sorted), Q3=median(xs.sorted[u:len]))
}

# Version 2
my.lower.quartile2 <- function(xs) {
  quantile(xs, 1/4, type=2)
}

q <- my.quartile(v)
print(q[1])
print(my.lower.quartile2(v))
print(fivenum(v))


# 1.11 Kwartyl gorny ----
# Napisz funkcję obliczającą kwartyl górny (trzeci) próby (zadanej jako wektor v). 
# Porównaj działanie z funkcją biblioteczną fivenum.

# Version 1
q <- my.quartile(v)

# Version 2
my.upper.quartile2 <- function(xs) {
  quantile(xs, 3/4)
}

print(q[3])
print(my.upper.quartile2(v))
print(fivenum(v))


# 1.12 Kwantyl rzedu p ----
# Uogólnij dwa poprzednie rozwiązania wprowadzając funkcję obliczającą kwantyl rzędu p. 
# Porównaj działanie z funkcją biblioteczną quantile.

# https://www.statystyczny.pl/jak-obliczamy-kwantyle/

?quantile()

v <- sample(x=1:10, size=8, replace=TRUE, prob=NULL)
print(v)

p <- .6

my.quantile <- function(xs, p) {
  xs.sorted <- sort(xs)
  len <- length(xs.sorted)
  if (p >= 0 && p <= 1) {
    m <- (len + 1) * p
    print(xs.sorted)
    xs.sorted[m+1]
  }
}

my.quantile(v, p)
quantile(v, p)


# 1.13 Rozstep miedzykwartylowy proby ----
# Napisz funkcję obliczającą rozstęp międzykwartylowy próby (zadanej jako wektor v).
# Porównaj działanie z funkcją biblioteczną IQR.

# https://www.geeksforgeeks.org/interquartile-range-iqr/

q <- my.quartile(v)
print(q[3] - q[1])

my.IQR <- function(xs) {
  q <- my.quartile(xs)
  q[3] - q[1]
}

my.IQR2 <- function(xs) {
  xs.sorted <- sort(xs)
  n <- length(xs)
  m <- (n + 1) / 2
  if (floor(m) != m) {
    l <- m-1/2; u <- m+1/2
  } else {
    l <- m-1; u <- m+1
  }
  Q1 = median(xs.sorted[1:l])
  Q3 = median(xs.sorted[u:n])
  Q3 - Q1
}

my.IQR3 <- function(xs) {
  quantile(xs, 3/4) - quantile(xs, 1/4)
}

print(my.IQR(v))
print(my.IQR2(v))
print(my.IQR3(v))
print(IQR(v))


# 1.14 Badanie wydajnosci ----

#install.packages('microbenchmark')  
library(microbenchmark) 

v <- sample(x=1:100, size=10000, replace=TRUE, prob=NULL)
print(v)

results <- microbenchmark(  
  f1 = my.mean1(v),
  f2  = my.mean2(v),
  f3  = my.mean3(v),
  f4  = mean(v),
  times = 1000)

print(results)

boxplot(results)

library(ggplot2)  
autoplot(results)

# https://www.alexejgossmann.com/benchmarking_r/


# 1.15 Warianty tworzenia grafiki ----
# https://flowingdata.com/2016/03/22/comparing-ggplot2-and-r-base-graphics/


# 1.16 Zapoznaj się z dostępnymi w środowisku R zbiorami danych ----
# (np. ?datasets, library(help="datasets"), ?mtcars, summary(mtcars)).

?datasets

library(help = "datasets")

#install.packages("DataExplorer")
library(DataExplorer)

?AirPassengers
summary(AirPassengers)
DataExplorer::create_report(AirPassengers)

?HairEyeColor
summary(HairEyeColor)
DataExplorer::create_report(HairEyeColor)

?Titanic 
summary(Titanic)
DataExplorer::create_report(Titanic)

?faithful
summary(faithful)
DataExplorer::create_report(faithful)

?trees
summary(trees)
DataExplorer::create_report(trees)


# 1.17 Wyjaśnij zastosowania wykresów ----
# Wyjaśnij zastosowania wykresów: słupkowego (barplot), kołowego (pie i pie3D), 
# histogramu (hist), ramkowego/pudełkowego (boxplot) i skrzypcowego (vioplot).

# Wykres slupkowy:
# https://mfiles.pl/pl/index.php/Wykres_s%C5%82upkowy

# Wykres kolowy:
# https://mfiles.pl/pl/index.php/Wykres_ko%C5%82owy

# Histogram:
# https://mfiles.pl/pl/index.php/Histogram

# Wykres ramkowy/pudelkowy:
# https://mfiles.pl/pl/index.php/Wykres_pude%C5%82kowy

# Wykres skrzypcowy:
# https://www.statystyczny.pl/wykres-skrzypcowy/


# 1.18 Opisz elementy wykresu ramkowego/pudełkowego ----

# Wykres ramkowy/pudelkowy:
# https://mfiles.pl/pl/index.php/Wykres_pude%C5%82kowy


# 1.19 Znajdź odpowiedniki barplot, hist i boxplot dostępne w bibliotece ggplot2. ----

# Barplot:
# http://www.sthda.com/english/wiki/ggplot2-barplots-quick-start-guide-r-software-and-data-visualization

# Histogram:
# http://www.sthda.com/english/wiki/ggplot2-histogram-plot-quick-start-guide-r-software-and-data-visualization

# Boxplot:
# http://www.sthda.com/english/wiki/ggplot2-box-plot-quick-start-guide-r-software-and-data-visualization

# Violin plot:
# http://www.sthda.com/english/wiki/ggplot2-violin-plot-quick-start-guide-r-software-and-data-visualization

