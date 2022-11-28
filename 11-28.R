



# 필요 패키지 설치 및 불러오기 
if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
if(!require(httr)) {install.packages("httr"); library(httr)} 
if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 

url <- 'https://news.naver.com/main/ranking/popularDay.naver'

html <- url %>%
  read_html()


#언론사 이름 가져오기
media_name <- html %>%
  html_nodes('strong.rankingnews_name') %>%
  html_text()
media_name

#언론사 뉴스 제목 가져오기
news_title <- html %>%
  html_nodes('div.list_content > a' ) %>%
  html_text()
news_title
