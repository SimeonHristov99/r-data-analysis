# Sign Test
# 1. Write down Ho, Ha, and alpha.
# 2. For each sample determine the size of the difference between the
# values in the two features. Ignore zeros.
# 3. Count the two groups of signs.
# 4. The the maximum.
# 5. Look up the value in the table.
# 6. Reject or fail to reject the null hypothesis.

# Ho = There is no difference.
# Ha = There is a difference.
# alpha = 0.05 => 95% confident.
rm(list=ls())

?sleep
sleep

gr1 = sleep$extra[1:d]
gr2 = sleep$extra[(d+1):(d*2)]
diffs = gr1 - gr2
gr1;gr2;diffs

df <- data.frame(gr1, gr2, diffs)
df

df <- subset(df, diffs != 0)
x <- sum(df$diffs > 0)
x

n <- length(df$diffs)
n

?binom.test
binom.test(x, n, alternative = "two.sided")
