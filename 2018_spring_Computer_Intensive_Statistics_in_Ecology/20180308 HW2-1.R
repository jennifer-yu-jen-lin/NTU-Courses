
# 1a. Generate 10000 random numbers from Gaussian distribution with mean=20 and variance =10, and plot the distribution.
Gaussian <- rnorm(n=10000, mean=20, sd=sqrt(10)) 
hist(Gaussian)
abline(v = mean(Gaussian), col = "blue", lwd = 2)

# 1b. Generate 10000 random numbers from Binomial distribution with p=0.5 and n=40, and plot the distribution.

Binomial <- c()

for (i in c(1:10000) ){
  RUNIF <- runif(n=40, min=0, max=1)
  SUM <- sum(RUNIF>0.5)
  Binomial <- append(Binomial, SUM )
}

hist(Binomial)
abline(v = mean(Binomial), col = "red", lwd = 2)




# Compare the distribution of 1a and 1b, what do you find? 
# (hint: you can use  rand  and  randn  in matlab. Or, “runif” and “rnorm” in R)

# compare the hist
par(mfrow = c(1,2)) 
hist(Gaussian, ylim=c(0, 2500))
abline(v = mean(Gaussian), col = "blue", lwd = 2)
hist(Binomial, lty=2, ylim=c(0, 2500))
abline(v = mean(Binomial), col = "red", lwd = 2)

# overlay the hist
hist(Gaussian, xlab = "Gauss(solid) & Binom(dashed)", main = "Comparison")
abline(v = mean(Gaussian), col = "blue", lwd = 2)
par(new = TRUE) #New plot
hist(Binomial, lty=2, axes = FALSE, xlab = "", ylab = "", main ="")
abline(v = mean(Binomial), col = "red", lwd = 2)






# 2. Make a program that can select our candidates for presentation next week. This program should select randomly but avoid selecting the numbers that had been selected before. 
# (hint: uniform distribution, loop, and if statements.)

# Read roster.csv into R
roster <- read.csv(file="~/R/roster.csv", header=TRUE)

#select our candidates
candidate <- c()
presentation <- c()

for (i in c(1:10000)){
  candidate <- round(runif(n=1, min=1, max=23))
  if (canddidate %in% presentation){
    
  } else {
    presentation <- append(presentation,candidate)
  }
}




