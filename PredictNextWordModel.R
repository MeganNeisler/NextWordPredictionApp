
replaceContractions <- function(docsample) {
        docsample <- gsub("n't", " not", docsample)
        docsample <- gsub("'ll", " will", docsample)
        docsample <- gsub("'re", " are", docsample)
        docsample <- gsub("'ve", " have", docsample)
        docsample <- gsub("'m", " am", docsample)
        docsample <- gsub("it's", "it is", docsample)
        docsample <- gsub("won't", "will not", docsample)
        docsample <- gsub("can't", "can not", docsample)
        return(docsample)
}

toSpace <- content_transformer(function(x, pattern) gsub(pattern, " ", x))

removeSpecial <- content_transformer(function(x)
        iconv(x, "ASCII", "UTF-8", sub = ""))

cleanText <- function(texts) {
        texts <- replaceContractions(texts)
        filtered <- VCorpus(VectorSource(texts))
        filtered <- tm_map(filtered, removeNumbers)
        filtered <- tm_map(filtered, stripWhitespace)
        filtered <- tm_map(filtered, toSpace, "/|@|\\|")
        filtered <- tm_map(filtered, removeSpecial)
        filtered <- tm_map(filtered, content_transformer(tolower))
        filtered <- tm_map(filtered, removePunctuation, preserve_intra_word_dashes = TRUE)
  
}


wordCount <- function(text) {
        length(unlist(strsplit(text, " ")))
}

findlastWord <- function(text, n) {
        paste(tail(unlist(strsplit(text, " ")), n), collapse = " ")
}

findNfreq <- function(words, nf, count) {
        nf.size <- length(unlist(strsplit(as.character(nf$word[1]), " ")))
        words.pre <- findlastWord(words, nf.size - 1)
        f <- head(nf[grep(paste("^", words.pre, " ", sep = ""), nf$word), ], count)
        r <- gsub(paste("^", words.pre, " ", sep = ""), "", as.character(f$word))
        r[!r %in% c("s", "<", ">", ":", "-", "o", "j", "c", "m")]
}

predictNextWord <- function(text, nfl, count) {
        text_wordcount <- wordCount(text)
        prediction <- NULL
        if(text_wordcount > 2) prediction <- findNfreq(text, nfl$f4, count)
        if(length(prediction)) return(prediction)
        if(text_wordcount > 1) prediction <- findNfreq(text, nfl$f3, count)
        if(length(prediction)) return(prediction)
        prediction <- findNfreq(text, nfl$f2, count)
        if(length(prediction)) return(prediction)
        as.character(sample(head(nfl$f1$word, 30), count))
}


cleanNextWord <- function(text, nfl, count) {
        text <- as.character(cleanText(text)[[1]], remove.punct=TRUE)
        predictNextWord(text, nfl, count)
}
#predict current word the user is typing.
predictCurrentWord <- function(text, nfl, count) {
        current <- as.character(cleanText(findlastWord(text, 1))[[1]])
        nf <- nfl$f1
        f <- head(nf[grep(paste("^", current, sep = ""), nf$word), ], count)
        as.character(head(f$word, count))
}