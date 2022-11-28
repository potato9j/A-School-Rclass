# 필요 패키지 설치 및 불러오기 
if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
if(!require(httr)) {install.packages("httr"); library(httr)} 
if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 

# url 생성
url1 <- 'https://movie.naver.com/movie/bi/mi/basic.nhn?code='
movie_code <- 93756
url <- paste(url1, movie_code, sep='')

html <- url %>%
  read_html()

# 영화줄거리 가져오기
movie_story <- html %>%
  html_node("div.story_area > p.con_tx") %>% 
  html_text()
movie_story
