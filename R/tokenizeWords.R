tokenizeWords = function (text) {
  OneText=gsub("\\n", " ", as.String(text))
  WordPatt="[^ \\b]+\\b"
  Matches=gregexpr(WordPatt, OneText, perl=T)
  StartPatt=Matches[[1]]
  EndPatt=StartPatt+attr(Matches[[1]],"match.length")-1
  NLP::Span(StartPatt,EndPatt)
}
