# My graph tree function
createParentChildEdges=function(Tree, Edges) { # Tree: (parent child+) structure returned by parse_annotator
  TreeLen=nchar(Tree) # Number of characters in the tree string
  iParse = 1          # Current character position of parser
  #
  # Get parent label
  #
  LabelPatt="^[^ )]+"
  ParentMatch=gregexpr(LabelPatt, Tree)                               # guaranteed to return 1
  ParentLabel=substr(Tree, 2, attr(ParentMatch[[1]], "match.length"))

  iParse=iParse+attr(ParentMatch[[1]], "match.length") # Move past Parent Label (usual space)

  #
  # Now get child labels and trees
  #
  ChildNames    = c() # Names of all children, if tree then root name
  ChildTreeList = c() # Some children are themselves strings, this holds them
  repeat {
    ChildString=substr(Tree, iParse, TreeLen) # Get the current substring
    Char=substr(ChildString, 1, 1)            # Get character at first  position
    if (Char==")") break
    if (Char==" ") {
      iParse=iParse+1
      next
    }

    ChildMatch=gregexpr(LabelPatt, ChildString)

    if (Char!="(") { # child is a label not a tree
      ChildLen=attr(ChildMatch[[1]], "match.length")
      ChildLabel=substr(ChildString, 1, ChildLen)
    } else {         # child is a tree
      ChildLabel=substr(ChildString, 2, attr(ChildMatch[[1]], "match.length"))
      ChildTree=substr(ChildString, 1, 1) # a guaranteed parentheses
      OpenPNum=1                          # Open parentheses num. — when zero, at end of tree
      ChildLen=1
      while (OpenPNum!=0) {
        ChildLen=ChildLen+1
        Char=substr(ChildString, ChildLen, ChildLen)
        ChildTree=sprintf("%s%s", ChildTree, Char)
        if (Char=="(") OpenPNum=OpenPNum+1
        if (Char==")") OpenPNum=OpenPNum-1
      }
      ChildTreeList=c(ChildTreeList,c(child=ChildTree)) # Collect the child trees
    }
    ChildNames=c(ChildNames, ChildLabel) # collect the child labels
    iParse=iParse+ChildLen
  }
  # print(sprintf("# Child Trees: %s", length(ChildTreeList)))

  # Add edges from parent to children
  for (ch in ChildNames) { # append to global edges
    assign(Edges, rbind(get(Edges, envir=.GlobalEnv), c(from=ParentLabel, to=ch)), envir=.GlobalEnv)
  }

  # Recursively call function for children that are trees
  for (ct in ChildTreeList) {
    # print(sprintf("Recursing with: %s", ct))
    createParentChildEdges(ct, Edges)
  }
}
