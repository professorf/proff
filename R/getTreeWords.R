getTreeWords=function(Tree)
{
  WordPatt = "[^ )]+\\)"
  WordLocs = gregexpr(WordPatt, Tree)
  Words    = gsub("\\)", "", unlist(regmatches(Tree, WordLocs)))
  attr(Words, "names")=NULL
  Words
}
