
####  "Homework 13"
#### "Yu-Jen Lin"
#### b04b01036@ntu.edu.tw
#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Assume t0 = 0 and sigma=0.032, please estimate the parameters of L∞ and K by using the method of Bayesian Grid Search for the average length-at-age data Pacific Hake, respectively, considering a multiplicative error model with log-normal distribution with the prior information of K~U[0.1,0.6] and L∞~U[40,100].

#### von Bertalanffy Growth Function (Considering a log-normal distribution)
#### L(t) = L∞ (1−exp(−k(t−t0))) * e^ε   ,   ε ~ N(0,σ^2)

#### L∞ : the hypothesized (mean) maximum length
####  K : growth rate
####  t : current age
#### t0 : the hypothesized age when body length is 0


## loading package and data

library(knitr)
library(ggplot2)

Age = c(1,2,3.3,4.3,5.3,6.3,7.3,8.3,9.3,10.3,11.3,12.3,13.3)
Length = c(15.4,28.03,41.18,46.2,48.23,50.26,51.82,54.27,56.98,58.93,59,60.91,61.83)

data = cbind(Age, Length)

kable(data, col.names = c("Age (year)", "Female mean length (cm)"))


## Check the plot of [ Length ~ Age ]

dataset = data.frame(Age, Length) # combine the data
colnames(dataset) <- c("Age", "Length") # rename the columns for plotting
ggplot(dataset, aes(x = Age, y = Length)) +
  geom_point()


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## likelihood section

VBGF <-function(x, Linf, K){
  y = Linf * (1 - exp(- K * (x - 0)))
  return(y)
}

lognormal_like = function(Linf, K){
  
  like = numeric(length(Length))
  LL = numeric(length(Length))
  ypred = VBGF(Age, Linf, K)
  Dev2 =(log(Length) - log(ypred)) ^ 2
  sigma = 0.032
  
  for (i in 1:length(Length)){
    like[i] = (1 / (Age[i] * sqrt(2 * pi) * sigma)) * exp(-Dev2[i] / (2 * sigma ^ 2))
    LL[i] = log(like[i])
  }
  
  tot_like = exp(sum(LL))
  return(tot_like)
}



#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Prior section (grid method)

# define the grid of each parameter
Linf_grid = seq(40, 100, length.out = 1000) # L∞ ~ U(40,100)
K_grid = seq(0.1, 0.6, length.out = 1000) # K ~ U(0.1,0.6)

# prior porbability
pLinf_grid = rep(1, length(Linf_grid))
pK_grid = rep(1, length(K_grid))
pTheta_matrix = expand.grid(Linf = pLinf_grid, K = pK_grid)

# expand the combination of grid 
Theta_matrix = expand.grid(Linf = Linf_grid, K = K_grid)

# Theta_matrix "Linf" "K"
head(Theta_matrix)


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Posterior section

# negtive likelihood values of each grid
pDataGivenTheta = mapply(lognormal_like, Theta_matrix[,1], Theta_matrix[,2]) # pop_model -> lognormal_like # likelihood

# Compute the posterior density
pData = sum(pDataGivenTheta * pTheta_matrix[, 1] * pTheta_matrix[, 2])
pThetaGivenData = (pDataGivenTheta * pTheta_matrix[, 1] * pTheta_matrix[, 2]) / pData

# arrange the results
RESULTs = cbind(Theta_matrix, pThetaGivenData)


## Plot the results of L∞ and K

par(mfrow=c(2,1),mar=c(4,4,2,2))

# calculate the marginal probability
marginal_Linf = with(RESULTs, tapply(pThetaGivenData, Linf, sum))
plot(Linf_grid, marginal_Linf, type = "h", lwd = 3, xlab = expression(L[infinity]), ylab = bquote(paste("p(", theta, "|D)"))) 

# calculate the marginal probability
marginal_K = with(RESULTs, tapply(pThetaGivenData, K, sum))
plot(K_grid, marginal_K, type = "h", lwd = 3, xlab = "K", ylab = bquote(paste("p(", theta, "|D)")))


## Compare Bayesian Grid Search with MLE

#### When we used the MLE in previous homework, we got:
#### Linf = 61.08735457
#### K = 0.30279632
#### Both are quite similar as the results in this homework because
#### 1) in prior distribution we used the uniform distribution and
#### 2) we used sigma = 0.032 to start, which is the same value of MLE results.



















