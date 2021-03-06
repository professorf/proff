pareto=function(x, level) {
  total = sum(x)
  subtotal =0
  for (i in 1:length(x)) {
    subtotal=subtotal+x[i]
    subratio=subtotal/total
    if (subratio >= level) break;
  }
  i
}
