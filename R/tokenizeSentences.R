tokenizeSentences=function(text) {
  OneText  = gsub("\\n", " ", as.String(text))
  SentPatt = "[^\\.]+(\\.|$)"
  Matches  = gregexpr(SentPatt, OneText)
  MatchStart=c(Matches[[1]]) # 1L forces integer
  MatchLen=attr(Matches[[1]], "match.length")
  MatchEnd=c(MatchStart+MatchLen-1)
  NLP::Span(MatchStart,MatchEnd)
}
