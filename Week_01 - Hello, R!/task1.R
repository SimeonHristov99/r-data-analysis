#?rnorm
#??rnorm

xi = rnorm(10000)

# par(mfrow=c(1,2)) # two plots next to each other (1 row, 2 cols)
#par(mfrow=c(1,1))
#hist(xi); boxplot(xi)
hist(xi)
hist(xi, probability = TRUE)
hist(xi, probability = TRUE, xlab = 'Simulated observation')
# curve(dnorm(x, mean(xi), sd(xi))) # creates a new plot
# curve(dnorm(x, mean(xi), sd(xi)), add=TRUE) # overlays
# curve(dnorm(x, mean(xi), sd(xi)), add=TRUE, col=2) # changes color
curve(dnorm(x, mean(xi), sd(xi)), add=TRUE, col=2, lwd=2) # changes line width

mean(xi)
median = median(xi)
madeviation = mad(xi)
madeviation
sd(xi)

cutoff = median + 3 * madeviation

pos = which(-cutoff < xi & xi < cutoff)
mean(xi); mean(xi[-pos])
