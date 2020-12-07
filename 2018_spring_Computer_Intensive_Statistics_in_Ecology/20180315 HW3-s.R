


append(CopepodDensity.bootstrap.means, CopepodDensity.mean) # add the mean calculated by normal theory (total:1001)



x.bt  <- matrix(c(rep(1, times=n.bt), bootstrap.Copepod.i), nrow=n.bt, ncol=k.bt+1, byrow = FALSE)  # put the bootstrap sample into x.bt



FishDensity.bootstrap.means[i] <- mean(bootstrap.i) # put every mean of every single result into the vector I've created
}
append(FishDensity.bootstrap.means, FishDensity.mean) # add the mean calculated by normal theory (total:1001)
FishDensity.bootstrap.means.mean <- mean(FishDensity.bootstrap.means) # mean of bootstrap means
FishDensity.bootstrap.means.mean
FishDensity.bootstrap.means.SE <- var(FishDensity.bootstrap.means)^0.5/length(FishDensity.bootstrap.means)^0.5
FishDensity.bootstrap.means.SE
```






```{r}
LM <- lm(FishDensity~CopepodDensity)
confint(LM) # 95% CIs

combine <- data.frame(c(CopepodDensity, FishDensity), nrow=n, ncol=2, byrow = TRUE)
linearMod <- lm(FishDensity ~ CopepodDensity, data=combine)  # build linear regression model on full data
print(linearMod)

```