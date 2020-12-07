## Homework 8
## Yu-Jen Lin
## B04B01036@ntu.edu.tw

## 1. Simulate Nt+1 = Nt + r*Nt*(1-Nt/K) using K=500, N0=100, r=1.8, 2.3, 2.45, 2.56, 2.8. 
## Compare the results
# N0 = 100
plot_simulation <- function(r,Nt1_1){
  
  Nt1 = c()
  Nt1[1] = Nt1_1
  K = 500
  time_series = 1:50
  
  for (i in 1:49){
    Nt1[i+1] = Nt1[i] + r*Nt1[i]*(1-Nt1[i]/K)
  }
  plot(time_series, Nt1, type="l", xlim=range(0:50), ylim=range(0:600), col=4, xlab="time", ylab="N", main=paste0("N0 = ", Nt1[1], ",   r = ", r)) 
}

## r = 1.8
## 1 state
plot_simulation(1.8, 100)
## r = 2.3
## 2 states
plot_simulation(2.3, 100)
## r = 2.45
## 4 states
plot_simulation(2.45, 100)
## r = 2.56
## 8 states
plot_simulation(2.56, 100)
## r = 2.8
## chaos
plot_simulation(2.8, 100)

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## 2. Try N0=101, and compare with q1
## N0 = 100 v.s. 101
plot_simulation_2 <- function(r,Nt1_1, Nt2_1){
  
  Nt1 = c()
  Nt2 = c()
  Nt1[1] = Nt1_1
  Nt2[1] = Nt2_1
  K = 500
  time_series = 1:50
  
  for (i in 1:49){
    Nt1[i+1] = Nt1[i] + r*Nt1[i]*(1-Nt1[i]/K)
    Nt2[i+1] = Nt2[i] + r*Nt2[i]*(1-Nt2[i]/K)
  }
  plot(time_series, Nt1, type="l", xlim=range(0:50), ylim=range(0:600),
       col=4, xlab="time", ylab="N", main=paste0("N = ", Nt1_1,",",Nt2_1, ",   r = ", r)) 
  lines(time_series, Nt2, col="green", lty = 3)
}

# N0 = 100 v.s. 101
## r = 1.8
## 1 state
plot_simulation_2(1.8, 100, 101)
## r = 2.3
## 2 states
plot_simulation_2(2.3, 100, 101)
## r = 2.45
## 4 states
plot_simulation_2(2.45, 100, 101)
## r = 2.56
## 8 states
plot_simulation_2(2.56, 100, 101)
## r = 2.8
## chaos (N=100 v.s. N=100 -> different chaos patterns)
plot_simulation_2(2.8, 100, 101)

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## 3. Plot time step 1 return map for r=1.8, 2.3, 2.45, 2.56, 2.8
plot_ReturnMap <- function(r){
  K = 500
  Nt = c()
  Nt[1] = 1
  for (i in 1:1000) {
    Nt[i+1] = Nt[i]+r*Nt[i]*(1-(Nt[i]/K))
    if(Nt[i+1]<=0){
      break }}
  # prepare for ploting
  s = 0:1000
  eq = function(x){x+r*x*(1-(x/K))}
  # Nt versus Nt+1
  plot(Nt[1:999], Nt[2:1000], type = "s" ,xlab = "Nt", ylab = "Nt+1",
       xlim = range(0:1000), ylim = range(0:1000), col="blue")
  par(new=T)
  plot(eq(1:1000), type='l', col="green", xaxt='n', yaxt='n', ann=FALSE,
       xlim = range(0:1000), ylim = range(0:1000))
  lines(s, s, col="red")
}

## r = 1.8
plot_ReturnMap(r=1.8)
## r = 2.3
plot_ReturnMap(r=2.3)
## r = 2.45
plot_ReturnMap(r=2.45)
## r = 2.56
plot_ReturnMap(r=2.56)
## r = 2.8
plot_ReturnMap(r=2.8)

#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## 4. Make bifurcation diagram
K = 500
r_range = seq(1.8, 3, by = 0.01)
time_series = 1:600
Nt = 100
for(r in r_range){
  
  Nt_1 = c()
  for (i in time_series){
    Nt_1[i] = Nt + r*Nt*(1-Nt/K)
    Nt = Nt_1[i]
  }
  
  r_vector = c()
  r_vector[1:100] = r
  plot(r_vector, Nt_1[501:600], xlim=range(1.8:3), pch=16,cex=.2,
       xaxt='n', yaxt='n', ann=FALSE)
  par(new=T)
}
plot(r_vector, Nt_1[501:600], xlim=range(1.8:3), pch=16,cex=.2,
     xlab='Intrisic growth rate, r', ylab='Population size') # plot the last screen again to get the axes
