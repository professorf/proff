makeNodesUnique=function (TreeString) {
  # Extract unique node names
  NodeLocs=gregexpr("\\([^ ]+", TreeString)
  NumNodes=length(NodeLocs[[1]])
  Nodes=gsub("\\(","", unlist(regmatches(TreeString, NodeLocs)))
  UniqueNodes=unique(Nodes)

  # Make duplicate node names unique
  for (un in UniqueNodes) {
    # find and rename nodes until no duplicates rename, a unique node is still renamed {name}1
    i=1 # counter used to create a unique name
    FindPatt=sprintf("\\b%s\\b", un)
    while(grepl(FindPatt, TreeString)) {             # find node
      ReplPatt=sprintf("%s%d", un, i)                # replace it with a unique name
      TreeString=sub(FindPatt, ReplPatt, TreeString)
      i=i+1                                          # update counter
    }
  }
  TreeString
}
