# Lyle A. Stewart 
# This code provides a web scraper that will go through the Baltimore Ravens (NFL) ESPN website and scrape the raw XML data to return
# the team name , record, ranking, and next game. 

fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore-ravens"
doc <- htmlTreeParse(fileUrl,useInternalNodes=TRUE)
# use htmltreeparse instead of xml treeparese because this is an html file now from the web
# use internal is true so that I can get all of the different nodes in the file
record <- xpathSApply(doc,"//li[@class='record']",xmlValue)
# look for elements that are list items li and have a particular class. class equals record here. will go through file and any time it sees a list item it will check and see if it is a record. if it is it will return the xml value # look on the raw data and you will see the list items.    
ranking <- xpathSApply(doc,"//li[@class='ranking']",xmlValue)
team <- xpathSApply(doc,"//li[@class='team-name']",xmlValue)
nextgame <- xpathSApply(doc,"//li[@class='nextGame']",xmlValue)

team # print the name of team being analyzed
record # print the teams record
ranking # print the teams current ranking
nextgame #print the teams next game 
