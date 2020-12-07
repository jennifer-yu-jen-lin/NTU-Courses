#### Homework 7
#### Yu-Jen Lin
#### b04b01036@ntu.edu.tw


# install.packages("deSolve")
library(deSolve)

# Simulate a 3 species food chain:

# fi(u)=ai*u/(1+bi*u)
# f1(x)=(a1*x/(1+b1*x))
# f2(y)=(a2*y/(1+b2*y))

LVmod = function(Time, State, Pars) {
  with(as.list(c(State, Pars)), { # distance in C language
    dx_dt=x*(1-x)-(a1*x/(1+b1*x))*y
    dy_dt=(a1*x/(1+b1*x))*y-(a2*y/(1+b2*y))*z-d1*y
    dz_dt=(a2*y/(1+b2*y))*z-d2*z
    return(list(c(dx_dt, dy_dt, dz_dt)))
  }) }

## ODE
# Usea1=5;b1=3.3;a2=0.1;b2=2;d1=0.4;d2=0.01
pars=c(a1=5, b1=3.3, a2=0.1, b2=2, d1=0.4, d2=0.01)
# Try initial condition:[x0,y0,z0]=[0.5,0.15,5]
yini = c(x=0.5, y=0.15, z=5)
times = seq(0, 1000, by = 1)
out = as.data.frame(ode(func = LVmod, y = yini, parms = pars, times = times))


## 1. Plot the x, y, and z time series
# Oscillation plot
matplot(out[,1], out[,2:4], type = "l", xlab = "time", ylab = "Abundance", # out[,1]=time
        main = "Lotka-Volterra", lwd = 2, col=c(4,3,2))
legend("topright", c("x", "y", "z"), col = c(4,3,2), lty = 1)


## 2. Plot the x, y, z phase diagram in 3-D
# install.packages("plot3D")
library(plot3D)
scatter3D(out[,2], out[,3], out[,4], type = "l", phi=25, theta=20)

