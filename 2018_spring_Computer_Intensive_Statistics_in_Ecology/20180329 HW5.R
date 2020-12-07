#"Homework 5"
#"Yu-Jen Lin"

#### b04b01036@ntu.edu.tw
#### --------------------------------------------------------------------------------------------------------------------------------------------------------


#### Set working directory

setwd("~/R")


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 1. 
#### Compute the regression coefficients for
#### fish = β0+β1*copepod 
#### and using bootstrap method to calculate the 95% confidence limits of β1 
#### and test whether β1 is significantly different from 0 (with bootstrap 1000 times). 
#### Please calculate the CL using three methods: percentile, BC and BCa methods.

#### Read enviANDdensity.csv into R

enviANDdensity <- read.csv(file="~/R/enviANDdensity.csv", header=TRUE)

#Because we only need the data in "FishDensity..ind..1000m3." and "CopepodDensity.ind..m3.", I take these two columns out and set as "FishDensity" and "CopepodDensity" separately.

FishDensity <- enviANDdensity$FishDensity..ind..1000m3.
CopepodDensity <- enviANDdensity$CopepodDensity.ind..m3.



#### Compute the regression coefficients for 
#### fish(y) = β0 + β1 * copepod(x).
#Dimension of y  -> (n,1)
#Dimension of β0 -> (n,1)
#Dimension of β1 -> (k+1,1)
#Dimension of X  -> (n,k+1)

n <- length(FishDensity)
k <- 1

y  <- matrix(FishDensity, nrow=n, ncol=1, byrow = TRUE) # put the original sample into y
x  <- matrix(c(rep(1, times=n),CopepodDensity), nrow=n, ncol=k+1, byrow = FALSE)  # put the original sample into x

β1 <- solve(t(x) %*% x) %*% t(x) %*% y
β1
β0 <- y - x %*% β1  # fish(y) = β0 + β1 * copepod(x)

#Thus, through β1, I found the intercept of the regression line is 93.0646559 and the slope of the regression line is 0.1162999.
#y = 93.0646559 + 0.1162999*x




#### [bootstrap] β0 and β1

# set vectors to put the following sampling results
bootstrap.β0 <- c() 
bootstrap.β1 <- c()

# set starting points
n.bt <- length(FishDensity) 
k.bt <- 999

# bootstrap
for (i in 1:k.bt) {
  random <- ceiling(runif(34, min=0, max=34))
  bootstrap.Fish.i <- FishDensity[random] # single sampling result
  bootstrap.Copepod.i <- CopepodDensity[random] # single sampling result
  
  y.bt  <- matrix(bootstrap.Fish.i, nrow=n.bt, ncol=1, byrow = FALSE) # put the bootstrap sample into y.bt
  x.bt  <- cbind(c(rep(1, times=n.bt)), as.matrix(bootstrap.Copepod.i)) # combine the new column into the x.bt
  
  β1.bt <- solve(t(x.bt) %*% x.bt) %*% t(x.bt) %*% y.bt
  bootstrap.β0[i] <- β1.bt[1] # intercept
  bootstrap.β1[i] <- β1.bt[2] # slope
}

bootstrap.β0 <- append(bootstrap.β0, β1[1]) # add the β0 calculated by normal theory (total:1000)
bootstrap.β1 <- append(bootstrap.β1, β1[2]) # add the β1 calculated by normal theory (total:1000)



#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [percentile]

#### [percentile] CL of β1 

bootstrap.β1.sort <- sort(bootstrap.β1)
bootstrap.β1.sort[25]
bootstrap.β1.sort[975]


#As a result, the [percentile] CL of β1 is between "bootstrap.β1.sort[25]" and "bootstrap.β1.sort[975]".

#### [percentile] whether β1 is significantly different from 0
#In this case, if the lower limit of the [percentile] CL is bigger than zero, we can say that zero is not in the 95% [percentile] CL. Thus, β1 is significantly different from 0.

