
#### "Homework 3"
#### "Yu-Jen Lin"
#### b04b01036@ntu.edu.tw
#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Q1
#### Calculate by hand to get the UPGMA and Neighbor-Joining (NJ) trees from the distance matrix showing below.
#### Confirm your result by R.

#### Load packages and import the data
library(ape)
library(cluster)
dd = matrix(c(0,17,21,27,   17,0,12,18,  21,12,0,14,  27,18,14,0), nrow = 4, ncol = 4) # matrix, not the distance matrix
rownames(dd) <- c("A","B","C","D")
colnames(dd) <- c("A","B","C","D")

#### Distance matrix
d1 = as.dist(dd)
d1

#### UPGMA
upgma.d1 = agnes(d1, diss = TRUE, method = "average")
plot(upgma.d1, which.plots = 2, hang = -1) # hang = -1 : all the branch lengths are the same

#### Neighbor-Joining (NJ)
nj.d1 <- nj(d1)
nj.d1

plot(nj.d1) # NJ -> having different branch lengths. Thud don't need to use "hang = -1".


#### --------------------------------------------------------------------------------------------------------------------------------------------------------

## Q3
#### Run the R code from the practice and show your neighbor-joining (NJ) network with branch reliabilities according to 500 times of bootstrapping.

#### Data - woodmouse
library(ape)
data(woodmouse) # The full data set is available through GenBank (accession numbers AJ511877 to AJ511987 woodmouse)
woodmouse

alview(woodmouse) # see the alignments


#### Distance-based method
wm.dist = dist.dna(woodmouse, model = "raw", pairwise.deletion = TRUE) # No. of mismatch -> distance 
## pairwise-> delete all N ## Because some of the sequences are substantially incomplete, we use the option pairwise.deletion = TRUE
## model = "K80" -> K2P
wm.dist


#### Neighbor-Joining (NJ)
# NJ
nj.wm <- nj(wm.dist)
nj.wm

plot(nj.wm) # NJ -> having different branch lengths. Thud don't need to use "hang = -1".

#### Run boostrap
f = function(x) nj(dist.dna(x)) # distance and trees
tr = f(woodmouse) # tr: original tree

nj.boot.wm <- boot.phylo(tr, woodmouse, f, 500) 
## tr: the original tree that we used to do 500 times of bootstrapping
## woodmouse: dataset for random sampling  
## 500 times of bootsrapping
nj.boot.wm # The numbers marked on the nodes: The propotion that the branch keeps in the same shape when doning the bootstrapping.

# plot the results
## label.offset = 0.001 -> the position of the texts
## default adj=c(0.5, 0.5), horizontal and vertical adjustment of the lables
## The scale indicates the number of amino acid changes per site.
plot(nj.wm, label.offset = 0.001) 
nodelabels(round(nj.boot.wm/500, 2), adj = c(1, -0.7) , bg = "white", frame = "none", cex = 0.8)



