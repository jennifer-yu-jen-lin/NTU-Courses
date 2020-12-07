
  #### b04b01036@ntu.edu.tw
  #### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Use the data provided (modeldata.txt). The first two columns are x1 and x2, the column 3 to 5 represent codings for three class (y).

#### Loading package and data
# 5 hidden neurons

library(neuralnet)
library(NeuralNetTools)

rawdata <- read.table("~/Desktop/modeldata.txt")

X <- as.matrix(cbind(1, rawdata[, 1:2]))
Y <- as.matrix(rawdata[, 3:5])

head(X)
head(Y)

Neuralnet <- neuralnet(Y[,1] + Y[,2] + Y[,3] ~ X[,1] + X[,2], data = rawdata, hidden = 5)

plot(Neuralnet)

# Red lines: positive weights
# Blue lines: negative weights
plotnet(Neuralnet, pos_col = "red", neg_col = "blue", alpha_val = 0.5)  


#### Ativation function - tanh

# use tanh as my activation function
derivative_tanh <- function(x) {1 - tanh(x)^2}  # derivative of tanh(x)


## Write your own MLP. Use off-line learning, learning rate=0.001, learning time=1000 step, # of hidden neuron=5, use tanh as your activation function. Plot MSE vs learning steps. Calculate the min(MSE) and associated optimal weights.
# (NOTE: you should try different initial conditions several times to check whether you get trapped in the local minimum.)

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

# [First try] learning rate = 0.001, learning time = 1000 steps
#### Initially, I use the value given by professor to do the following calculation. Yet, I found this setting might not be so suitable for this data. As a result, I will use another initial conditions later.

#### Initial settings

n = 600  # data points
learning_steps <- 1000  # number of learning step
learning_rate <- 0.001  # learning rate

# Need to add bias term.


#### 

# hidden unit value
a <- matrix(0, nrow=n, ncol=2)  # hidden neuron 1
b <- matrix(0, nrow=n, ncol=2)  # hidden neuron 2
c <- matrix(0, nrow=n, ncol=2)  # hidden neuron 3
d <- matrix(0, nrow=n, ncol=2)  # hidden neuron 4
e <- matrix(0, nrow=n, ncol=2)  # hidden neuron 5

# coefficient 1
a1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 1, unit 1
b1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 2, unit 1
c1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 3, unit 1
d1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 4, unit 1
e1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 5, unit 1

# coefficient 2
a2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 1, unit 2
b2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 2, unit 2
c2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 3, unit 2
d2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 4, unit 2
e2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 5, unit 2

# final output weights
f1 <- matrix(0, nrow=learning_steps, ncol=2+1)
f2 <- matrix(0, nrow=learning_steps, ncol=2+1)
f3 <- matrix(0, nrow=learning_steps, ncol=2+1)

# final output
y.result <- matrix(0, nrow=learning_steps, ncol=3)



#### Calculating MSE

# mse
mse = matrix(0, nrow=learning_steps, ncol=3)

# set initial values
a1[1, ] = runif(3, -0.5, 0.5)
b1[1, ] = runif(3, -0.5, 0.5)
c1[1, ] = runif(3, -0.5, 0.5)
d1[1, ] = runif(3, -0.5, 0.5)
e1[1, ] = runif(3, -0.5, 0.5)

a2[1, ] = runif(3, -0.5, 0.5)
b2[1, ] = runif(3, -0.5, 0.5)
c2[1, ] = runif(3, -0.5, 0.5)
d2[1, ] = runif(3, -0.5, 0.5)
e2[1, ] = runif(3, -0.5, 0.5)

f1[1, ] = runif(3, -0.5, 0.5)
f2[1, ] = runif(3, -0.5, 0.5)
f3[1, ] = runif(3, -0.5, 0.5)

# Now we compute MSE for step 1
a = tanh(X%*%cbind(a1[1, ], a2[1, ]))
b = tanh(cbind(1, a)%*%cbind(b1[1, ], b2[1, ]))
c = tanh(cbind(1, b)%*%cbind(c1[1, ], c2[1, ]))
d = tanh(cbind(1, c)%*%cbind(d1[1, ], d2[1, ]))
e = tanh(cbind(1, d)%*%cbind(e1[1, ], e2[1, ]))
y.result = tanh(cbind(1, e)%*%cbind(f1[1, ], f2[1, ], f3[1, ]))

