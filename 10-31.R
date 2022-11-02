iris
str(iris) # 데이터 구조보기
View(iris)
table(iris$Species) # 범주별 빈도

# Species 라는 변수가 "setosa"인 경우만 추출
library(dplyr)

# filter 함수 : filter(데이터, 조건), 행을 추출
filter(iris, Species == "setosa")


iris %>%
  filter(Species == "setosa")

  

# Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 추출
  
iris %>%
  filter(Species == "setosa" & Sepal.Width >= 3)



# Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에
# Sepal.Width와 Sepal.Length 를 추출
iris %>%
  filter(Species == "setosa" & Sepal.Width >= 3) %>%
  select(Sepal.Width, Sepal.Length)



# Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에
# Sepal.Width와 Sepal.Length 를 추출하고 Sepal.Width의 내림차순,
# Sepal.Length는 오름차순으로 정렬
iris %>%
  filter(Species == "setosa" & Sepal.Width >= 3) %>%
  select(Sepal.Width, Sepal.Length) %>%
  arrange(desc(Sepal.Width), Sepal.Length)



# mutate() : 새로운 변수 생성
# mutate(데이터, 새변수명 = 새변수생성규칙)



# Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에
# Sepal.Width와 Sepal.Length 를 추출하고 Sepal.Width의 내림차순,
# Sepal.Length는 오름차순으로 정렬하고 Sepal.Width와 Sepal.Length의
# 합을 Sepal이라는 변수로 저장
iris %>%
  filter(Species == "setosa" & Sepal.Width >= 3) %>%
  select(Sepal.Width, Sepal.Length) %>%
  arrange(desc(Sepal.Width), Sepal.Length) %>%
  mutate(Sepal = Sepal.Width+Sepal.Length)



# Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에
# Sepal.Width와 Sepal.Length 를 추출하고 Sepal.Width의 내림차순,
# Sepal.Length는 오름차순으로 정렬하고 Sepal.Width와 Sepal.Length의
# 합을 Sepal이라는 변수로 저장, mean_Septal.Length 변수에 Sepal.Length의
# 평균을 저장
iris %>%
  filter(Species == "setosa" & Sepal.Width >= 3) %>%
  select(Sepal.Width, Sepal.Length) %>%
  arrange(desc(Sepal.Width), Sepal.Length) %>%
  mutate(Sepal = Sepal.Width+Sepal.Length) %>%
  mutate(mean_Septal.Length = mean(Sepal.Length))



# group_by() : 데이터를 분할
# group_by(변수명1, 변수명2, ...) : 변수의 값 종류에 따라 데이터를 분할


# summarise() : 분할된 데이터를 요약하고 다시 합침
# summarise(요약변수명1 = 요약함수1, 요약변수명2 = 요약함수2, ...)



# iris 데이터에서 Species 범주별로 Sepal.Length의 평균, 
# Sepal.Width의 최대값, Petal.Length의 최소값, Petal.Width의 사례 수
iris %>%
  group_by(Species) %>%
  summarise(mean_Sepal.Length = mean(Sepal.Length), 
            max_Sepal.Width = max(Sepal.Width), 
            min_Petal.Length = min(Petal.Length), 
            num_Petal.Width = n()) # summarise의 n()함수는 사례 수 계산함수



# gapminder package를 설치 후 불러오기
# gapminder 데이터의 구조보기
install.packages('gapminder')
library(gapminder)
library(dplyr)
str(gapminder)


# na.omit() 함수로 결측을 제거하고 
# 아프리카 대륙에 있는 국가별 lifeExp의 평균, lifeExp의 최대, pop의 합을
# 구한 뒤 country이름의 오름차순으로 정렬
na.omit(gapminder) %>%
  filter(continent == "Africa") %>%
  group_by(country) %>%
  summarise(mean_lifeExp=mean(lifeExp), 
            max_lifeExp=max(lifeExp),
            sum_pop=sum(pop)) %>%
  arrange(country)




# airquality 데이터 셋을 이용해서 결측을 제거하고
# Month 별로 Ozone의 평균, Solar.R의 최대값, Wind의 중앙값(중위수)를
# 계산하고 Month 의 오름차순, Ozone의 평균의 내림차순으로 정렬
na.omit(airquality) %>%
  group_by(Month) %>%
  summarise(mean_Ozone=mean(Ozone), 
            max_Solar.R=max(Solar.R),
            median_Wind=median(Wind)) %>%
  arrange(Month, desc(mean_Ozone))

