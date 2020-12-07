
  #### b04b01036@ntu.edu.tw
  #### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 1. Choose one of the results from the cluster analysis from your previous homework. Evaluate the cluster structure using one of the three nonparametric tests.
#### Apply your MRPP code to perform the nonparametric tests, then use built-in functions in Matlab or R to check your results.

#### Retrieve the dominant species from HW1

dominant = read.csv("~/R/dominant_HW1.csv",row.names = 1,header=T) # examples HW1
data = t(dominant)
data = data/sum(data) # get the propotion data
data.std = scale(data)   # each column -> standardize (z score) by columns


#### MRPP - my code

grp = c(rep(1,10),rep(2,15),rep(3,9)) # group them by seasons
dist.euclidean = dist(data.std,method='euclidean')
dist.euclidean
matrix.dist.eucl = as.matrix(dist.euclidean, header=T, rownames=T)
table.dist.eucl = as.data.frame(matrix.dist.eucl)

# average distance in each group
## grp1
grp1.sum = 0
start = 1
end = 10
for(i in start:end){
  for(j in start:end){
    grp1.sum = grp1.sum + table.dist.eucl[i,j]
  }
}
grp1.mean = grp1.sum / ((end-start+1)^2-(end-start+1)) # Althogh in this table, I have doubled the triangle matrix, I can still use the average to calculate the means. The value will be the same as a mean from single triangle matrix.

## grp2
grp2.sum = 0
start = 11
end = 25
for(i in start:end){
  for(j in start:end){
    grp2.sum = grp2.sum + table.dist.eucl[i,j]
  }
}
grp2.mean = grp2.sum / ((end-start+1)^2-(end-start+1)) 

## grp3
grp3.sum = 0
start = 26
end = 34
for(i in start:end){
  for(j in start:end){
    grp3.sum = grp3.sum + table.dist.eucl[i,j]
  }
}
grp3.mean = grp3.sum / ((end-start+1)^2-(end-start+1)) 

# This result is exactly the same as the result in build-in function.
grp1.mean
grp2.mean
grp3.mean

delta = grp1.mean*(10/34) + grp2.mean*(15/34) + grp3.mean*(9/34)

#####################################################################################

permutation.result <- c()
for (x in 1:999){
  # permutation
  grp_sample = sample(grp,replace = F)
  grp_sample
  
  # average distance in each group
  ## grp1.permu
  grp1.permu.sum = 0
  
  for(i in which(grp_sample==1)){
    for(j in which(grp_sample==1)){
      grp1.permu.sum = grp1.permu.sum + table.dist.eucl[i,j]
    }
  }
  grp1.permu.mean = grp1.permu.sum / 90
  
  ## grp2.permu
  grp2.permu.sum = 0
  
  for(i in which(grp_sample==2)){
    for(j in which(grp_sample==2)){
      grp2.permu.sum = grp2.permu.sum + table.dist.eucl[i,j]
    }
  }
  grp2.permu.mean = grp2.permu.sum / 90
  
  ## grp3.permu
  grp3.permu.sum = 0
  
  for(i in which(grp_sample==3)){
    for(j in which(grp_sample==3)){
      grp3.permu.sum = grp3.permu.sum + table.dist.eucl[i,j]
    }
  }
  grp3.permu.mean = grp3.permu.sum / 90
  
  delta.permu = grp1.permu.mean*(10/34) + grp2.permu.mean*(15/34) + grp3.permu.mean*(9/34)
  
  permutation.result[x] <- delta.permu
}

hist(permutation.result,xlim=c(5,15))
abline(v=7, col="red")

# significantly different


#### MRPP - build-in

library(vegan)
mrpp(dat = dist.euclidean, grouping = grp)

# The result is the same as the result derived from my own codes.





#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 2. Use one of the results from the cluster analysis of your previous homework to perform discriminant analysis (DA). Describe 1) whether your data meet the requirement for doing DA, and, 2) if so, which species are most distinct among the clusters.


#Discriminant analysis

y = data
grp = c(rep(1,10),rep(2,15),rep(3,9)) # group them by seasons

library(boot) 
library(energy) 
library(MASS) 
library(vegan) 
library(nortest)

#check equal variance assumption; decide if need to transform data
# diff in variable in diff group
par(mfrow=c(4,5))
boxplot(data[,1]~grp,data = y)  
boxplot(data[,2]~grp,data = y)  
boxplot(data[,3]~grp,data = y)  
boxplot(data[,4]~grp,data = y)  
boxplot(data[,5]~grp,data = y)  
boxplot(data[,8]~grp,data = y)  
boxplot(data[,10]~grp,data = y)  
boxplot(data[,11]~grp,data = y)  
boxplot(data[,12]~grp,data = y)  
boxplot(data[,13]~grp,data = y)  
boxplot(data[,14]~grp,data = y) 
boxplot(data[,15]~grp,data = y)  
boxplot(data[,16]~grp,data = y)  
boxplot(data[,17]~grp,data = y)  
boxplot(data[,20]~grp,data = y)  
boxplot(data[,23]~grp,data = y)  
boxplot(data[,25]~grp,data = y)  
boxplot(data[,27]~grp,data = y)  
boxplot(data[,29]~grp,data = y)  
boxplot(data[,33]~grp,data = y) 