mse[1, ] = diag(t(Y - y.result)%*%(Y - y.result))/n


#### Coefficients

for (i in 1:(learning_steps-1)) {
  a = tanh(X%*%cbind(a1[i, ], a2[i, ]))
  b = tanh(cbind(1, a)%*%cbind(b1[i, ], b2[i, ]))
  c = tanh(cbind(1, b)%*%cbind(c1[i, ], c2[i, ]))
  d = tanh(cbind(1, c)%*%cbind(d1[i, ], d2[i, ]))
  e = tanh(cbind(1, d)%*%cbind(e1[i, ], e2[i, ]))
  y.result = tanh(cbind(1, e)%*%cbind(f1[i, ], f2[i, ], f3[i, ]))
  
  mse[i, ] = diag(t(Y - y.result)%*%(Y - y.result))/n
  
  delta1 = derivative_tanh(cbind(1, e)%*%cbind(f1[i, ], f2[i, ], f3[i, ]))*(Y - y.result)
  delta2 = derivative_tanh(cbind(1, d)%*%cbind(e1[i, ], e2[i, ]))*
    (delta1%*%t(cbind(f1[i, ], f2[i, ], f3[i, ])[-1, ]))
  delta3 = derivative_tanh(cbind(1, c)%*%cbind(d1[i, ], d2[i, ]))*
    (delta2%*%t(cbind(e1[i, ], e2[i, ])[-1, ]))
  delta4 = derivative_tanh(cbind(1, b)%*%cbind(c1[i, ], c2[i, ]))*
    (delta3%*%t(cbind(d1[i, ], d2[i, ])[-1, ]))
  delta5 = derivative_tanh(cbind(1, a)%*%cbind(b1[i, ], b2[i, ]))*
    (delta4%*%t(cbind(c1[i, ], c2[i, ])[-1, ]))
  delta6 = derivative_tanh(X%*%cbind(a1[i, ], a2[i, ]))*
    (delta5%*%t(cbind(b1[i, ], b2[i, ])[-1, ]))
  
  f1[(i+1), ] = learning_rate*delta1[, 1]%*%cbind(1, e)/n + f1[i, ]
  f2[(i+1), ] = learning_rate*delta1[, 2]%*%cbind(1, e)/n + f2[i, ]
  f3[(i+1), ] = learning_rate*delta1[, 3]%*%cbind(1, e)/n + f3[i, ]
  
  e1[(i+1), ] = learning_rate*delta2[, 1]%*%cbind(1, d)/n + e1[i, ]
  d1[(i+1), ] = learning_rate*delta3[, 1]%*%cbind(1, c)/n + d1[i, ]
  c1[(i+1), ] = learning_rate*delta4[, 1]%*%cbind(1, b)/n + c1[i, ]
  b1[(i+1), ] = learning_rate*delta5[, 1]%*%cbind(1, a)/n + b1[i, ]
  a1[(i+1), ] = learning_rate*delta6[, 1]%*%X/n + a1[i, ]
  
  e2[(i+1), ] = learning_rate*delta2[, 2]%*%cbind(1, d)/n + e2[i, ]
  d2[(i+1), ] = learning_rate*delta3[, 2]%*%cbind(1, c)/n + d2[i, ]
  c2[(i+1), ] = learning_rate*delta4[, 2]%*%cbind(1, b)/n + c2[i, ]
  b2[(i+1), ] = learning_rate*delta5[, 2]%*%cbind(1, a)/n + b2[i, ]
  a2[(i+1), ] = learning_rate*delta6[, 2]%*%X/n + a2[i, ]
}



#### 

head(y.result)  # looks not resonable
plot(mse[, 1]) # MSE declines slowly, remaining in a high value,
plot(mse[, 2])
plot(mse[, 3])
plot(apply(mse, 1, sum)[-learning_steps], type='l', xlab='Step', ylab='MSE')


# In above figures, we can see that MSE are all very high when learning rate = 0.001, learning time = 1000 steps. In other words, this means the initial condition should be adjust. Consequently, I reset the initial condition and run above scripts again.


#### --------------------------------------------------------------------------------------------------------------------------------------------------------



# [Second try] learning rate = 0.5, learning time = 5000 steps
#### Try higher learning rate and bigger learning steps.

#### 

