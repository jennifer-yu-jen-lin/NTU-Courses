m <- c(     0,    0,     0,     0,     0, 322.38,
        0.966,    0,     0,     0,     0,      0,
        0.013, 0.01, 0.125,     0,     0,  3.448,
        0.007,    0, 0.125, 0.238,     0,  30.17,
        0.008,    0,     0, 0.245, 0.167,  0.862,
            0,    0,     0, 0.023,  0.75,      0)

M <- matrix(m,ncol=6, nrow=6, byrow=T)

M_eigen <- eigen(M)
values = M_eigen$values
vector = M_eigen$vectors
values_real = c()
index = c()
for (i in 1:length(values)){
  if (Im(values[i]) == 0){
    j = length(values_real)+1
    values_real[j] = Re(values[i])
    index[j] = i
  }
}

## population growth rate
eigenvalue = max(values_real)

## stable stage distribution
#### Report the values of the stable stage distribution (re-scale so that the sum = 1).
chosen = index[match(eigenvalue,values_real)]
pre_eigenvector = Re(vector[,chosen])
eigenvector = pre_eigenvector / sum(pre_eigenvector)



## relative reproductive value
#### Report the relative reproductive value for this population, scale the values so that the first element is 1.0.
M2 = t(M)

M_eigen <- eigen(M2)
values = M_eigen$values
vector = M_eigen$vectors
values_real = c()
index = c()
for (i in 1:length(values)){
  if (Im(values[i]) == 0){
    j = length(values_real)+1
    values_real[j] = Re(values[i])
    index[j] = i
  }
}
eigenvalue = max(values_real)
chosen = index[match(eigenvalue,values_real)]
pre_eigenvector = Re(vector[,chosen])
relative_repro = pre_eigenvector / sum(pre_eigenvector[1])

## sensitivity
#### Explore the sensitivity of the population growth rate to changes in this matrix. One by one, increase each non-zero element of the L matrix by 10% (i.e., A[i,j]*1.1). Report the new population growth rate in the following table. Be sure to change the element back before going on to the next element. Describe the two matrix elements (in terms of life histories) that caused the largest increase in population growth rate.
sensitivity = data.frame(matrix(0,dim(M)[1],dim(M)[2]))
for (r in 1:dim(M)[1]){ # rol
  for (c in 1:dim(M)[2]){ # col
    M3 = M
    if (M3[r,c] != 0){
      M3[r,c] = M3[r,c]*1.1
      
      M3_eigen <- eigen(M3)
      values = M3_eigen$values
      values_real = c()
      for (i in 1:length(values)){
        if (Im(values[i]) == 0){
          j = length(values_real)+1
          values_real[j] = Re(values[i])
        }
      }
      ## population growth rate
      sensitivity[r,c] = max(values_real)
    }
  }
}

# sensitivity(6,5) and sensitivity(4,6) cause the largest increase in population growth rate.

