# 필요 패키지 설치 및 불러오기 
if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
if(!require(httr)) {install.packages("httr"); library(httr)} 
if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 

# url 생성
url1 <- 'https://finance.naver.com/item/main.naver?code='
stock_code <- '005930'
url <- paste(url1, stock_code, sep='')

html <- url %>%
  read_html(encoding = 'euc-kr')
html

# 주식가격 가져오기
stock_price <- html %>%
  html_node("p.no_today") %>% 
  html_text()
stock_price
stock_price <- gsub("(\\r|\\n|\\t)", "", stock_price)
stock_price
stock_price <- gsub(",", "", stock_price)
stock_price
stock_price <-substr(stock_price, 1, nchar(stock_price)/2)
stock_price
stock_price <- as.numeric(stock_price)
stock_price
