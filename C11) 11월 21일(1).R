# 1 page 내용 가져오기

# url 생성
url1 <- 'https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code='
url2 <- '&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='
movie_code <- 93756

i <- 1

url <- paste(url1, movie_code, url2, i, sep='')
url

# html 읽기
html <- url %>%
  read_html()

star_score <- html %>%
  html_nodes('div.score_result > ul > li > div.star_score') %>%
  html_text()
star_score
star_score <- as.numeric(star_score)
star_score


review_contents <- html %>%
  html_nodes('div.score_reple > p') %>%
  html_text()
review_contents
review_contents <- gsub("(\\r|\\n|\\t)", "", review_contents)
review_contents




sympathy_count <- html %>%
  html_nodes('a._sympathyButton') %>%
  html_text()
sympathy_count
sympathy_count <- gsub("(\\r|\\n|\\t)", "", sympathy_count)
sympathy_count
sympathy_count <- gsub("공감", "", sympathy_count)
sympathy_count
sympathy_count <- as.numeric(sympathy_count)
sympathy_count




unsympathy_count <- html %>%
  html_nodes('a._notSympathyButton') %>%
  html_text()
unsympathy_count
unsympathy_count <- gsub("(\\r|\\n|\\t)", "", unsympathy_count)
unsympathy_count
unsympathy_count <- gsub("비공감", "", unsympathy_count)
unsympathy_count
unsympathy_count <- as.numeric(unsympathy_count)
unsympathy_count