bootstrap.β1.sort[25]>0 # If this is TRUE, β1 is significantly different from 0, and vice versa.


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [BC]

#### [BC] CL of β1 

observe.index <- which(bootstrap.β1.sort == β1[2]) # The value we observed is not at the middle of bootstrap samples. Thus, we have to do bias correction.
observe.index.persentile <- observe.index/length(bootstrap.β1.sort)
z0 <- qnorm(observe.index.persentile)

BC.lower <- pnorm(2*z0 - 1.96)
BC.upper <- pnorm(2*z0 + 1.96)

bootstrap.β1.sort[BC.lower*1000]
bootstrap.β1.sort[BC.upper*1000]


#As a result, the [BC] CL of β1 is between "bootstrap.β1.sort[BC.lower x 1000]" and "bootstrap.β1.sort[BC.upper x 1000]".

#### [BC] whether β1 is significantly different from 0
#In this case, if the lower limit of the [BC] CL is bigger than zero, we can say that zero is not in the 95% [BC] CL. Thus, β1 is significantly different from 0.

bootstrap.β1.sort[BC.lower*1000]>0 # If this is TRUE, β1 is significantly different from 0, and vice versa.


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [BCa]

#### [BCa] CL of β1 

#### Calculate a by [Jackknife] 

# set vectors to put the following sampling results
Jackknife.β0 <- c() 
Jackknife.β1 <- c()

# set starting points
n.jn <- length(FishDensity)-1
k.jn <- length(FishDensity) 

# Jackknife
for (i in 1:k.jn) {
  Jackknife.Fish.i <- FishDensity[-i] # single sampling result
  Jackknife.Copepod.i <- CopepodDensity[-i] # single sampling result
  
  y.jn  <- matrix(Jackknife.Fish.i, nrow=n.jn, ncol=1, byrow = FALSE) # put the Jackknife sample into y.jn
  x.jn  <- cbind(c(rep(1, times=n.jn)), as.matrix(Jackknife.Copepod.i)) # combine the new column into the x.jn
  
  β1.jn <- solve(t(x.jn) %*% x.jn) %*% t(x.jn) %*% y.jn
  Jackknife.β0[i] <- β1.jn[1] # intercept
  Jackknife.β1[i] <- β1.jn[2] # slope
}

Jackknife.β1.mean <- mean(Jackknife.β1)

sum.fractions <- 0
sum.numerator.pre <- 0


for (i in length(Jackknife.β1)){
  sum.fractions <- sum.fractions + (Jackknife.β1.mean - Jackknife.β1[i]) ^ 3
  sum.numerator.pre <- sum.numerator.pre + (Jackknife.β1.mean - Jackknife.β1[i]) ^ 2
}

sum.numerator <- 6 * ( sum.numerator.pre^(3/2) )

a <- sum.fractions / sum.numerator

BCa.lower <- pnorm(   z0  +  (z0+1.96)/(1-a*(z0-1.96))   )
BCa.upper <- pnorm(   z0  +  (z0+1.96)/(1-a*(z0+1.96))   )

bootstrap.β1.sort[BCa.lower*1000]
bootstrap.β1.sort[BCa.upper*1000]

#As a result, the [BCa] CL of β1 is between "bootstrap.β1.sort[BCa.lower x 1000]" and "bootstrap.β1.sort[BCa.upper x 1000]".

#### [BCa] whether β1 is significantly different from 0
#In this case, if the lower limit of the [BCa] CL is bigger than zero, we can say that zero is not in the 95% [BCa] CL. Thus, β1 is significantly different from 0.

bootstrap.β1.sort[BCa.lower*1000]>0 # If this is TRUE, β1 is significantly different from 0, and vice versa.



#### Comparison of [percentile], [BC], and [BCa]


