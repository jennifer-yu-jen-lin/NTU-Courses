### Homework 1
### Yu-Jen Lin
### b04b01036@ntu.edu.tw




# read data
composition <- read.table("~/R/copepod_composition.txt", header=T)
density <- read.table("~/R/cop_density.txt", header=F)




# 1 Calculate the copepod density for each species for each cruise-station
density.t <- t(density) # transpose
density.each <- density.t*composition*0.01

for( i in 1:34){
  density.each[,i] <- density.t[1,i]*composition[,i]*0.01
}

# 2 For each cruise-station, calculate the species richness (number of species) and Shannon diversity index
density.each.zero <- density.each>0
species.number <- apply(density.each.zero, MARGIN=2, FUN = sum)
species.number.correction <- species.number-1 # species richness (number of species)

density.sum <- sum(density.each)
density.propotion <- density.each/density.sum
Shannon <- density.propotion*log(density.propotion)
Shannon.sum <- apply(Shannon, MARGIN=2, FUN = sum, na.rm=TRUE)
Shannon.sum.positive <- Shannon.sum*-1 # Shannon diversity index




# 3 Find dominant species (species >=2% of total composition in any cruise-station) and calculate the average density for the spring, summer, and winter cruise for each dominant species.
density.propotion.sum <- apply(density.propotion, MARGIN=1, FUN = sum) # sum of each species
density.each.propotion.sum.add <- cbind(density.each,density.propotion.sum) # add it to the original table

dominant <- subset(density.each.propotion.sum.add, density.propotion.sum >= 0.02, select=c(1:35)) # collect the rows that are dominant species

springsum <- apply(dominant, MARGIN=1, FUN = sum, select=c(1:10) )
springavg <- springsum/10
summersum <- apply(dominant, MARGIN=1, FUN = sum, select=c(11:25) )
summeravg <- summersum/15
wintersum <- apply(dominant, MARGIN=1, FUN = sum, select=c(26:34) )
winteravg <- wintersum/9

avg <- cbind(springavg, summeravg, winteravg) #combining the average results
