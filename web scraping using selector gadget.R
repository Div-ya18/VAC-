# IMPORTING LIBRARIES
library(rvest)
library(dplyr)
library(robotstxt)

#Checking whether website can be scrapped
path = paths_allowed("https://www.metacritic.com/browse/games/score/metascore/all/all/filtered")

# SCRAPPING WEBSITE
link <- 
  'https://www.metacritic.com/browse/games/score/metascore/all/all/filtered'

# HTML ELEMENTS FROM WEBSITE
web <- read_html(link)

# SEGREGATING NAMES
name <- web %>% 
  html_nodes(".one h3")%>% html_text()

# VIEWING NAME LIST
View(name)

# SEGREGATING platform
platform <- web %>% html_nodes(".one .data") %>% html_text()

# VIEW platform LIST
View(platform)

# SEGREGATING date
date <- web %>% 
  html_nodes(".one .platform+ span") %>% html_text()

# VIEW date LIST
View(date)

# SEGREGATING THE DURATION
#duration <- web %>% html_nodes(".runtime") %>% html_text()

# VIEWING DURATION LIST
#View(duration)

# CREATING DATAFRAME
game.ratings <- data.frame(name, platform, date)

# VIEW DATAFRAME
View(game.ratings)

# SAVING DATA
write.csv (game.ratings, "My_game data.csv")