percentile <- c(bootstrap.β1.sort[25],bootstrap.β1.sort[975])
BC <- c(bootstrap.β1.sort[BC.lower*1000], bootstrap.β1.sort[BC.upper*1000])
BCa <- c(bootstrap.β1.sort[BCa.lower*1000], bootstrap.β1.sort[BCa.upper*1000])

Comparison.1 <- data.frame(percentile, BC, BCa)
rownames(Comparison.1) <- c("lower limit", "upper limit" )
Comparison.1




#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### --------------------------------------------------------------------------------------------------------------------------------------------------------


#### 2.
#### Bootstrap test whether significant difference exists
#### between the density of Oncaea venusta and Canthocalanus pauper,
#### using CI = (θ1 − θ2) and BCa.
#### (Assume each station is independent and use all 34 stations.)

#### Read data into R

composition <- read.table("~/R/copepod_composition.txt", header=T)
density <- read.table("~/R/cop_density.txt", header=F)
SPlist <- read.table("~/R/copepodSPlist.txt", header=F) # In order to process this data, I replaced all the space with dash.


#### Calculate the copepod density for each species for each cruise-station


density.t <- t(density) # transpose
density.each <- composition # use density as a frame to create a new data frame. Yet, in the following steps, all values in this data frame will be replaced.

for( i in 1:34){
  density.each[,i] <- density.t[1,i]*composition[,i]*0.01
}


#### Select the rows we need for Oncaea venusta (Ov) and Canthocalanus pauper (Cp)

Ov.index <- which(SPlist == "Oncaea_venusta")
Ov.index
Cp.index <- which(SPlist == "Canthocalanus_pauper")
Cp.index

Ov <- density.each[Ov.index,] # Oncaea venusta
names(Ov) = NULL
Ov
Cp <- density.each[Cp.index,] # Canthocalanus pauper
names(Cp) = NULL
Cp

Ov.mean <- mean(as.numeric(Ov))
Cp.mean <- mean(as.numeric(Cp))



#### [bootstrap] Oncaea venusta (Ov) and Canthocalanus pauper (Cp)

# Oncaea venusta (Ov) -------------------------------------------------------------------------
Ov.bootstrap.means <- c() # set a vector to put the following sampling results
for (i in 1:999) {
  random <- ceiling(runif(34, min=0, max=34)) # length(Ov) =  length(Cp) = 34
  Ov.bootstrap.i <- Ov[random] # single sampling result
  Ov.bootstrap.means[i] <- mean(as.numeric(Ov.bootstrap.i)) # put every mean of every single result into the vector I've created
}
Ov.bootstrap.means <- append(Ov.bootstrap.means, Ov.mean) # add the mean calculated by normal theory (total:1000)

# Canthocalanus pauper (Cp) -------------------------------------------------------------------------
Cp.bootstrap.means <- c() # set a vector to put the following sampling results
for (i in 1:999) {
  random <- ceiling(runif(34, min=0, max=34)) # length(Cp) =  length(Cp) = 34
  Cp.bootstrap.i <- Cp[random] # single sampling result
  Cp.bootstrap.means[i] <- mean(as.numeric(Cp.bootstrap.i)) # put every mean of every single result into the vector I've created
}
Cp.bootstrap.means <- append(Cp.bootstrap.means, Cp.mean) # add the mean calculated by normal theory (total:1000)




#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [percentile]

#### [percentile] CL of Oncaea venusta (Ov) and Canthocalanus pauper (Cp)

# Oncaea venusta (Ov) -------------------------------------------------------------------------
Ov.bootstrap.means.sort <- sort(Ov.bootstrap.means)
Ov.bootstrap.means.sort[25]
Ov.bootstrap.means.sort[975]

# Canthocalanus pauper (Cp) -------------------------------------------------------------------------
Cp.bootstrap.means.sort <- sort(Cp.bootstrap.means)
Cp.bootstrap.means.sort[25]
Cp.bootstrap.means.sort[975]


