?distributions

# 1. Przyklady rozkladow dyskretnych
#- d - wartosc funkcji gestosci (ciagly rozklad), wartosc prawdopodobienstwa (rozklad dyspretny)
#- p - dystrybuanta
#- q - kwantyl

# The Binomial Distribution

dunif(1, min=1, max=2) # 1

dunif(1, min=1, max=3) # 0.5

punif(1.5, min=1, max=2) # 0.5

punif(0.5, min=1, max=2) # 1.5 (mediana)

set.seed(123)
runif(1, min=1, max=2) # pobierz 1 losowa liczbe
runif(5, min=1, max=2)
runif(1:5, min=1, max=2) # pobierz 5 losowych liczb

# The Normal Distribution

?dnorm

dnorm(0, mean=0, sd=1) # dla 0, wartosc funkcji gestosci rozkladu normalnego w zerze
pnorm(0, mean=0, sd=1)
qnorm(0.5, mean=0, sd=1) # w jakim punkcie funkcja gestosci bedzie rowne 1?
rnorm(10, mean=0, sd=1)

# wygeneruj probke z rozkladu normalnego (100 obserwacji) - symulacja
n1 <- rnorm(100, mean=0, sd=1)
mean(n1) # spodziewamy sie czegos w okolicach zera
sd(n1) # spodziewamy sie 1

n2 <- rnorm(100, mean=5, sd=2)
mean(n2)
sd(n2)

?seq

xs <- seq(from = -5, to = 5, by = 0.1)

?plot
plot(xs, dnorm(xs, mean=0, sd=1), type='l')


# p1 = P(0.5 < X < 1.0), dla X ~ N(0, 1) (dla X podelgajacemu rozkladowi normalnemu o mean=0 i std=1)
p1 <- pnorm(1, mean=0, sd=1) - pnorm(0.5, mean=0, sd=1)
p1
# ale czy to dobrze?
p2 <- pnorm(+Inf, mean=0, sd=1) - pnorm(0, mean=0, sd=1)
p2

# Prawo wielkich liczb - w granicy, dostaniemy dokladne oszacowanie sredniej
# rozmiar probki ma znaczenie i kazde oszacowanie parametru w populacji bedzie dokladniejsze
# srednia proby staje sie estymatorem pubktowym parametru sredniej w populacji
n3 <- rnorm(100, mean=0, sd=1)
mean(n3)

n4 <- rnorm(200, mean=0, sd=1)
mean(n4)

# centralne twierdzenie graniczne
zob. zdjecie

n5 <- rnorm(1000, mean=0, sd=1)
mean(n5)

n6 <- rnorm(10000, mean=0, sd=1)
mean(n6)

n7 <- rnorm(1000000, mean=0, sd=1)
mean(n7)
