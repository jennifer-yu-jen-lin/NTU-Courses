install.packages("qtl") # internet
library(qtl)
data(hyper) # sample dataset: 250 male mice, backcross, phenotype = blood pressure

# data summary
plot(hyper)
hyper$pheno #phenotype long table
geno.table(hyper) #genotype long table

plotPXG(hyper,"D4Mit214") # marker
plotPXG(hyper,"D12Mit20")
plotRF(hyper) #estimate and plot the pairwise recombinant fraction, r

# single marker analysis
out.mr = scanone(hyper, method="mr") #"mr" stands for "marker regression" # scanone 一次scan一個
summary(out.mr) # assume only one marker on each chromosome #只在每個chr上選最顯著的marker
summary(out.mr, threshold=3) # assume only one marker on each chromosome
plot(out.mr)
plot(out.mr, chr=c(4,12)) # LOD 
plot(out.mr, chr=c(4,12), type="h")

##########################################################################

# interval mapping: IM (Lander; EM) or RIM (Harley-Knott; H-K)
# step: distance (in cM) between positions at which the genotype probabilities are calculated
hyper = calc.genoprob(hyper, step=1)  # 1 sentimorgen? , interval unit, grid search
     
# IM (Lander; EM)
out.em = scanone(hyper, method="em")
head(out.em) # show step = 1 (start from the 1st marker)
out.em[1:30,]
plot(out.em)
plot(out.em, chr=c(4,12),col=2)
plot(out.mr,out.em, chr=c(4,12),col=1:2)
# permutation test for IM
hyper = calc.genoprob(hyper, step=1) # pos <=1 sentimorgen?
operm = scanone(hyper, method="em", n.perm=1000, verbose=FALSE) # verbose=FALSE: suppress output # n.perm = permutation 
summary(operm, alpha=c(0.20, 0.05))
summary(out.em, perms=operm, alpha=0.1)
summary(out.em, perms=operm, alpha=0.1, pvalues=TRUE)
     
# RIM (Harley-Knott; H-K)
hyper = calc.genoprob(hyper, step=1) 
out.hk = scanone(hyper, method="hk") # method預設值＝ＥＭ
plot(out.hk)
plot(out.em,out.hk, chr=c(4,12),col=1:2)
legend("topright",c("EM","HK"), col=1:2, lty=1)
operhk = scanone(hyper, method="hk", n.perm=1000, verbose=FALSE) # verbose=FALSE: suppress output
summary(out.hk, perms=operhk, alpha=0.1, pvalues=TRUE)
     
