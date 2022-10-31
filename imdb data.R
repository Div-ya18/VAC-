
install.packages("robotstxt")
library(rvest)
library(robotstxt) 

Path <- paths_allowed("https://www.imdb.com/chart/top/")
url <- "https://www.imdb.com/chart/top/"
my_html<-read_html(url)
View(my_html)

my_tables <- html_nodes(my_html,"table")
View(my_tables)


movie_table <- html_table(my_tables)[[1]]
View(movie_table)
     