# adjust the initial condition
learning_steps = 5000
learning_rate = 0.5

# hidden unit value
a <- matrix(0, nrow=n, ncol=2)  # hidden neuron 1
b <- matrix(0, nrow=n, ncol=2)  # hidden neuron 2
c <- matrix(0, nrow=n, ncol=2)  # hidden neuron 3
d <- matrix(0, nrow=n, ncol=2)  # hidden neuron 4
e <- matrix(0, nrow=n, ncol=2)  # hidden neuron 5

# coefficient 1
a1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 1, unit 1
b1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 2, unit 1
c1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 3, unit 1
d1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 4, unit 1
e1 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 5, unit 1

# coefficient 2
a2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 1, unit 2
b2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 2, unit 2
c2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 3, unit 2
d2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 4, unit 2
e2 <- matrix(0, nrow=learning_steps, ncol=2+1)  # hidden neuron 5, unit 2

# final output weights
f1 <- matrix(0, nrow=learning_steps, ncol=2+1)
f2 <- matrix(0, nrow=learning_steps, ncol=2+1)
f3 <- matrix(0, nrow=learning_steps, ncol=2+1)

# final output
y.result <- matrix(0, nrow=learning_steps, ncol=3)



#### Calculating MSE

# mse
mse = matrix(0, nrow=learning_steps, ncol=3)

# set initial values
a1[1, ] = runif(3, -0.5, 0.5)
b1[1, ] = runif(3, -0.5, 0.5)
c1[1, ] = runif(3, -0.5, 0.5)
d1[1, ] = runif(3, -0.5, 0.5)
e1[1, ] = runif(3, -0.5, 0.5)

a2[1, ] = runif(3, -0.5, 0.5)
b2[1, ] = runif(3, -0.5, 0.5)
c2[1, ] = runif(3, -0.5, 0.5)
d2[1, ] = runif(3, -0.5, 0.5)
e2[1, ] = runif(3, -0.5, 0.5)

f1[1, ] = runif(3, -0.5, 0.5)
f2[1, ] = runif(3, -0.5, 0.5)
f3[1, ] = runif(3, -0.5, 0.5)

# Now we compute MSE for step 1
a = tanh(X%*%cbind(a1[1, ], a2[1, ]))
b = tanh(cbind(1, a)%*%cbind(b1[1, ], b2[1, ]))
c = tanh(cbind(1, b)%*%cbind(c1[1, ], c2[1, ]))
d = tanh(cbind(1, c)%*%cbind(d1[1, ], d2[1, ]))
e = tanh(cbind(1, d)%*%cbind(e1[1, ], e2[1, ]))
y.result = tanh(cbind(1, e)%*%cbind(f1[1, ], f2[1, ], f3[1, ]))

mse[1, ] = diag(t(Y - y.result)%*%(Y - y.result))/n


#### Coefficients

