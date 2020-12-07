## barnacles Balanus glandula (Connell 1970)
x = seq(0,9) # age
lx = c(1.0000000, 0.0000620, 0.0000340, 0.0000200, 0.0000155, 0.0000110, 0.0000065, 0.0000020, 0.0000020, 0)
mx = c(0, 4600, 8700, 11600, 12700, 12700, 12700, 12700, 12700, 0)


lx_mx = lx*mx
R0 = sum(lx_mx) # net reproductive rate
x_lx_mx = x*lx*mx # generation time
G = sum(x_lx_mx) / R0
approximate_r = log(R0)/G # approximate r 

r = approximate_r

## lx_mx_e_rx
lx_mx_e_rx = lx_mx*exp(-r*x)


## Lx
Lx = c()
lx[11] = 0 # help me to calculate the last element, will be deleted after calculating Lx
max_i = length(lx)-1
for (i in (1:max_i)) {
 Lx[i] = ( lx[i] + lx[i+1] ) / 2 
}
lx = lx[-11] # return to original lx


## ex 
#### life expectancy
ex = c()
max_i = length(Lx)-1
for (i in (1:max_i)) {
  ex[i] = sum(Lx[i:length(Lx)]) / lx[i]
}


## Vx
#### reproductive value
r = approximate_r
max_i = length(lx)-1
Vx = c()
for (i in 1:max_i){
  Vx[i] = sum(lx_mx_e_rx[i:10])/(exp(-r*(i-1))*lx[i]) 
}


## true_r
r_try = seq(0, 1, by = 0.000001)
d_min = abs(approximate_r-1)
approximation = c()
for (i in r_try){
  equation_result = sum(exp(-i*x)*lx_mx)
  d = abs(equation_result-1) 
  if (d < d_min){
    true_r = i #0.084712
    d_min = d
  }
}



# re-calculating the lx*mx*e-rx and Vx with the true r.

## re-calculate lx_mx_e_rx
r = true_r # true r
lx_mx_e_rx_recal = lx_mx*exp(-r*x)

## calculate Vx
#### reproductive value
r = true_r
max_i = length(lx)-1
Vx_recal = c()
for (i in 1:max_i){
  Vx_recal[i] = sum(lx_mx_e_rx_recal[i:10])/(exp(-r*(i-1))*lx[i]) 
}


result_1 = cbind(x, lx, mx, lx_mx, x_lx_mx, lx_mx_e_rx, Lx, lx_mx_e_rx_recal)
age_range = seq(1,9)
result_2 = cbind(age_range, ex, Vx, Vx_recal)


