#### Homework 11
#### Yu-Jen Lin
#### b04b01036@ntu.edu.tw
#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### The von Bertalanffy Growth Function describes the body growth in length of most fish, i.e.

#### L(t)=L∞(1−exp(−K(t−t0)))e^ε       ε~N(0,σ2)
#### L∞ = hypothesized (mean) maximum length
#### K  = growth rate
#### t  = age
#### t0 = hypothesized age when body length is 0

#### Please estimate the three parameters using the method maximum likelihood for the average length-at-age for male and female Pacific Hake, respectively, considering a multiplicative error model with log-normal distribution.

## loading data

library(knitr)
library(ggplot2)

Age = c(1,2,3.3,4.3,5.3,6.3,7.3,8.3,9.3,10.3,11.3,12.3,13.3)
Length = c(15.4,28.03,41.18,46.2,48.23,50.26,51.82,54.27,56.98,58.93,59,60.91,61.83)

kable(cbind(Age, Length), col.names = c("Age (year)", "Female mean length (cm)"))


## Check the plot of [ Length ~ Age ]

dataset = data.frame(Age, Length) # combine the data
colnames(dataset) <- c("Age", "Length") # rename the columns for plotting
ggplot(dataset, aes(x = Age, y = Length)) +
  geom_point()


## VBGF

VBGF <-function(x, Linf, K, t0){
  y = Linf * (1 - exp(-K * (x - t0)))
  return(y)
}


## Log-likelihood function

lognormal_like = function(x, y, Linf, K, t0, Out){   # function(Linf,K,t0,Out){
  
  Like = numeric(length(y))
  NLL = numeric(length(y))
  ypred = VBGF(x, Linf, K, t0)
  Dev2 = (log(Length/ypred)) ^ 2
  sigma = sqrt(mean(Dev2))
  
  for (i in 1:length(Age)){ 
    Like[i] = (1 / (x[i] * sqrt(2 * pi) * sigma)) * exp(-Dev2[i] / (2 * sigma ^ 2))
    NLL[i] = -log(Like[i])
  }
  
  if(Out==T) cat(sum(NLL),Linf,K,t0,"\n")
  
  Outs <- NULL
  Outs$Pred <- ypred
  Outs$Length <- Length
  Outs$Dev2 <- Dev2
  Outs$sigma <- sigma
  Outs$Like <- Like
  Outs$NLL <- NLL 
  Outs$Obj <- sum(NLL)
  
  return(Outs)
}


## Objective function

obj_function = function(theda, ...){ 
  Outs <- lognormal_like(Linf = theda[1], K = theda[2], t0 = theda[3], ...)
  obj <- Outs$Obj 
  return(obj)
}


## MLE of parameters
### I try to optim the obj_function. I use this to find values of the parameters ( L(t)=L∞(1−exp(−K(t−t0)))e^ε ) that maximizes the likelihood function (=minimize negative log-likelihood function) for our regression model.

Model = optim(c(100, 0.2, 0), obj_function, x = Age, y = Length, Out = F, hessian = T)


## MLE results

# Print the likelihood value and predicted value based on the MLE estimates  
pars <- Model$par
Model_output <- lognormal_like(Age, Length, pars[1], pars[2], pars[3], Out=T)
print(Model_output)

sd <- sqrt(diag(solve(Model$hessian)))
Model_result <- cbind(pars, sd)
rownames(Model_result) <- c("L inf", "K", "t0")

kable(Model_result, col.names = c("Estimated parameters", "Standard deviation"), caption = "Model for female fish body length", digits = 3)


# MLE estimation and Experiment data
dataset = data.frame(Age, Length, VBGF(Age, pars[1], pars[2], pars[3]))
colnames(dataset) <- c("Age", "Actual length", "Esimated length")

ggplot(dataset, aes(x = Age)) +
  geom_point(aes(y = `Actual length`)) +
  geom_line(aes(y = `Esimated length`)) +
  labs(title = "Regression model using von Bertalanffy growth function", y = "Fish length")



