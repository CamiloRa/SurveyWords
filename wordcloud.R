# vector of comments
# the input file will have this, and the function  receives this solely as the input 
# after being cleaned

# assume libraries on 

library(wordcloud)
library(SnowballC)
library(RColorBrewer)
library(readr)
library(tm)

source("PaintTheWords.R")

data_path <- "./data/raw/"
data_title <- "Carter_1981.txt"
# picture_width = 1280
# picture_height = 800
mystopwords <- c(stopwords('english'), 'this', 'the', 'and', 'with', 'that', 'not', 'yes', 'yet', 'will')
pal <- brewer.pal(8, "Accent")
  
stuff <- readr::read_file(paste(data_path,data_title,sep=""))

picture_name <- paste(data_title, Sys.Date(), ".jpg", sep="") 

ld_comments <- Corpus(VectorSource((stuff)))
ld_comments <- tm_map(ld_comments, content_transformer(tolower))
ld_comments <- tm_map(ld_comments, PlainTextDocument)
ld_comments <- tm_map(ld_comments, removePunctuation)
ld_comments <- tm_map(ld_comments, removeWords, mystopwords)
ld_comments <- tm_map(ld_comments, stripWhitespace)

PaintTheWords(picture_name)
