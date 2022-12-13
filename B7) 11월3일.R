# 데이터 파일 읽기

mtcars # 내장 데이터(R이 가지고 있는 데이터)

str(mtcars) # 데이터 구조 보기기
View(mtcars) # 표 형태로 보기


# install.packages('dplyr') # 패키지 설치
library(dplyr) # 패키지 불러오기


# 평균 연비 이상은 '고연비', 나머지는 '저연비' 로 저장하는 '연비'라는 변수생성
# ifelse(mtcars$mpg >= mean(mtcars$mpg), '고연비', '저연비')
mtcars %>% 
  mutate(연비=ifelse(mpg >= mean(mpg), '고연비', '저연비'))




# 평균 연비 이상은 '고연비', 나머지는 '저연비' 로 저장하는 '연비'라는
# 변수생성하고 연비에 따른(연비종류 별로) cyl의 평균, 최대, 최소를 요약
mtcars %>% 
  mutate(연비=ifelse(mpg >= mean(mpg), '고연비', '저연비')) %>%
  group_by(연비) %>%
  summarise(평균cyl = mean(cyl), 
            최대cyl = max(cyl),
            최소cyl = min(cyl))
