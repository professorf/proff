WCLEAN=function(x) {  # An optional yet often necessary 2nd cleaning pass
  xl=tolower(x)
  # x=gsub("[^a-zA-Z0-9]", "", x) # HACK REMOVE
  # xrw=removeWords(xl, stopwords()) # BAD! This removes she-her or he-him
  xrw=xl[which((xl %in% stopwords())==F)]
  goodrows=which(nchar(xrw)>2 & xrw!="url") # remove small words & URLs
  xgr=xrw[goodrows]
  xgr
}
