enrollment <- read.csv("c:/data/enrollment.csv")
library(dplyr)

str(enrollment)  # 데이터구조보기
View(enrollment)  # 테이블 형식으로 파일 보기
summary(enrollment)  # 파일 내용 요약

# 취득학점에 따른 점수 계산 (A+ => 4.5)
ifelse(enrollment$성적 == 'A+', 4.5, 
       ifelse(enrollment$성적 == 'Ao', 4.0, 
              ifelse(enrollment$성적 == 'B+', 3.5,
                     ifelse(enrollment$성적 == 'Bo', 3.0,
                            ifelse(enrollment$성적 == 'C+', 2.5,
                                   ifelse(enrollment$성적 =='Co', 2.0, 0))))))

# dplyr를 통한 변수생성
enrollment <- enrollment %>%
  mutate(성적점수 = ifelse(성적 == 'A+', 4.5, 
                    ifelse(성적 == 'Ao', 4.0, 
                    ifelse(성적 == 'B+', 3.5,
                    ifelse(성적 == 'Bo', 3.0,
                    ifelse(성적 == 'C+', 2.5,
                    ifelse(성적 =='Co', 2.0, 0))))))) %>%
  mutate(학점수X성적점수 = 학점수*성적점수) %>%
  
