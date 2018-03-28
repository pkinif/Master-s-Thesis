####################################################################################
##### Author: Pierrick Kinif                            ############################
##### Date : 28-03-2018                                 ############################
##### This R code aims at web scraping data from y-charts. #########################
####################################################################################

# Here are the package you will need

library(rvest)


#Here are the vector of the url pages I need to scrap. 

url<-"https://ycharts.com/companies/ANDV/tobin_q"
download.file(url,destfile="C:/Users/Pierrik/Rsudio/GitHub/Thesis/Analysis")
-------
  
url<- html("https://ycharts.com/companies/ANDV/tobin_q")

webpages<-read_html("https://ycharts.com/companies/ANDV/tobin_q")
rank_data_html<-html_nodes(webpages,"#dataTableBox")
rank_data<-as.numeric(html_text(rank_data_html))
head(rank_data)


webpage %>%
  html_nodes("#dataTableBox") %>%
  ola <- html_text()

head(rank_data)



UrlVector<- as.vector(TobinqUrlScrapping)

for (url in UrlVector){

  url<-html(url)
  webpages<-read_html("url")
  rank_data_html<-html_nodes(webpages,"#dataTableBox")
  rank_data<-html_table(rank_data_html)
  
  }


