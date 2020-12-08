getTreePOS=function(Tree) { # Get Parts of Speech (POS) labels from a Parse Tree
  POSPatt = "\\([^ (]+"
  POSLocs = gregexpr(POSPatt, Tree)
  POS     = gsub("\\(", "", unlist(regmatches(Tree, POSLocs)))
  attr(POS, "names")=NULL
  POS
}