for (i in 1:(learning_steps-1)) {
  a = tanh(X%*%cbind(a1[i, ], a2[i, ]))
  b = tanh(cbind(1, a)%*%cbind(b1[i, ], b2[i, ]))
  c = tanh(cbind(1, b)%*%cbind(c1[i, ], c2[i, ]))
  d = tanh(cbind(1, c)%*%cbind(d1[i, ], d2[i, ]))
  e = tanh(cbind(1, d)%*%cbind(e1[i, ], e2[i, ]))
  y.result = tanh(cbind(1, e)%*%cbind(f1[i, ], f2[i, ], f3[i, ]))
  
  mse[i, ] = diag(t(Y - y.result)%*%(Y - y.result))/n
  
  delta1 = derivative_tanh(cbind(1, e)%*%cbind(f1[i, ], f2[i, ], f3[i, ]))*(Y - y.result)
  delta2 = derivative_tanh(cbind(1, d)%*%cbind(e1[i, ], e2[i, ]))*
    (delta1%*%t(cbind(f1[i, ], f2[i, ], f3[i, ])[-1, ]))
  delta3 = derivative_tanh(cbind(1, c)%*%cbind(d1[i, ], d2[i, ]))*
    (delta2%*%t(cbind(e1[i, ], e2[i, ])[-1, ]))
  delta4 = derivative_tanh(cbind(1, b)%*%cbind(c1[i, ], c2[i, ]))*
    (delta3%*%t(cbind(d1[i, ], d2[i, ])[-1, ]))
  delta5 = derivative_tanh(cbind(1, a)%*%cbind(b1[i, ], b2[i, ]))*
    (delta4%*%t(cbind(c1[i, ], c2[i, ])[-1, ]))
  delta6 = derivative_tanh(X%*%cbind(a1[i, ], a2[i, ]))*
    (delta5%*%t(cbind(b1[i, ], b2[i, ])[-1, ]))
  
  f1[(i+1), ] = learning_rate*delta1[, 1]%*%cbind(1, e)/n + f1[i, ]
  f2[(i+1), ] = learning_rate*delta1[, 2]%*%cbind(1, e)/n + f2[i, ]
  f3[(i+1), ] = learning_rate*delta1[, 3]%*%cbind(1, e)/n + f3[i, ]
  
  e1[(i+1), ] = learning_rate*delta2[, 1]%*%cbind(1, d)/n + e1[i, ]
  d1[(i+1), ] = learning_rate*delta3[, 1]%*%cbind(1, c)/n + d1[i, ]
  c1[(i+1), ] = learning_rate*delta4[, 1]%*%cbind(1, b)/n + c1[i, ]
  b1[(i+1), ] = learning_rate*delta5[, 1]%*%cbind(1, a)/n + b1[i, ]
  a1[(i+1), ] = learning_rate*delta6[, 1]%*%X/n + a1[i, ]
  
  e2[(i+1), ] = learning_rate*delta2[, 2]%*%cbind(1, d)/n + e2[i, ]
  d2[(i+1), ] = learning_rate*delta3[, 2]%*%cbind(1, c)/n + d2[i, ]
  c2[(i+1), ] = learning_rate*delta4[, 2]%*%cbind(1, b)/n + c2[i, ]
  b2[(i+1), ] = learning_rate*delta5[, 2]%*%cbind(1, a)/n + b2[i, ]
  a2[(i+1), ] = learning_rate*delta6[, 2]%*%X/n + a2[i, ]
}



#### 

head(y.result)  # looks quite good
# MSE declines faster and gets closer to zero than previous results.
plot(mse[, 1]) 
plot(mse[, 2])
plot(mse[, 3])
plot(apply(mse, 1, sum)[-learning_steps], type='l', xlab='Step', ylab='MSE')

# find the minimum MSE
min.mse <- which.min(apply(mse, 1, sum)[-learning_steps])

# compute the final codings with minimal MSE
S = tanh(X%*%cbind(a1[min.mse, ], a2[min.mse, ]))
H = tanh(cbind(1, a)%*%cbind(b1[min.mse, ], b2[min.mse, ]))
P = tanh(cbind(1, b)%*%cbind(c1[min.mse, ], c2[min.mse, ]))
Q = tanh(cbind(1, c)%*%cbind(d1[min.mse, ], d2[min.mse, ]))
R = tanh(cbind(1, d)%*%cbind(e1[min.mse, ], e2[min.mse, ]))
y.result = tanh(cbind(1, e)%*%cbind(f1[min.mse, ], f2[min.mse, ], f3[min.mse, ]))

# coefficients with minimal MSE
a1[min.mse, ]
b1[min.mse, ]
c1[min.mse, ]
d1[min.mse, ]
e1[min.mse, ]

a2[min.mse, ]
b2[min.mse, ]
c2[min.mse, ]
d2[min.mse, ]
e2[min.mse, ]

f1[min.mse, ]
f2[min.mse, ]
f3[min.mse, ]

# original data
y1 = ifelse(rawdata[, 3]==1, 1, 0)
y2 = ifelse(rawdata[, 4]==1, 2, 0)
y3 = ifelse(rawdata[, 5]==1, 3, 0)
y <- y1 + y2 + y3
plot(X[, -1], col=y, pch=19, xlab='', ylab='', main="Original data")

# Neuralnet data
y1 = ifelse(floor(y.result)[, 1]==0, 1, 0)
y2 = ifelse(floor(y.result)[, 2]==0, 2, 0)
y3 = ifelse(floor(y.result)[, 3]==0, 3, 0)
y <- y1 + y2 + y3

# Most of the data are correctly classify. But still, we can found that some points are classified into wrong classes in the upper-right corner.
plot(X[, -1], col=y, pch=19, xlab='', ylab='', main="Neuralnet data")


