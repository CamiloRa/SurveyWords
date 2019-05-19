#Funct_wordvec

library(word2vec)

source("PaintTheWords.R")

data_path <- "./data/raw/"
listoffiles <- dir(data_path)

data_title <- "Carter_1981.txt"
# picture_width = 1280
# picture_height = 800
mystopwords <- c(stopwords('english'), 'this', 'the', 'and', 'with', 'that', 'not', 'yes', 'yet', 'will')
pal <- brewer.pal(8, "Accent")


