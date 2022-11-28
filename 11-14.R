https://finance.naver.com/item/main.naver?code=005930

url1 <- 'https://finance.naver.com/item/main.naver?code='
movie_code <- '005930'
url <- paste(url1, movie_code, sep='')
url

html <- url %>%
  read_html(encoding='euc-kr')  #html 내용 가져오기

# 삼전 주가 가져오기
stock_price <- html %>%
  html_node("div.rate_info > div.today > p.no_today > em.no_down") %>%   # tag정보 가져오기 / .:R에서는 CLASS를 의미
  html_text()  # tag 사이의 글자 추출
stock_price

stock_price <- gsub("(\\r|\\n|\\t)", "", stock_price)  # 찾기, 바꾸기 / 줄바꿈 문자, 탭 제거
stock_price

stock_price <-substr(stock_price, 1, nchar(stock_price)/2)  # 첫글자에서 중간까지 잘라냄
stock_price
stock_price <- gsub(",", "", stock_price) 
stock_price <- as.numeric(stock_price)  # 숫자화
stock_price