#check for normality
## most of them are not normal distribution
par(mfrow=c(1,3))
hist(data[,1][1:10])   
hist(data[,1][11:25])
hist(data[,1][26:34])
par(mfrow=c(1,3))
hist(data[,4][1:10])   
hist(data[,4][11:25])
hist(data[,4][26:34])
par(mfrow=c(1,3))
hist(data[,16][1:10])   
hist(data[,16][11:25])
hist(data[,16][26:34])
par(mfrow=c(1,3))
hist(data[,30][1:10])   
hist(data[,30][11:25])
hist(data[,30][26:34])


#check for multicollinearity
as.dist(cor(y))   

#go through each variable and drop variables with small F values
f_values <- c()
for (i in 1:34){
  f <- summary(aov(data[,i]~as.factor(grp)))   
  f_values[i] <- f[[1]]$F[1]
}
f_values

chosen_variables <- which(f_values>0.6) 
chosen_variables
# Because there are too many variables, thus I set a higher threshold.
chosen_variables.10 <- which(f_values>10)
chosen_variables.10

pairs(y[,chosen_variables.10])    #check linearity among variables

#Variable selection
y.mat = as.matrix(y) 
summary(lm(y.mat~as.factor(grp)))  #justify variables on statistical and ecological grounds

#Derive discriminant functions
y.lda<-lda(y,grouping=grp) 
y.lda 

#Assessing the importance of the canonical functions
y.lda$svd   #svd^2 gives eigenvalues
y.lda$svd^2/sum(y.lda$svd^2)    #relative magnitude of eigenvalue
y.lda.pred = predict(y.lda)   #classification based on DA
y.lda.pred 
scores = y.lda.pred$x
summary(lm(scores~as.factor(grp)))   #R^2 gives squared canonical correlation coef

x = as.data.frame(cbind(grp,scores))   #visually inspect group difference in canonical scores
boxplot(LD1~grp,data = x,notch=TRUE,varwidth=TRUE)

y.table = table(grp,y.lda.pred$class)   #classification table
y.table
sum(diag(y.table))/sum(y.table)   #correct classification rate


# use jackknife to create... to ...the fresh resuls/?
#### [Jackknife] mean and stand error of the mean

y.Jackknife.means <- c() # set a vector to put the following sampling results

for (i in 1:length(y)) {
  y.Jackknife.i <- y[-i] # single sampling result
  y.Jackknife.means[i] <- mean(y.Jackknife.i) # put every mean of every single result into the vector I've created
}

y.Jackknife.means.mean <- mean(y.Jackknife.means) # mean of Jackknife means
y.Jackknife.means.mean
y.Jackknife.means.SE <- var(y.Jackknife.means)^0.5

# calculate SE
sum.F = 0
for (i in 1:length(y)) {
  sum.F.i <- (y.Jackknife.means[i] - y.Jackknife.means.mean)^2
  sum.F <- sum.F + sum.F.i
}
y.Jackknife.means.SE <-(sum.F*(34-1)/34) ^ 0.5
y.Jackknife.means.SE







#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 3. Use the “dominant” copepod species data (from HW1). Perform CART of stations based on percent composition data of the dominant species, and tell your story about these copepod data. You can use also the environmental data if you wish.
#### You are allowed to use whatever built-in functions in Matlab or R, such as classregtree.m.

#### CART


library(rpart)
y = data.frame(y)

z = rpart(grp~.,data=y,method='class',parms=list(split='gini')) # regression

# z = cart(grp~.,data=y,method='class',parms=list(prior=c(.33,.33,.34),split='gini'))  #specify prior

z
summary(z)

plot(z,margin=0.1)

text(z)

1-sum(residuals(z)^2)/sum((grp-mean(grp,na.rm=T))^2,na.rm=T)
plotcp(z)

#Tree prune
# choose the one that its SE first touches the minimun error.
z = rpart(grp~.,data=y,method='class',parms=list(split='gini'),cp=.001) 


cp1 = numeric(50)
for(i in 1:50){
  z = rpart(grp~.,data=y,method='class',parms=list(split='gini'),cp=.001) 
  a = data.frame(printcp(z))
  b = which.min(a[,4])
  cp1[i] = a[b,1]
}
cp1

plotcp(z)

y = numeric(50)+1
t = cbind(cp1,y)
xtabs(y~cp1,t)

zp = prune.rpart(z,0.00373)
plot(zp,margin=0.1)
text(zp)




