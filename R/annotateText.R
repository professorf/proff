annotateText=function(text) {
  ann_sents = annotate(text, Simple_Sent_Token_Annotator(proff::tokenizeSentences))
  ann_words = annotate(text, Simple_Word_Token_Annotator(proff::tokenizeWords), ann_sents)
  ann_tags  = annotate(text, openNLP::Maxent_POS_Tag_Annotator(), ann_words)
  # ann_tags

  # All in one approach using built in annotators
  #ann_tags = annotate(text, list(Maxent_Sent_Token_Annotator(), Maxent_Word_Token_Annotator(), Maxent_POS_Tag_Annotator()))
  #ann_tags

  # Annotate original
  WordRows = which(ann_tags$type=="word")
  df=data.frame(start=ann_tags$start[WordRows], end=ann_tags$end[WordRows], pos=unlist(ann_tags$features[WordRows]))
  text1=as.String(text)

  word=sapply(1:length(df$pos), function (x) {substr(text1, df$start[x], df$end[x])})
  df=cbind(df, word)

  atext=paste(
    sapply(1:length(df$start), function (x) {
      sprintf("%s/%s", substr(text1, df$start[x], df$end[x]), df$pos[x])
    }), collapse=" ")
  list(text=atext,table=df, tags=ann_tags)
}
