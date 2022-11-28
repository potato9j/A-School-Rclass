####################################################
# Web Data Scraping


# 필요 패키지 설치 및 불러오기 
if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
if(!require(httr)) {install.packages("httr"); library(httr)} 
if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 


################# 천만 관객 이상이 본 영화만 이용해 봅시다.


# 명량
# 극한직업
# 신과함께-죄와 벌
# 국제시장
# 어벤져스: 엔드게임
# 겨울왕국 2
# 아바타
# 베테랑
# 도둑들
# 7번방의 선물
# 알라딘
# 암살
# 광해, 왕이 된 남자
# 신과함께-인과 연
# 택시운전사
# 태극기 휘날리며
# 부산행
# 변호인
# 해운대
# 어벤져스: 인피니티 워
# 실미도
# 괴물
# 왕의 남자
# 어벤져스: 에이지 오브 울트론
# 기생충
# 인터스텔라
# 겨울왕국
################ 하나의 영화에 대한 개요 데이터를 스크래핑 해 봅니다.
# https://movie.naver.com/movie/bi/mi/basic.nhn?code=93756 명량의 개요 페이지

# url 생성
url1 <- 'https://movie.naver.com/movie/bi/mi/basic.nhn?code='
movie_code <- 93756
url <- paste(url1, movie_code, sep='')

html <- url %>%
  read_html()

# 영화제목 가져오기
movie_title <- html %>%
  html_node("div.mv_info > h3.h_movie > a") %>% 
  html_text()
movie_title


# 관람객 평점평균
avg_score <- html %>%
  html_nodes("div.star_score") %>% 
  html_text()
avg_score <- gsub("(\\r|\\n|\\t)", "", avg_score) # 줄바꿈 문자, 탭 제거
avg_score
avg_score <- avg_score[1:3] # 첫 3개만 추출
avg_score
# avg_score <- str_sub(avg_score, -4, -1) 
avg_score <-substr(avg_score, nchar(avg_score)-3, nchar(avg_score)) # 끝 4개 글자만 추출
avg_score
avg_score <- as.numeric(avg_score)
avg_score

avg_viewer_score <- avg_score[1] # 관람객 평점평균
avg_reporter_score <- avg_score[2] # 기자 평론가 평점평균
avg_netizen_score <- avg_score[3] # 네티즌 평점평균


# 연령대별 평가 비율
age_ratio <- html %>%
  html_nodes("strong.graph_percent") %>% 
  html_text()
age_ratio
age_ratio <- age_ratio[1:5]
age_ratio
age_ratio <-gsub("%", "", age_ratio)
age_ratio
age_ratio <- as.numeric(age_ratio)
age_ratio

# review 수를 가져옵니다.
review_count <- html %>%
  html_nodes("strong.total > em") %>% 
  html_text()
review_count
review_count <- as.numeric(gsub(",", "", review_count))
review_count

movie_summary <- c() # 초기화

# 데이터 프레임 생성
movie_summary <- data.frame(movie_title = movie_title,
                            movie_code= movie_code, 
                            avg_viewer_score = avg_viewer_score,
                            avg_reporter_score = avg_reporter_score,
                            avg_netizen_score = avg_netizen_score,
                            age_ratio_10 = age_ratio[1], 
                            age_ratio_20 = age_ratio[2], 
                            age_ratio_30 = age_ratio[3], 
                            age_ratio_40 = age_ratio[4], 
                            age_ratio_50 = age_ratio[5],
                            review_count = review_count)

# 총 리뷰 페이지 수는?
num_page <- ceiling(review_count/10) # 리뷰 수를 10으로 나누어 올림
num_page
################# 

# url 생성
url1 <- 'https://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code='
url2 <- '&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='
movie_code <- 93756

##################################################################
# double ## is reserved for scraping multiple pages
single_movie_review_total <- c() # 여러 페이지 스크래핑 결과 합침
# page<-1

for (page in 1:3){
  url <- paste(url1, movie_code, url2, page, sep='')
  url
  html <- url %>%
    read_html()
  
  # review 수를 가져옵니다.
  review_count <- html %>%
    html_nodes("strong.total > em") %>% 
    html_text()
  review_count
  review_count <- as.numeric(gsub(",", "", review_count))
  review_count
  
  
  
  # 평점을 가져옵시다.
  star_score <- html %>%
    html_nodes("div.star_score") %>% 
    html_text()
  star_score
  star_score <- gsub("(\\r|\\n|\\t)", "", star_score) # 줄바꿈 문자, 탭 제거
  star_score # 문자이네요. 숫ㅈ로 바꾸어 봅시다.
  star_score <- as.numeric(star_score)
  star_score 
  
  # 리뷰 본문을 가져와 봅시다.
  review_contnents <- html %>%
    html_nodes("div.score_reple > p") %>% # 하위 element는 >로 연결
    html_text()
  review_contnents
  review_contnents <- gsub("(\\r|\\n|\\t)", "", review_contnents) # 줄바꿈 문자, 탭 제거
  review_contnents
  
  # 글쓴 시간을 가져와 봅시다.
  review_time <- html %>%
    html_nodes("dl> dt > em:nth-child(2)") %>% 
    html_text()
  review_time
  review_time <- substr(review_time, 1, 10) # 날짜만 나오게 각 날짜의 처음 10개 문자만 잘라 봅시다.
  review_time
  
  # 리뷰글에 대한 공감 수를 가져옵시다.
  sympathy_count <- html %>%
    html_nodes("a._sympathyButton") %>% 
    html_text()
  sympathy_count
  sympathy_count <- gsub("(\\r|\\n|\\t)", "", sympathy_count) # 줄바꿈 문자, 탭 제거
  sympathy_count
  sympathy_count <- gsub("공감", "", sympathy_count) # 줄바꿈 문자, 탭 제거
  sympathy_count
  sympathy_count <- as.numeric(sympathy_count) # 숫자로 변환
  sympathy_count
  
  # 리뷰글에 대한 비공감 수를 가져옵시다.
  unsympathy_count <- html %>%
    html_nodes("a._notSympathyButton") %>% 
    html_text()
  unsympathy_count
  unsympathy_count <- gsub("(\\r|\\n|\\t)", "", unsympathy_count) # 줄바꿈 문자, 탭 제거
  unsympathy_count
  unsympathy_count <- gsub("비공감", "", unsympathy_count) # 줄바꿈 문자, 탭 제거
  unsympathy_count
  unsympathy_count <- as.numeric(unsympathy_count) # 숫자로 변환
  unsympathy_count
  
  review_one_page <- data.frame(star_score=star_score, review_contnents=review_contnents, review_time=review_time, sympathy_count=sympathy_count, unsympathy_count=unsympathy_count )
  str(review_one_page)
  single_movie_review_total <- rbind(single_movie_review_total, review_one_page)
} # For loop 끝
str(single_movie_review_total)
nrow(single_movie_review_total)

write.csv(single_movie_review_total, paste(movie_title, ".csv", sep=''))