summary(iris)
View(iris)


if(조건식){
  
} else{
  
}


menu <- "짜장"
if(menu=="짜장"){
  print("짜장면 추가")
} else{
  print("짬뽕 추가")
}


menu <- "볶음밥"
if(menu=="짜장"){
  print("짜장면 추가")
} else if(menu=="짬뽕"){
  print("짬뽕 추가")
} else {
  print("볶음밥 추가")
}



score <- 78
if(score >= 91){
  print("A+")  
} else if(score >= 81){  
  print("A0")
} else if(score >= 71){
  print("B+")
}



for(i in 1:50){  
  print(2*i)  #짝수만 출력
}


for(i in 1:50){
  print(2*i-1)  #홀수만 출력
}


for(i in 1:33){  #33번 반복(33-1+1)
  print(3*i)  #3의배수 출력
}


for(i in 1:9){  #9번 반복(9-1+1) / 
  print(6*i)  #6의배수 출력
}


dan<-6  #dan을 6으로 지정
for(i in 1:9){  
  print(dan*i)
}


for(dan in 2:9){  #구구단 2단부터 9단 출력
  print("#######")  #구구단 열을 구분
  for(i in 1:9){
    print(dan*i)
  }
}
