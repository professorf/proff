createParseTree=function(text, ann_tags) {
  pa=openNLP::Parse_Annotator()
  ptexts=pa(as.String(text), ann_tags)
  #ptexts=sapply(ptexts$features, "[[", "parse") # Them
  pt=sapply(ptexts$features, function(x) unlist(x)) # Me
  pt
}
