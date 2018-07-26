
#importing the text mining package tm
library(tm)

# creating a corpus of 3 documents using the following urls
url1='https://cdn.rawgit.com/aviram2308/txt-minng/6109c23e/man2013.txt'
url2='https://cdn.rawgit.com/aviram2308/txt-minng/6109c23e/2015mdi.txt'
url3='https://cdn.rawgit.com/aviram2308/txt-minng/6109c23e/2017mdi.txt'
urls=c(url1, url2, url3)

#using list apply to apply functions one by one on each element of the list
c1=lapply(urls, FUN=readLines)
str(c1)
class(c1)


c1.2=lapply(c1, FUN= paste, collapse=" ")
str(c1.2)
class(c1.2)


#removing punctuation using regex \\W
c1.3=gsub(pattern="\\W", replace=" " , c1.2)
str(c1.3)

#removing numbers using regex \\d
c1.4=gsub(pattern="\\d", replace=" " , c1.3)
str(c1.4)


#making all letters in small case so that we don't have to remove stopwords case wise
c1.5=tolower(c1.4)
str(c1.5)


stopwords()

#remove stopwords
c1.6=removeWords(c1.5, stopwords())
str(c1.6)


#making a vector of document specific stopwords sw
sw2=c('india','indian','independence','day')
c1.7=removeWords(c1.6, sw2)
str(c1.7)


#removing the residual 1 character words
c1.8=gsub(pattern="\\b[A-z]\\b{1}", replace=" " , c1.7)
str(c1.8)

#remove all residual white space
c1.9=stripWhitespace(c1.8)
str(c1.9)

#import stringr 
library(stringr)


#cbw is corpus bag of words
cbw=str_split(c1.9, pattern="\\s+")
str(cbw)


library(wordcloud)
#creating a wordcloud
#cbw is a list but wordcloud function takes a vector, thus use elements of list c1.9
wordcloud(c1.9[1], random.order=F)

wordcloud(c1.9[2], random.order=F)

wordcloud(c1.9[3], random.order=F)
