?runif
square.approx.Pi = function(trials) {
  xs = runif(trials, -1, 1)
  ys = runif(trials, -1, 1)
  in.circle = sum(xs^2 + ys^2 < 1)
  p.in.circle = in.circle / trials
  return(4 * p.in.circle)
}

square.approx.Pi(100000)
