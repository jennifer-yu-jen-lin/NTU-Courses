### HOMEWORK 1 ###
rm(list = ls())

setwd("~/Desktop/Taïwan/Cours/Computer statistics/1")

cop_density <- read.table("~/Desktop/Taïwan/Cours/Computer statistics/1/cop_density.txt", header = T, sep = "\t")
copepod1 <- read.table("~/Desktop/Taïwan/Cours/Computer statistics/1/copepod_composition.txt", header = T, sep = "\t")

rownames(cop_density) <- colnames(copepod1) #creating better names for the rows 

### 1: Calculate the copepod density for each species for each cruise-station

for (i in 1:34) {
  copepod1[,i] <- (copepod1[,i]/100)*cop_density[i,1] # loop to get the density of each species at each station
  }

copepod1 #table with the density of each species (number/m3)

## 2: For each cruise-station, calculate the species richness (number of species) and Shannon diversity index

copepod2 <- read.table("~/Desktop/Taïwan/Cours/Computer statistics/1/copepod_composition.txt", header = T, sep = "\t")
cop_density$richness <- 0 # new column with the number of species/station

# function to fill the richness column
for (j in 1:34) {
  for (i in 1:181){
    if (copepod2[i,j] != 0) { 
      cop_density$richness[j] <- (cop_density$richness[j] +1) # whenever there is a spieces in the station, the richness of the station gains +1
  }}}

cop_density$shannon <- 0 # new column for the diversity (shannon index)

cop_density$shannon <- apply(copepod2/100,2,function(x){-sum(x*log(x), na.rm = TRUE)}) # using the apply function to calculate the shannon index 

cop_density

## 3: Find dominant species (species >=2% of total composition in any cruise-station) and calculate the average density for the spring, summer, and winter cruise for each dominant species.

dominant_species <- read.table("~/Desktop/Taïwan/Cours/Computer statistics/1/copepod_composition.txt", header = T, sep = "\t")
species <- data.frame((1:181)*0) # new table with only the species 
names(species) <- 'dominant_species'

for (i in 1:34){
  for (j in 1:181){
    if (species [j,1] != 1){ # test to see if the species hasn't already been proved dominant
  species [j,1] <- dominant_species[j,i] >= 2 # testing the species is dominant
    }}}

species$spring_density <- 0
species$summer_density <- 0
species$winter_density <- 0 # creating new columns for the density of the dominant species

for (j in 1:nrow(species)) {
    species$spring_density [j] <- sum(copepod1[j,1:10])/10
    species$summer_density [j] <- sum(copepod1[j,11:25])/(15)
    species$winter_density [j] <- sum(copepod1[j, 26:34])/(9) # calculate the average density for the spring, summer, and winter cruise for each dominant species
  }

species <- species[-(which (species$dominant_species == 0)),]

species

### Notes ###

#I am not espacially good with R, I am used to using loops on python... I hope my skills will get better but for now, I am more confortable using loops than functions I do not know such as 'apply'

# CORRECTION 
# spec.richness <- colSums(copepod.com>0) 
# c.names <- colnames(copepod.composition)
# spring <- grep("p", c.names)
# for markdown install (knitr)
# use 'apply' function
# cop.density.e <- apply(copepod.composition, 1, function(x){cop.density*x})
# to transpose use 't(data)'





