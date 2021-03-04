TCLEAN=function (x) { # TEXT CLEAN: For message and bio strings
  cl=gsub("\n", " ", x) # Need to do this first
  #cl=gsub("http[^ ]+\\b", "URL", cl) # Try not removing URLs see if 88->92 2020-03-21 -- YES!
  #cl=gsub("/", "-", cl)
  cl=gsub("[“”‘’]","'", cl)
  cl=gsub("[^a-zA-z0-9'#@_\\/-]", " ", cl)
  cl=gsub("(\\[|\\])", " ", cl) #Weird bracket problem fix
  cl=gsub("[ ]{2,}", " ", cl)
  #cl=cl[which(cl!="")] # DON'T DO THIS return non-blanks
  cl
}
