
#### "Homework 15"
#### "Yu-Jen Lin"
  #### b04b01036@ntu.edu.tw
  #### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 1. Compute the regression coefficients for fish = β0+β1*copepod and use randomization method to generate null distribution of β1 and test whether β1 is significantly different from null (with randomization 5000 times). Report your p-value.

#### Loading package and data
library(ggplot2)

#### Read enviANDdensity.csv into R
enviANDdensity <- read.csv(file="~/Desktop/HW15_B04B01036/enviANDdensity.csv", header=TRUE)

# Because we only need the data in "FishDensity..ind..1000m3." and "CopepodDensity.ind..m3.", I take these two columns out and set as "FishDensity" and "CopepodDensity" separately.
FishDensity <- enviANDdensity$FishDensity..ind..1000m3.
CopepodDensity <- enviANDdensity$CopepodDensity.ind..m3.


#### Compute the β0 & β1 for 
#### fish(y) = β0 + β1 * copepod(x)

# (same as HW3)
y  <- matrix(FishDensity, nrow=length(FishDensity), ncol=1, byrow = TRUE) # put the original sample into y
x  <- matrix(c(rep(1, times=length(FishDensity)),CopepodDensity), nrow=length(FishDensity), ncol=2, byrow = FALSE)  # put the original sample into x

β1 <- solve(t(x) %*% x) %*% t(x) %*% y
β0 <- y - x %*% β1  # fish(y) = β0 + β1 * copepod(x)
β1


#### Randomization method to generate null distribution of β1
#### null hypothesis H0: β1=0
#### randomization 5000 times

randomization_times <- 5000
β1_null <- numeric()
for (i in 1:randomization_times) {
  random_order = order(runif(length(FishDensity)))
  #c alculate β1
  Y = FishDensity[random_order]
  X = cbind(1, CopepodDensity)
  b = solve(t(X) %*% X) %*% (t(X) %*% Y)
  β1_null = append(β1_null, b)
}
β1_null = t(matrix(β1_null, 2, randomization_times))


#### Plot the permutation results

# p-value (two tailed test) 
# I use absolute function to make sure that I take both tails into consideration.
p_value_1 = sum(abs(β1_null[, 2]) > abs(β1[2])) / randomization_times

# Plot the results
# Red lines are the β1 I the I just caluculated by matrix multiplication.
plot_1 <- ggplot(as.data.frame(β1_null[, 2]), aes(x = β1_null[, 2])) +
  geom_density(fill = "#999999", col = "#333333", alpha = 0.5) +
  geom_vline(xintercept = c(-β1[2], β1[2]), col = "red") +
  labs(title = "Permutation", x = "β1")
plot_1


#### Report the p-value
# We can reject the null hypothesis because the p-value is smaller than 0.05.
# Thus, we can say that β1 is significantly different from 0.

p_value_1 # The p-value of the test on H0: B1=0.



#### --------------------------------------------------------------------------------------------------------------------------------------------------------

#### 2. Randomization test whether significant difference exists between the density of Oncaea Venusta and Canthocalanus pauper. (Assume all data are independent and use all 34 stations.) Report your p-value.

#### Import data

copepod_composition <- read.table("~/Desktop/HW15_B04B01036/copepod_composition.txt", header = TRUE)
cop_density <- read.table("~/Desktop/HW15_B04B01036/cop_density.txt", header = TRUE)
copepodSPlist <- read.table("~/Desktop/HW15_B04B01036/copepodSPlist.txt")


#### Oncaea Venusta and Canthocalanus pauper
#Because we only need the data in "Oncaea Venusta" and "Canthocalanus pauper", I take these two columns out and set as "Oncaea_Venusta" and "Canthocalanus_pauper" separately.

# calculate copepod density for each species for each cruise station
copepod_composition <- copepod_composition / 100 # turn into percentage
copepod_composition_density_0 <- apply(copepod_composition, 1, function(x) x * cop_density[,1])
copepod_composition_density <- t(copepod_composition_density_0)

# Oncaea Venusta and Canthocalanus pauper
Oncaea_Venusta <- copepod_composition_density[  which (copepodSPlist[, 1] == "Oncaea_venusta"),  ]
Canthocalanus_pauper <- copepod_composition_density[  which (copepodSPlist[, 1] == "Canthocalanus_pauper") , ]


#### Randomization method to generate null distribution of θ1−θ2
#### null hypothesis H0: θ1−θ2=0
#### randomization 5000 times

randomization_times <- 5000

difference <- numeric(randomization_times)
for(i in 1:randomization_times){
  randomization <- c(rep(c(1, 2), 34))[order(runif(68))]
  data <- cbind(c(Oncaea_Venusta, Canthocalanus_pauper), randomization)
  group1 <- subset(data, randomization == 1)
  group2 <- subset(data, randomization == 2)
  difference[i] <-  mean(group1) - mean(group2)
}


#### Plot the permutation results

#calculate estimated difference between Oncaea Venusta and Canthocalanus pauper density
est_difference <- mean(Oncaea_Venusta) - mean(Canthocalanus_pauper)

#calculate p-value
p_value_2 <- sum(abs(difference) > abs(est_difference)) / randomization_times

# Plot the results
# Red lines are the difference of θ1−θ2 I the I just caluculated by matrix multiplication.
plot_2 <- ggplot(as.data.frame(difference), aes(x = difference)) +
  geom_density(fill = "#999999", col = "#333333", alpha = 0.5) +
  geom_vline(xintercept = c(-est_difference, est_difference), col = "red") +
  labs(title = "Permutattion", x = "θ1−θ2")

plot_2



#### Report the p-value
# We can reject the null hypothesis because the p-value is smaller than 0.05.
# Thus, we can say that significant difference does exist between the density of Oncaea Venusta and Canthocalanus pauper.

p_value_2 # The p-value of the test on H0: θ1−θ2=0.
