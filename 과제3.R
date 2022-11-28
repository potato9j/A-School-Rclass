# 20223015 이정욱 과제3


# 패키지 설치 및 불러오기
if(!require(devtools)) {install.packages("devtools"); library(devtools)}
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)}
if(!require(rvest)) {install.packages("rvest"); library(rvest)}
if(!require(httr)) {install.packages("httr"); library(httr)}
if(!require(stringr)) {install.packages("stringr"); library(stringr)}
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)}


# url생성
url1 <- 'https://comic.naver.com/bestChallenge/list?titleId='
url2 <- '&page='
webtoon_code <- 701701
url


# 여러페이지 스크래핑 결과 합치기
single_webtoon_review_total <- c()


for (page in 1:5) {
  url <- paste(url1, webtoon_code, url2, page, sep='')
  url
  html <- url %>%
    read_html
  
  
  # toon_score 가져오기
  toon_score <- html %>%
    html_nodes ("div.rating_type > strong") %>%
    html_text()
  toon_score
  toon_score <- as.numeric(toon_score)
  toon_score
  
  
  # toon_title가져오기
  toon_title <- html %>%
    html_nodes("td.title > a") %>%
    html_text()
  toon_title
  
  
  # loop 설정하기
  review_one_page <- data.frame(toon_title=toon_title, toon_score=toon_score)
  str(review_one_page)
  single_webtoon_review_total <- rbind(single_webtoon_review_total, review_one_page)
}  # For Loop 끝


str(single_webtoon_review_total)
nrow(single_webtoon_review_total)


# PC에 저장하기
write.csv(single_webtoon_review_total, "c:/data/webtoon.csv")














