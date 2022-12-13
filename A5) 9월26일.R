#2022-09-26

function이름 <- function(a,b,c,...){
  function수행내용
  return(값 또는 변수)
}



my_ftn<-funstion(a,b,c){
  d<-(a^2-b^2)/c
  return(d)
}
my_ftn(5,2,3)-my_ftn(-4,5,2)




#csv파일 불러오는 방법 (강의실 컴퓨터 파일기준)
test<-read.csv("C:\\data\\test.csv", header=T, sep=",")
test

View(test)  #첫 6개행 출력
tail(test)  #마지막 6개행 출력
dim(test)  #행의갯수, 열의갯수 출력
str(test)  #데이터의 구조보기(매우중요)
summary(test)  #데이터 요약


red<-read.csv("C:\\data\\winequality-red.csv", header=T, sep=",")  #wine---파일 불러오기



#변경된 파일 저장하기
write.csv(df이름, "파일경로와 파일", row.names=F)  #row.names=F 자동으로 행번호 추가방지


write.csv(red, "C:\\data\\red2.csv", row.names=F)  #wine파일 저장하기
