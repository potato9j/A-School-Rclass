summary(iris)
View(iris)


if(Á¶°Ç½Ä){
  
} else{
  
}


menu <- "Â¥Àå"
if(menu=="Â¥Àå"){
  print("Â¥Àå¸é Ãß°¡")
} else{
  print("Â«»Í Ãß°¡")
}


menu <- "ººÀ½¹ä"
if(menu=="Â¥Àå"){
  print("Â¥Àå¸é Ãß°¡")
} else if(menu=="Â«»Í"){
  print("Â«»Í Ãß°¡")
} else {
  print("ººÀ½¹ä Ãß°¡")
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
  print(2*i)
}


for(i in 1:50){
  print(2*i-1)
}


for(i in 1:33){
  print(3*i)
}


for(i in 1:9){  #9¹ø¹Ýº¹
  print(6*i)
}


dan<-6
for(i in 1:9){
  print(dan*i)
}


for(dan in 2:9){  #±¸±¸´Ü 2´ÜºÎÅÍ 9´Ü Ãâ·Â
  print("#######")
  for(i in 1:9){
    print(dan*i)
  }
}