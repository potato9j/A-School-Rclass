# 답은 내용을 복사하여 RStudio에 붙여넣은 후 필요한 코드를 각각의 문제번호 
# 아래에 추가하여 작성후 저장하여 제출하시오.
# 파일명은 학번_중간고사.R로 하시오.


# 학번 : 20223015           이름 : 이정욱 



# 1번문제 : 1부터 100사이의 수 중에서 5의 배수이면서 7의 배수가 아닌 수를 찾는 
# 코드를 작성하시오. (15점)

for(i in 1:100){  # 변수 i에 1부터 100까지 할당한 후,
  if(i%%7!=0)   # if문을 통해 1부터 100까지 7의 배수인 것을 색출
  if(i%%5==0)  # if문을 통해 1부터 100까지 5의 배수인 것을 색출 
  print(i)  # 1부터 100사이의 수 중에서 5의 배수이면서 7의 배수가 아닌 것을 출력
} 



# 2번문제 : 
# (2-1) age라는 변수에 23을 할당하시오(5점)

age<-23



# (2-2) if문을 이용하여 age가 10 미만이면 '10세 미만'을, 10 이상~20 미만 이면  
# '10대', 20 이상~30 미만 이면 '20대', 
# 30이상이면 '30대 이상'으로 출력하는 코드를 생성하시오. (15)

age<-23
if(age < 10){
  print("10세 미만")
} else if(age < 20){
  print("10대")
} else if(age < 30) {
  print("20대")
} else if(age >=30) {
  print("30대 이상")
}



# 3번문제 : 약수가 1과 자기 자신뿐인 자연수를 소수(Prime number)라고 합니다.
# prime_num이라는 변수에 자연수를 하나를 할당하고 소수이면 '소수입니다'를 
# 출력하고 소수가 아니면 '소수가 아닙니다'를 출력하는 코드를 생성하시오. (25점)

n<-79  # 임의의 자연수를 n에 할당
if(n%%2==1){
   print("소수입니다.")
} else if(n%%2!=2){
   print("소수가 아닙니다.")
}



# 4번 문제 
# (4-1) iris라는 데이터를 'C:/data/'라는 폴더에 'my_iris.csv'라는 csv 파일을 
# 생성하는 코드를 작성하시오.(10점)

write.csv(iris, file="C:\\data\\my_iris.csv")



# (4-2) (4-1)에서 생성된 'my_iris.csv'라는 csv 파일을 읽어서 'my_iris'라는
# 변수에 할당하는 코드를 생성하시오. (10점)

my_iris <- read.csv("C:\\data\\my_iris.csv", header=T, sep=",")



# (4-3) 'my_iris' 변수를 이용하여 각 열이 숫자인 경우는 평균과 표준편차를
# 출력하는 코드를 생성하시오. (10점)

mean(df$Sepal.Length)
sd(df$Sepal.Length)

mean(df$Sepal.Width)
sd(df$Sepal.Width)

mean(df$Petal.Length)
sd(df$Petal.Length)

mean(df$Petal.Width)
sd(df$Petal.Width)



# 5번 문제
# 아래 코드를 실행하고 두 데이터 프레임을 name이라는 열을 기준으로 결합하되 
# 나이와 취미를 모두 알 수 있는 학생만 추출하는 코드를 생성하시오.(10점)

name1 <- c('김미영', '이미래', '최수영', '안가빈')
age <- c(10, 15, 20, 25)

name2 <- c('박민기', '이미래', '최수영')
hobby <- c('영화보기', '배드민턴', '산책')

student <- data.frame(name=name1, age=age)
info_hobby <- data.frame(name=name2, hobby=hobby)


A <- merge(x=student,y=info_hobby,by='name', all=FALSE)
A