#As a result, the [percentile] CL of Oncaea venusta (Ov) is between "Ov.bootstrap.means.sort[25]" and "Ov.bootstrap.means.sort[975]".

#As a result, the [percentile] CL of Canthocalanus pauper (Cp) is between "Cp.bootstrap.means.sort[25]" and "Cp.bootstrap.means.sort[975]".

#### [percentile] whether Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are significant different
#As previous results showed, the CLs of Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are overlapped. Consequently, they are not significantly different.

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [BC]

#### [BC] CL of Oncaea venusta (Ov) and Canthocalanus pauper (Cp)

# Oncaea venusta (Ov) -------------------------------------------------------------------------
Ov.observe.index <- which(Ov.bootstrap.means.sort == Ov.mean) # The value we observed is not at the middle of bootstrap samples. Thus, we have to do bias correction.
Ov.observe.index.persentile <- Ov.observe.index/length(Ov.bootstrap.means.sort)
Ov.z0 <- qnorm(Ov.observe.index.persentile)

Ov.BC.lower <- pnorm(2*Ov.z0 - 1.96)
Ov.BC.upper <- pnorm(2*Ov.z0 + 1.96)

Ov.bootstrap.means.sort[Ov.BC.lower*1000]
Ov.bootstrap.means.sort[Ov.BC.upper*1000]


# Canthocalanus pauper (Cp) -------------------------------------------------------------------------
Cp.observe.index <- which(Cp.bootstrap.means.sort == Cp.mean) # The value we observed is not at the middle of bootstrap samples. Thus, we have to do bias correction.
Cp.observe.index.persentile <- Cp.observe.index/length(Cp.bootstrap.means.sort)
Cp.z0 <- qnorm(Cp.observe.index.persentile)

Cp.BC.lower <- pnorm(2*Cp.z0 - 1.96)
Cp.BC.upper <- pnorm(2*Cp.z0 + 1.96)

Cp.bootstrap.means.sort[Cp.BC.lower*1000]
Cp.bootstrap.means.sort[Cp.BC.upper*1000]



#As a result, the [BC] CL of Oncaea venusta (Ov) is between "Ov.bootstrap.means.sort[BC.lower x 1000]" and "Ov.bootstrap.means.sort[BC.upper x 1000]".
#As a result, the [BC] CL of Canthocalanus pauper (Cp) is between "Cp.bootstrap.means.sort[BC.lower x 1000]" and "Cp.bootstrap.means.sort[BC.upper x 1000]".

#### [BC] whether Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are significant different
#As previous results showed, the CLs of Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are overlapped. Consequently, they are not significantly different.

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## [BCa]

#### [BCa] CL of Oncaea venusta (Ov) and Canthocalanus pauper (Cp)

#### Calculate a by [Jackknife] 

# Oncaea venusta (Ov) -------------------------------------------------------------------------
Ov.Jackknife.means <- c() # set a vector to put the following sampling results

for (i in 1:length(Ov)) {
  Ov.Jackknife.i <- Ov[-i] # single sampling result
  Ov.Jackknife.means[i] <- mean(as.numeric(Ov.Jackknife.i)) # put every mean of every single result into the vector I've created
}

Ov.Jackknife.means.mean <- mean(as.numeric(Ov.Jackknife.means)) # mean of Jackknife means


Ov.sum.fractions <- 0
Ov.sum.numerator.pre <- 0


for (i in length(Ov.Jackknife.means)){
  Ov.sum.fractions <- Ov.sum.fractions + (Ov.Jackknife.means.mean - Ov.Jackknife.means[i]) ^ 3
  Ov.sum.numerator.pre <- Ov.sum.numerator.pre + (Ov.Jackknife.means.mean - Ov.Jackknife.means[i]) ^ 2
}

Ov.sum.numerator <- 6 * ( Ov.sum.numerator.pre^(3/2) )

Ov.a <- Ov.sum.fractions / Ov.sum.numerator

