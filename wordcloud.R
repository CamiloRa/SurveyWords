# vector of comments
# the input file will have this, and the fucntion receives this solely as the input 
# after being cleaned

# assume libraries on 

library(wordcloud)
library(SnowballC)
library(RColorBrewer)


stuff <- read_csv(comments)
picture_width = 1280
picture_height = 800

picture_name <- paste(comments, time, ".jpg") 
ld_comments <- Corpus(VectorSource((stuff)))
ld_comments <- tm_map(ld_comments, PlainTextDocument)
ld_comments <- tm_map(ld_comments, removePunctuation)
ld_comments <- tm_map(ld_comments, removeWords, mystopwords)
jpeg(filename=picture_name, picture_width = 1280,picture_height=800, units = "px")
wordcloud(ld_comments,
          scale=c(15,.10),
          max.words = Inf,
          random.order = FALSE,
          rot.per = 0,
          colors= pal)
dev.off()
