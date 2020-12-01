ngram=function (text, k=1) {
  ktext=c()
  for (paragraph in text)  {
    sentences=unlist(strsplit(paragraph, "\\."))
    kgram=c()
    for (s in sentences) {
      s=trimws(s)
      words=unlist(strsplit(s, " "))
      if (length(words)<k) next
      for (i in 1:(length(words)-k+1)) {
        igram=paste(words[i:(i+k-1)], collapse="_")
        kgram=c(kgram,igram)
      }
    }
    ktext=c(ktext,paste(kgram, collapse=" "))
  }
  ktext
}