Ov.BCa.lower <- pnorm(   Ov.z0  +  (Ov.z0+1.96)/(1-Ov.a*(Ov.z0+1.96))   )
Ov.BCa.upper <- pnorm(   Ov.z0  +  (Ov.z0+1.96)/(1-Ov.a*(Ov.z0-1.96))   )

Ov.bootstrap.means.sort[Ov.BCa.lower*1000]
Ov.bootstrap.means.sort[Ov.BCa.upper*1000]



# Canthocalanus pauper (Cp) -------------------------------------------------------------------------
Cp.Jackknife.means <- c() # set a vector to put the following sampling results

for (i in 1:length(Cp)) {
  Cp.Jackknife.i <- Cp[-i] # single sampling result
  Cp.Jackknife.means[i] <- mean(as.numeric(Cp.Jackknife.i)) # put every mean of every single result into the vector I've created
}

Cp.Jackknife.means.mean <- mean(as.numeric(Cp.Jackknife.means)) # mean of Jackknife means


Cp.sum.fractions <- 0
Cp.sum.numerator.pre <- 0


for (i in length(Cp.Jackknife.means)){
  Cp.sum.fractions <- Cp.sum.fractions + (Cp.Jackknife.means.mean - Cp.Jackknife.means[i]) ^ 3
  Cp.sum.numerator.pre <- Cp.sum.numerator.pre + (Cp.Jackknife.means.mean - Cp.Jackknife.means[i]) ^ 2
}

Cp.sum.numerator <- 6 * ( Cp.sum.numerator.pre^(3/2) )

Cp.a <- Cp.sum.fractions / Cp.sum.numerator

Cp.BCa.lower <- pnorm(   Cp.z0  +  (Cp.z0+1.96)/(1-Cp.a*(Cp.z0+1.96))   )
Cp.BCa.upper <- pnorm(   Cp.z0  +  (Cp.z0+1.96)/(1-Cp.a*(Cp.z0-1.96))   )

Cp.bootstrap.means.sort[Cp.BCa.lower*1000]
Cp.bootstrap.means.sort[Cp.BCa.upper*1000]


#As a result, the [BCa] CL of Oncaea venusta (Ov) is between "Ov.bootstrap.means.sort[BCa.lower x 1000]" and "Ov.bootstrap.means.sort[BCa.upper x 1000]".
#As a result, the [BCa] CL of Canthocalanus pauper (Cp) is between "Cp.bootstrap.means.sort[BCa.lower x 1000]" and "Cp.bootstrap.means.sort[BCa.upper x 1000]".

#### [BCa] whether Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are significant different
#As previous results showed, the CLs of Oncaea venusta (Ov) and Canthocalanus pauper (Cp) are overlapped. Consequently, they are not significantly different.


#### Comparison of [percentile], [BC], and [BCa]


Ov.percentile <- c(Ov.bootstrap.means.sort[25],Ov.bootstrap.means.sort[975])
Ov.BC <- c(Ov.bootstrap.means.sort[Ov.BC.lower*1000],Ov.bootstrap.means.sort[Ov.BC.upper*1000])
Ov.BCa <- c(Ov.bootstrap.means.sort[Ov.BCa.lower*1000],Ov.bootstrap.means.sort[Ov.BCa.upper*1000])

Cp.percentile <- c(Cp.bootstrap.means.sort[25],Cp.bootstrap.means.sort[975])
Cp.BC <- c(Cp.bootstrap.means.sort[Cp.BC.lower*1000],Cp.bootstrap.means.sort[Cp.BC.upper*1000])
Cp.BCa <- c(Cp.bootstrap.means.sort[Cp.BCa.lower*1000],Cp.bootstrap.means.sort[Cp.BCa.upper*1000])

Comparison.2 <- data.frame(Ov.percentile, Ov.BC, Ov.BCa, Cp.percentile, Cp.BC, Cp.BCa)
rownames(Comparison.2) <- c("lower limit", "upper limit" )
Comparison.2

