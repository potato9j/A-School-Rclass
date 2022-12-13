
# 12강. R기본활용 (p.148~165)

<br>

## 12-1 🟦 R프로그래밍 기본사항 (p.151)

 - R프로그램 내에서 주석(comment)은 '#'으로 나타내며, #이후에 작성된 문장은 프로그램 실행에 아무 영향을 주지 않는다.
 - R은 보통 한 줄에 명령어를 입력하게 되지만, 명령어가 길 경우에는 연결 프롬프트로 '+'가 나타난다. 이는 'Enter'를 통해 입력된 명령어가 불완전할 경우 R이 자동으로 생성한다. 따라서 연결 프롬프트 '+'가 생성되면, 추가적으로 프로그램 명령어를 입력하면 된다.
 - 한 가지 명령문의 마침은 ';'으로 구분한다. 한 행에 두 가지 이상의 명령을 입력할 경우, ';'를 사용하여 각 명령문을 구분할 수 있다.
   -  ex)) 밥먹어 ; 물먹어 ;
 - 일반적으로 연산의 우선순위를 나타내는 소괄호(), 중괄호{}, 대괄호[] 중에서 대괄호는 R프로그램 내에서 특수한 역할을 하므로 사용할 수 없다.
 - 키보드의 방향키 '위', '아래'키를 통해 이전에 수행했던 문장(명령문)들을 최근에 수행했던 순서대로 다시 불러올 수 있다.

<br>
<br>

------------------------------------------------------------------------------------------

## 12-1-1 🟦 R기초용어 (p.151)

기호 | TRUE/FALSE | 의미
--- | --- | ---
== | - | 같다 / x=y (X) / x==Y (O)
≠0 | TRUE  | 숫자 1 (0이 아닌 수는 무조건 TRUE)
=0 | FALSE | 숫자 0 


<br>
<br>

------------------------------------------------------------------------------------------

## 12-2-1 🟦 기초연산자 (p.152)

기호 | 의미 | 예시 | 중요도
:---: | --- | --- | :---:
+, -, *, / | 더하기, 빼기, 곱하기, 나누기 연산자 | - | ★
**, ^ | 제곱연산자 | 2**3, 2^3 (2의 3제곱) | ★
( | 괄호기능 | - | ★
{ | 블록정의 #블록정의 기능의 경우, 여러 명령어중 해당 블록만 수행하게 된다. | -
[, [[ | 첨자표현 | - 
: | 연속된 데이터 정의 | 1부터 100까지의 정수 🠒 1:100 | ★
; | 명령어 마침 | -
-, %/%, %% | 음의 부호, 몫, 나머지 연산자 | -3+5=2 <br> n%%2==0 🠒 짝수 <br> n%%2==1 🠒 홀수 <br> n%%3==0 🠒 3의배수 | ★
%in% | 포함 여부 확인 연산자 | -
<, >, <=, >==, ==, != | 비교연산자(<=의 경우 두 기호의 순서가 바뀔 경우 에러 발생) | - | ★
! | 부정 연산자 | -
&, && | 논리 연산자 | -
<-, =, -> | 할당연산자 | - | ★★★
%*% | 행렬의 곱 | -

<br>
<br>

------------------------------------------------------------------------------------------

## 12-2-2 🟦 수학함수 (p.152)

기호 | 의미 
:--: | --
abs() | 절대값
trunc() | 소수점 이하 버림
sign(x) | x의 부호
log10(x) | 상용 로그
sqrt() | 루트
round() | 반올림
log(x) | 로그

<br>
<br>

------------------------------------------------------------------------------------------

## 12-3-1 🟦 변수명 설정 규칙 (p.154)
 - 대문자와 소문자를 구분하여 사용 (함수의 경우도 마찬가지. as()함수와 As()함수 구분)
 - 대문자 (A to Z), 소문자 (a to z), 숫자 (0 to 9), '.', '_'의 조합으로 구성
 - 첫 문자로 숫자와 '_'는 사용할 수 없음
 - R 예약어 (if, for, c pi 등)는 사용할 수 없음
 - 최대 256문까지 사용 가능
 
```
<변수> : 데이터를 담는 그릇
Ex)) 로봇청소기 배터리 5% 이하면 충전스태이션으로 이동 🠒 min_battery <- 5
```
``` 
 <변수 예제1>
 > x <- 10
 > y <- 7
 > y <- 8
 > y
 [1] 8
 
 <변수 예제2>
 > x <- 10
 > y <- 7
 > z <- x-y
 > z
 [1] 17
  ```
  
<br>
<br>

------------------------------------------------------------------------------------------
## 12-3-2 🟦 대입(할당) (p.154)
 - 할당(대입) : 변수에 값을 대입 
```
Ex)) x=2(X) / x<-2(O) (오른쪽에 있는 값을 왼쪽에 집어넣어라)
```
<br>
<br>

------------------------------------------------------------------------------------------
## 12-4 🟦 데이터 유형(종류) (p.155)
  
 - 데이터유형 : 셀에 들어간 데이터의 종류
 - 데이터구조 : 데이터 유형의 합 (여러개의 데이터 유형이 합쳐짐)
  
  기호 | 의미 | 예시 | 중요도
  :---: | --- | --- | :---:
  NA | 결측치, 즉 값이 있어야 하는데, 존재하지 않는 경우를 의미 | ≠0 | ★★
  NULL | 프로그래밍의 편의를 위해 미정 값을 표현하는데 사용하는 개념 | 아직미정인 것 |
  NaN(Not a Number) | 수학적으로 정의되지 않는 수치 | 0/0 |
  Inf(Infinite) | 무한대를 의미 | 1/0=양의무한 <br> -14/0=음의무한 |
  숫자형(Numeric) | 숫자형의 데이터를 의미 | 5, 12, 0.78 | ★★★
  문자형(Character) | 10진수 부호 0부터 9까지, 알파벳의 대소문자 등을 " " 또는 ' ' 안에 기재한 데이터를 의미 | "Apple", "Banana", "476" | ★★★
  논리형(진리값) | TRUE/FALSE로 반환되는 데이터를 의미 | - | ★★★
  날짜와 시간 | 날짜형과 시간형 데이터를 의미 | - | ★★★
  
  <br>

  12-4-1 ✅ **<숫자형> ★★** (p.156)
  
    > 20000
    [1] 20000
   
    > 200000
    [1] 2e+05 -> 2*10^5
   
    > 3e+2
    [1] 300

    > '20'-'3'  #숫자인 것 같지만 R에서는 따옴표를 문자로 취급
    Error in "20"-"3" : 이항 연산자에 수치가 아닌 인수입니다.
  
 <br>
  
  12-4-2 ✅ **<문자형> ★★** (p.157)
  
    > 'data mining'  #따옴표가 없는 글자는 '변수'로 취급
    [1] "data mining"
   
    > data analysis  #그냥 사용할 경우, 오류 발생
    Error : 예상하지 못한 기호(symbol)입니다. in "data analysis"

 <br>

  12-4-3 ✅ **<논리형> ★★★** (p.158)
   
     - 어떤 데이터들을 비교해서 모두 참일 경우 'TRUE'를 반환하고, 거짓일 경우 'FALSE'를 반환한다.
     - 컴퓨터는 0이란 것을 'FALSE'로 간주하고, 0이외의 다른 값은 'TRUE'라고 간주한다.
     - &=and(곱셈) : 둘다 T 🠒 T // 한쪽만 T 🠒 F / 둘다 F 🠒 F
     - |=or(덧셈) : 둘다 F 🠒 F // 한쪽만 T 🠒 T / 한쪽만 F 🠒 T 
     - 기호 '!'는 'NOT'의 의미, 즉 "해당 데이터가 아닌 것"이라는 의미를 갖는다. 🠒 F
   
     > 5 & 0  #5(T)곱하기 0(F)의 의미로 'FALSE'
     [1] FALSE 
   
     > 5 & 10 #5(T)곱하기 10(T)의 의미로 'TRUE'
     [1] TRUE
   
     > 1 | 0  #1(T)더하기 0(F)의 의미로 'TRUE'
     [1] TRUE
   
     > 1 | 7  #1(T)더하기 7(T)의 의미로 'TRUE'
     [1] TRUE
   
     > !0  #0(거짓F)이 아니라(!F)는 의미로 'FALSE'
     [1] FALSE
   
     > !9  #참(9)이 아니라(!)는 의미로 'FALSE'
     [1] FALSE
   
     > !5&6  #참(5&6)이 아니라(!)는 의미로 'FALSE'
     [1] FALSE
  
  <br>
  
  12-4-4 ✅ **<NA/NULL형> ★★** (p.159)
   
    - NA는 영어로 Not Applicable, Not Available, 결측값 
     - 값이 존재하긴하나, 정해진 범위 안에 있는 값이 아니라서 사용할 수 없다는 것을 의미
    - NULL은 값이 정해지지 않아서 얼마인지 모른다는 의미
    ex)) 성인기준 신장 범위를 140cm~200cm라고 가정했을 떄, 입력된 신장이 100cm일 경우 'NA'출력된다.
         신장이 입력되지 않은 경우를 'NULL'이라고 한다.
        
    > sum(10, NA, 50)  #NA를 더하면 NA가 출력됨
    [1] NA
   
    > sum(10, NULL, 50)  #NULL값은 제외되고 나머지 값만 더해서 출력됨
    [1] 60 
   
   
    - 위 예제에서 NULL의 경우 R에서 자동으로 값을 제외하고 나머지 연산 진행 / NA의 경우 전체 연산에서 문제발생 
       🠒 NA값을 수동으로 제거 요함 🠒 na.rm 피라미터 사용 가능
       
       > sum(5, 5, NA)  #NA값으로 전체 연산이 NA가 됨
       [1] NA
       
       > sum(5, 5, NA, na.rm=T)  #na.rm=T로 NA값을 제거하고 계산결과 출력
       [1] 10
  
  <br>
  
  12-4-5 ✅ **<날짜와 시간> ★★★** (p.159)
  
     - 다음 예시는 시스템의 현재 날짜를 확인하는 방법과 문자형태로 저장된 날짜를 날짜형식의 데이터로 변경하는 방법을 나타낸다.
     
     > Sys.Date()  #대소문자 주의할 것
     [1] "2018-02-19" "20:46:42 KST"
 

 <br>
 <br>

 ------------------------------------------------------------------------------------------
## 12-5 🟦 패키지설치('lubridate'사용예시) (p.161)
    > install.packages("lubridate")  #추가기능설치 / "n" <- 기능의 이름
    > library(lubridate)
    > date <- now()  #현재 날짜와 시간 넣기 / 따옴표가 없으므로 변수취급
    > date  
    [1] "2018-02-19 20:57:29 KST"
    
    > year(date)  #년도만 출력
    [1] 2018
    
    > month(date)  #월만 출력
    [1] 2
    
    > day(date)  #날짜만 출력
    [1] 19
    
    > date <- date-days(3)  #3일전 날짜 출력 
    > date
    [1] "2018-02-16 20:57:29 KST"
    
    > month(date) <- 10  #10월로 설정하기
    [1] "2018-10-16 20:57:29 KST"
    
    > date+hours(2)  #3시간 추가하기
    [1] "2018-10-16 22:57:29 KST"
    
    > date+minutes(2)  #3분 추가하기
    [1] "2018-10-16 22:59:29 KST"
    
    ex)) 9/7의 100일후의 날짜를 구하라.
         > date <- now()
         > date <- date + days(99)  #오늘포함 100일->99일 입력
    
    
------------------------------------------------------------------------------------------ 
------------------------------------------------------------------------------------------  

<br>
<br>

# 13강. R데이터 구조 (p.166~)
> 시험나오는것 : 데이터의 종류 (**벡터**, 요인, 행렬, 배열, **데이터프레임**, 리스트) / 데이터 종류의 **구분**    
  
  - 데이터 구조 : 셀의 집합 (25칸의 정사각형 중 '하나의 열'을 의미함)
  - 데이터 유형 : 셀 (25칸의 정사각형 중 단 '하나의 칸'을 의미함)

<br>

------------------------------------------------------------------------------------------  
## 13-1 🟦 벡터 (p.166~189)
    
  > **동일한 유형의 데이터로 구성**되어 있는 **1차원 데이터 구조** (가장 기본적인 데이터 구조)
  - 한 가지의 벡터 안에는 한 가지의 스칼라 데이터 타입의 데이터를 입력할 수 있다.
  - 숫자열은 숫자열끼리, 문자열은 문자열끼리 
  - (각 벡터의 셀마다 이름을 부여할 수 있다.)
  - 모든 원소가 같은 형태를 띤다.

<br>
<br>

------------------------------------------------------------------------------------------  
## 13-1-1 🟦 벡터 생성 방법 (p.167)
    
  <br>

  **✅1. c() 함수 이용 : c(숫자 또는 "숫자 or 문자"를 쉼표로 분류하여 입력)**
      
    > x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
    > x
    [1] 1 2 3 4 5 6 7 8 9 10
      
  <br>

  **✅2. colon 함수 이용 : (시작하는 숫자 : 끝나는 숫자 입력)**
  
    > y <- -5:5  #연속된 정수로 표현
    > y
    [1] -5 -4 -3 -2 -1 0 1 2 3 4 5
     
  <br>   

  **✅3. sequence 함수 이용 : 등차수열 (시작하는 숫자 : 끝나는 숫자 : 숫자 사이 일정간격 입력)**    

    > z <- seq(1,10,2)  #1부터 10까지 2씩 차이난다.
    > z 
    [1] 1 3 5 7 9
    
<br>    
<br>

------------------------------------------------------------------------------------------  
## 13-1-1 🟦 규칙성을 가진 벡터 생성 함수 (시험남) (p.167) ★★ 

기호 | 의미 | 예시
:---: | --- | ---
1:10 | 1에서 10까지 간격이 1인 등차수열을 생성한다. | -100:-50
seq(1, 10, length=5) | 1에서 10까지 요소수가 5인 등차수열을 생성한다. | -
seq(1, 10, by=5) | 1에서 10까지 간격이 5인 등차수열을 생성한다. | 1, 6, ~11~
rep(1:10, times=5), rep(1, 10, 5) | 1에서 10까지 다섯 번 반복한 수열을 생성한다. | 12345678910(5번반복)
numeric(10) | 0을 10개 나열한 수열을 생성한다. | -

<br>
<br>

------------------------------------------------------------------------------------------  
## 13-1-2 🟦 벡터 접근(사용) 방법 / 벡터 접근 함수 (p.168) ★★★

  - 쉬운 개념 : "n번째 방에 있는 데이터 나와", "줄줄이 기차"

기호 | 의미 | 예시
:---: | --- | :---:
x[n] | 벡터 x의 n번째 요소를 추출한다. | <다음설명>
x[-n] | 벡터 x의 n번째 요소를 제외한 나머지를 추출한다. | <다음설명>
x[n] <- a | 벡터 x의 n번째 요소를 a로 변경한다. 이때, 문자열로 변경할 경우 "a"로 작성한다. | <다음설명>
x[k:n] | 벡터 x의 k번째 요소와 n번째 요소를 제외한 나머지를 나타낸다.| <다음설명>
x[-k:-n] | 벡터 x의 k번째 요소와 n번째 요소를 제외한 나머지를 나타낸다. | <다음설명>
x[논리값] | TRUE의 요소에 일치하는 데이터를 나타낸다. | <다음설명>
x[조건식] | 조건에 일치하는 데이터를 나타낸다. | <다음설명>
 
<br>

**✅ <x[n]>** 

    - 벡터 x의 n번째 요소를 추출한다. (벡터명=[방번호])   
         
    > x <- 100:1
    > x[10]  #10번째 칸의 값
    > 90  # 100, 99, 98, 97, 96, 95, 94, 93, 92, 91, 90(10번째 값)
 
 <br>  
    
**✅ <x[-n]>** 
  
    - 벡터 x의 n번째 요소를 제외한 나머지를 추출한다.
    
    > y <- -50:-10  #y1=-50
    > y[10]         #y2=-49
    > -40           #y3=-48

    > y <- 1:5
    > y[-4]
    > 1, 2, 3, 4

 <br>

**✅<x[n] <- a>**

    - 벡터 x의 n번째 요소를 a로 변경한다. 이떄, 문자열로 변경할 경우 "a"로 작성한다.
  
    > y <- 1:10
    > y[9] <- a
    > 1, 2, 3, 4, 5, 6, 7, 8, -10, 10

 <br>

**✅<x[k:n]>**

    > y <- 1:10
    > y[3:5]
    > 3, 4, 5
    
 <br>

**✅<x[-k:-n]>**
  
    > y <- 1:5
    > y[-2:-4]
    > 1, 5
  
    > y에 1000이하의 양의 정수를 할당(내림차순)
    > y <- 1000:1  #200번재부터 500번째 데이터를 제외하고 z에 저장하라.
    > y <- y[-200:-500]

<br>
<br>

------------------------------------------------------------------------------------------  
## 13-2 🟦 행렬 (p.169)

  > **동일한 유형의 데이터로 구성**되어 있는 **2차원 데이터 구조**이며 **동일한 길이의 벡터 결합체**
  - 행(nrow), 열(ncol)의 수가 지정되어 있다.
  
<br>
<br>

------------------------------------------------------------------------------------------  
## 13-3 🟦 배열 (p.178)       
    
  - "행렬과 같지만 3차원 구조"  
  > **동일한 데이터 타입**을 가지는 **다차원의 데이터 구조(3차원)**
  - 배열은 length(개수), mode(형태), dim(크기), dimnames(차원의 이름)으로 구성되어 있다.

<br>
<br>

------------------------------------------------------------------------------------------
## 13-4 🟦 리스트(list) (p.181) 

  - 다른 형태의 원소끼리도 결합
  - 각기 다른 구조의 데이터를 하나의 데이터 셋으로 모을 수 있는 오브젝트를 말한다.
  > **서로 다른 데이터로 구성**되어 있는 **2차원 이상의 데이터 구조**이며 **길이가 달라도 된다**.
  - 벡터와 행렬은 정사각형(25칸/벡터의결합)으로 이미지화 할 수 있는 반면, 리스트는 열의 길이가 들쑥날쑥하다.

<br>
<br>

------------------------------------------------------------------------------------------
## 13-5 🟦 데이터 프레임(data frame=df) (p.186) ★★★ 

  - R에서 가장 많이 쓰이는 데이터 구조
  - 다른 데이터 구조와는 달리 데이터유형에 제한을 받지 않고 **행과 열의 2차원 형태를 가지는 데이터구조**를 생성할 수 있다.
  > 겉모습은 행렬과 같은 **2차원의 배열**이지만, 데이터 프레임의 **각 행과 열은 반드시 라벨(카테고리)**이 있고, **열마다 다른 데이터 형태**를 가질 수 있다는 것이 행렬과의 차이점이다. 
  - ex)) 한 열은 숫자형으로, 다른 한 열은 문자형으로 구성 가능
  - 데이터 프레임은 **동일한 길이의 벡터 결합체**

<br>

## 13-5-1 ✅ 데이터 프레임 생성 방법 예시 (p.187)

    > id <- c(101, 201, 301, 401, 501)
    > sex <- "F". "F", "M", "F", "M"
    > height <- c(170, 162, 183, 158, 182)
    > weight <- c(62, 60, 75, 48, 80)
    > grade <- c("A+", "B", "A", "C", "B-")

    > (A <- data.frame(ID=id, SEX=sex, HEI=height, WEI=weight, GRADE=grade))
       
         ID  SEX  HEI  WEI  GRADE  # 데이터 프레임 생성
     1  101   F   170  62    A+
     2  201   F   162  60    B
     3  301   M   183  75    A
     4  401   F   158  48    C
     5  501   M   182  80    F

<br>

## 13-5-2 ✅ 데이터 프레임 접근 및 필터링 방법 예시 (all Ex. data from 13-5-1)
 
  ### **<데이터프레임 필터링 기본구조>** ★★★★
   ```
  🔹1. df[ A , B ] 
       - df = data frame : 값을 추출하는 데이터가 담긴 그릇의 명칭
       - df[ A , B ] = df[행의 조건 , 열의 조건]   

  🔹2. df$ B  = df$열의이름 : 행은 건들지 못하고, 지정된 "열"만을 추출한다.

  🔹3. df[ B ] : ","없이 숫자가 쓰이면 "열"에 대한 함수 (행에 대한 조건X)

  🔹4. df[ n:n , ] : 프레임의 n~n번째 "열"데이터 추출 / ","뒤에 열 지정X -> 모든 "열" 추출

  🔹5. df[df$ A ,  ] : [df$ ~]=행의 조건임  / 열의 조건 없음 -> 모든 열 추출 / 필터링의 예시
   ```
  <br> 
  
    🔹{1번 예시}
    > A[,c(1,3,4)]  #프레임 A의 1, 3, 4 열 데이터 추출 / ","앞에 행조건 지정X -> 모든 행 추출

         ID   HEI   WEI 
     1  101   170   62
     2  201   162   60
     3  301   183   75
     4  401   158   48
     5  501   182   80



    🔹{2번 예시}
    > A$GRADE  #프레임 A의 GRADE(변수) 표시
    [1] A+ B- A C F
    Levels : A A+ B- C F



    🔹{3번 예시}   
    > A[-2]  #","없이 숫자가 쓰이면 열에 대한 함수 (행에 대한 조건 X) / 두 번째 열을 제외하고 데이터 추출 / (SEX열(열2) 제외)
    
        ID    HEI   WEI  G
     1  101   170   62   A+
     2  201   162   60   B-
     3  301   183   75   A
     4  401   158   48   C
     5  501   182   80   F



    🔹{4번 예시}
    > A[2:4,]  #프레임 A의 2~4번째 열 데이터 추출 / ","뒤에 열조건 지정X -> 모든 열 추출
  
        ID   SEX   HEI   WEI  G
     2  201   F    162   60   B-
     3  301   M    183   75   A
     4  401   F    158   48   C
    
    > A[2:4,3]  #2~4번째 열 데이터 중 세번째 열 추출
    [1] 162 183 158
    

    
    🔹{5번 예시} ★★
    > A[A$WEI >= 65,]  #필터링의 예시 / 다음 예시는 몸무게가 65이상인 대상에 대하여 데이터프레임을 부분적으로 추출하는 방법
 
        ID   SEX   HEI   WEI  G
     3  301   M    183   75   A
     5  501   M    182   80   F



    🔸{수업시간 추가 예시}
    > A[A$SEX=='F'&A$HEI>160,]  #"&"는 둘다 만족해야 함 / SEX=F, HEI>160을 만족하는 값을 추출 / ","뒤에 열조건 지정X -> 모든 열 추출

        ID   SEX   HEI   WEI  G
     1  101   F    170   62   A+
     2  201   F    162   60   B-

<br>

## 13-5-2 ✅ 데이터 프레임 결합 예시 (p.188) ★★★★★ 

   - merge() 함수를 활용하여 두 데이터 프레임을 결합할 수 있다. / 'merge'함수 뒤에 먼저 언급된 데이터 프레임을 기준으로 하여 새로운 데이터 프레임이 생성된다.
   - (row) rbind : 수직으로 결합 : 열갯수 동일
   - (column) cbind : 수평으로 결합 : 행갯수 동일

    > id <- c(101, 201, 301, 401, 501)
    > sex <- "F". "F", "M", "F", "M"
    > height <- c(170, 162, 183, 158, 182)
    > weight <- c(62, 60, 75, 48, 80)
    > grade <- c("A+", "B", "A", "C", "B-")

    > (A <- data.frame(ID=id, SEX=sex, HEI=height, WEI=weight, GRADE=grade))
       
         ID  SEX  HEI  WEI  GRADE  # 데이터 프레임 A생성
     1  101   F   170  62    A+
     2  201   F   162  60    B
     3  301   M   183  75    A
     4  401   F   158  48    C
     5  501   M   182  80    F



    > ages <- c(18, 21, 23, 15, 27)
    > job <- c("student", "teller", "nurse", "student", "doctor")

    > (B <- data.frame(ID=id, AGE=ages, JOB=job))  #새로운 데이터 프레임 B생성

         ID   AGE   JOB     # 데이터 프레임 B생성
     1  101   18   student
     2  201   21   teller
     3  301   23   nurse
     4  401   15   student
     5  501   27   doctor



    > C <- merge(A, B)  #데이터 프레임 A와 B 결합 / 일반적으로 앞을 x, 뒤를 y로 칭함
    > C
    
         ID  SEX  HEI  WEI  GRADE  AGE  JOB    # 데이터 프레임 A생성
     1  101   F   170  62    A+    18   student
     2  201   F   162  60    B     21   teller
     3  301   M   183  75    A     23   nurse
     4  401   F   158  48    C     15   student
     5  501   M   182  80    F     27   doctor

<br>

**✅<merge()함수 심화>** (벤다이어그램 A, B) (p.189)
    
    🔹1. 벤다이어그램 A, B의 교집합
      - A, B 양족 모두에 존재하는 데이터만 추출

       > c <- merge(A, B, by='학번', all=FALSE)  #all=FALSE:모든데이터를 살리지는 마라
       

    🔹2. 벤다이어그램 A, B중 A는 모두 살리고, A에 결합가능한 B의 데이터만 추출

       > c <- merge(A, B, by='학번', all.x=TRUE)  #all=TRUE:모든데이터를 살리고, 없는 데이터는 NA처리
       > c <- merge(A, B, by='학번', all.y=TRUE)

    
    🔹3. 벤다이어그램 A, B를 한 행에 합칠 수 있으면 합치고, 못합치면 빈칸으로 처리

       > c <- merge(A, B, by='학번', all=TRUE)


------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

<br>
<br>

# 14강. R함수와 프로그래밍 (p.190)

<br>

## 14-1 🟦 자주 사용되는 기본 함수들 (필수요약) (p.191)

기호 | 의미 | 예시 | 중요도
:---: | --- | --- | :---:
length() | 원소의 개수를 출력 | x<-100 , length(x)=100 <br> length[-100:100]=201  (0포함해서 201개) | ★
sum() | 총합을 출력 | sum(1,2,3)=6 <br> sum(1,NA,3)=4  (NA는 존재하지 않는 데이터를 의미) | 
prod() | 누적곱 출력 | - | 
mean() | 평균 | - | ★★
median() | 중위수(중앙값/순서상 가운데) | median(1,2,100)=>2 | ★★
max() | 최댓값 | - | ★★
min() | 최솟값 | - | ★★
unique() | 데이터를 구성하는 유일한 원소 | z<-c(1,1,3,2,3,5) <br> unique(z)=>(1,3,2,5) | ★★
sd() | 표준편차 | - | ★
summary() | 요약통계량을 출력 | 수치->평균, 최대, 최소 | 

<br>

## 14-1-1 ✅ 기본함수 예시 (p.192~193)

    > vec1 <- c(1,2,3,4,5,6,7)  #벡터에 숫자를 할당
    > vec2 <- c(a,b,c,d,e)      #벡터에 문자를 할당
    
    > max(vec1)  #벡터안의 숫자의 최댓값
    >[1] 7

    > mean(vec1) #벡터1의 평균값
    [1] 4

    > max(ve2)   #벡터안의 문자의 최댓값
    [1] e

    > mean(vec2)  #벡터2의 평균값
    [1] NA  #문자 벡터의 평균값을 요청하여 에러메시지 출력됨

    > min(vec1)  #벡터1의 최솟값
    [1] 1

    > sd(vec1)  #벡터1의 표준편차
    [1] 2.160247

    > sum(vec1)  #벡터1의 총합
    [1] 28

    > var(vec1) #벡터1의 분산
    [1] 4.666667

<br>
<br>

------------------------------------------------------------------------------------------
## 14-2 🟦 연산자와 인덱스 &  ~~수학함수~~ (p.199)

  ### ✅ <기초연산자> (p.199)

기호 | 의미 | 중요
:---:| --- | :---: 
-| 뺄셈 |
+| 덧셈 |
!| 부정 |
*| 곱셈 |
/| 나눗셈 |
^| 거듭제곱 |
%%| 나머지 | 
%/%| 정수 나눗셈 |
==| 같다 |
!=| 같지 않다 |
＞| 크다 |
＞=| 크거나 같다 |
<| 작다 |
<=| 작거나 같다 |
&, &&| 그리고 |
< -| 대입 |

<br>  

  ### ✅ <인덱스 기호> (p.200)

기호 | 의미 
:---: | --- 
x[ i ] | i번째 요소에 접근한다. 
x[ [ i ] ] | i번째 리스트 요소에 접근한다. 
x$a | x에서 a를 추출한다.
x[ i, j ] | i행 j열 요소에 접근한다.
x$"a" | x에서 a를 추출한다. 

<br>
<br>

------------------------------------------------------------------------------------------
## 14-4 🟦 조건문 (시험남) (p.203)

  - 어떤 조건에 따라 처리를 나누고 싶을 때는 if~else문을 사용한다.
  - 조건식에는 TRUE, FALSE를 하나만 반환하는 식을 입력해야 한다.
  - 조건 1개 -> 선택지 2개 / (조건n->선택지n+1)

<br>
    
### ✅ <조건문 사용>
        
    🔹조건문1 : 조건이 2개일 경우 사용

      if(조건식) {
        조건식이 TRUE일 때 실행할 내용
      } else {
        조건식이 FALSE일 때 실행할 내용
      }
        

    🔹조건문2 : 조건이 3개 이상일 경우 사용

      if(조건식) {
        조건식이 TRUE일 때 실행할 내용
      } else if (조건식) {
        조건식이 FALSE일 때 실행할 내용
      } else {
        조건식이 FALSE일 때 실행할 내용
      }

<br>

### ✅ <조건문 예시>

    🔹1번 예시

      menu <- "짜장"
      if(menu=="짜장"){
        print("짜장면 추가")
      } else{
        print("짬뽕 추가")
      }
      [1] "짜장면 추가"


      menu <- "볶음밥"
      if(menu=="짜장"){
        print("짜장면 추가")
      } else if(menu=="짬뽕"){
        print("짬뽕 추가")
      } else {
        print("볶음밥 추가")
      }
      [1] "볶음밥 추가"



    🔹2번 예시
     
      score <- 78
      if(score >= 91){
        print("A+")  
      } else if(score >= 81){  
        print("A0")
      } else if(score >= 71){
        print("B+")
      }
      [1] B+

<br>
<br>

------------------------------------------------------------------------------------------
## 14-5 🟦 반복문 (시험남) (p.205)

  - R반복문 종류 : for, while, ~~repeat~~
  
<br>
<br>

------------------------------------------------------------------------------------------
## 14-5-1 ✅ for 반복문 (p.205)

  - 반복횟수를 미리 알 수 있다면 -> for반복문
  - 주로 **횟수가 정해진 반복**을 수행할 때 사용한다.

<br>

### ✅ <for문 사용식> 
    
    for (변수 in 횟수) {
      <반복할 식>
    }


    - for(변수in횟수)  #매번반복내용+반복횟수지정
      - 변수 : 반복횟수 조절용
      - 횟수 : 벡터

<br>

### ✅ <for문 사용식 예시>

    for(i in 1:50){  
      print(2*i)  #짝수만 출력
    }
    [1]2 / [1]4 / [1]6 / --- / [1]100 
    

    for(i in 1:50){
      print(2*i-1)  #홀수만 출력
    }
    [1]1 / [1]3 / [1]5 / [1]7 / --- / [1]99


    for(i in 1:33){  #33번 반복(33-1+1)
     print(3*i)  #3의배수 출력
    }
    [1]3 / [1]6/ [1]9 / [1]12 / --- / [1]99


    for(i in 1:9){  #9번 반복(9-1+1) 
      print(6*i)  #6의배수 출력
    }
    [1]6 / [1]12 / [1]18 / --- / [1]54 


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

<br>

## 14-5-2 ✅ while 반복문 (p.206)

  - **반복 횟수 지정 없이** **주어진 조건이 성립하는 동안** 계속 반복할 때 사용
  - 조건식이 항상 TRUE일 떄는 프로그램이 계속 실행된다.
  
<br>

### ✅ <while문 사용식> 

    while (조건식) {
      <반복할 식>  #주의:반드시 조건식의 T/F변화가능성이 존재해야한다.
    }

<br>


### ✅ <while문 사용식 예시>

    i<-1
    while(i<=10){
      print(i)
      i<-i+1
    }
    [1]1 / [1]2 / [1]3 / [1]4 / --- / [1]10


    #1000이상의 정수 중에서 7의 배수를 만족하는 최소 정수 출력
    x<-1000
    while(x%%7!=0){
      x<-x+1
    }
    x              
    [1]1001


    #1부터 100까지 합계
    sum<-0  #합계함수sum
    for(i in 1:100){  #for문/i를 1부터 100까지 반복한다.
      sum<-sum+i
    }
    sum
    [1]5050


    sum<-0
    i<-1
    while(i<=100){  #while문
      sum<-sum+i
      i=i+1
    }
    sum
    [1]5050
  
<br>
<br>

------------------------------------------------------------------------------------------
## 14-6 🟦 함수정의 (p.208)

- 내가 만든 함수식
- 사용자가 함수를 직접 만들어 사용하는 방법

<br>

### ✅ <함수정의 형식>
    
    function이름 <- function(a,b,c,...){
      function수행내용
      return(값 또는 변수)
    }

<br>

### ✅ <함수정의 예시>

    > a, b -> (+)  -> a+b


    > +(더하기) 함수
    plus <- function(x,y){
      z <- x+y
      return(z)
    }
    plus(5, 7)
    [1]12


    plus(0,3)+plus(2,6)  #return(z1)==3, return(z2)==8
    [1]11
    
        
    > a^2-b^2 / c 을 계산하는 my_ftn을 생성하고, my_ftn(5,2,3)-my_ftn(-4,5,2)를 계산하라
    my_ftn <- function(a,b,c){
      d <- (a^2-b^2)/c
      return(d)
    }
    my_ftn(5,2,3)-my_frn(-4,5,2)
    [1]11.5
    
    
------------------------------------------------------------------------------------------ 
------------------------------------------------------------------------------------------  

<br>
<br>

# 15강. R데이터 탐색하기 (p.213~)

### **<데이터 파악을 위한 기본 함수>**
기호 | 의미 
--- | --- 
head(test) | test 데이터의 앞부분(6번째행까지)을 나타낸다.
tail(test) | test 데이터의 뒷부분을 나타낸다.
View(test) | 뷰어 창에서 test 데이터를 확인한다.
dim(test) | test 데이터의 차원을 나타낸다.
summary(test) | test 데이터의 요약된 통계량을 나타낸다.
str(test) | test 데이터의 속성을 나타낸다.

<br>

------------------------------------------------------------------------------------------  
## 15-1 🟦 데이터 파일 입력 및 출력 (p.213)

  - csv로 저장된 외부 데이터 파일을 불러들이는 방법과 데이터 프레임을 csv파일로 저장하는 방법
  - csv파일 : 데이터가 ,(콤마)로 분리되어 있음

<br>

## 15-1-1 ✅ <csv파일 입력 및 출력 함수>

    > read.csv(test) : csv 파일을 데이터 프레임으로 읽는다.
    > write.csv(test) : 데이터 프레임을 ().csv로 저장한다.
    파일경로 예시 : C:\\data\\test.csv ~

<br>

## 15-1-2 ✅ <csv파일 입력 및 출력 함수 예시>
    
    > test <- read.csv("C:\\data\\test.csv", header=T, sep=",")
    #파일가져오기  #경로/파일명  #첫째줄을 변수명으로 하라  #콤마로 데이터가 구분되어 있음

      - header=T : 첫째 줄을 변수명으로 하라는 명령어
      - sep="," : 구분기호가 쉼표(,)라는 뜻

<br>
   
   ## 15-1-3 ✅ 데이터파악 기본함수 예시

   ### **<head(df) 함수>**

    🔹 head(df이름) : df에서 앞에서 6개 데이터 추출
     > head(test)                                      
         ID  CLASS  KOREAN  ENGLISH  MATH  SCIENCE  MUSIC
      1   1    6      21      74      34     17      61
      2   2    10     88      51      84     65      31   
      3   3    4      81      91      94     53      0
      4   4    4      77      42      15     66      81
      5   5    1      43      94      28     22      26
      6   6    3      34      76      64     16      56

    🔹 head(df이름,n) : df 앞부터 원하는 행(n)까지 데이터 추출
     > head(test, 10)                                      
         ID  CLASS  KOREAN  ENGLISH  MATH  SCIENCE  MUSIC
      1   1    6      21      74      34     17      61
      2   2    10     88      51      84     65      31   
      3   3    4      81      91      94     53      0
      4   4    4      77      42      15     66      81
      5   5    1      43      94      28     22      26
      6   6    3      34      76      64     16      56
      7   7    7      59      85      89     92      58
      8   8    10     80      22      20     74      67
      9   9    6      52      48      89     76      27
      10  10   10     59      94      80     57      89
  
<br>

   ### **<tail(df) 함수>**

    🔹 tail(df이름, n) : df에서 뒤부터 원하는 행(n)까지 데이터 추출
     > tail(test,10)
           ID  CLASS  KOREAN  ENGLISH  MATH  SCIENCE  MUSIC
      91   91    7      96      20      80     35      99
      92   92    5      68      38      20     31      29   
      93   93    10     67      60      92     30      52
      94   94    3      38      54      60     69      88
      95   95    7      58      44      66     66      26
      96   96    8      98      41      94     67      53
      97   97    9      44      89      70     81      75
      98   98    8      32      20      40     46      29
      99   99    5      83      92      96     98      50
      100  100   1      35      47      23     33      40

<br>

   ### **<names(df) 함수>**
    
    🔹 names(df이름) : 변수명만 추출
     > names(test)
     [1] "ID"  "CLASS"  "KOREAN"  "ENGLISH"  "MATH"  "SCIENCE"  "MISIC"

<br>

   ### **<dim(df) 함수>**

    🔹 dim(df이름) : 데이터가 몇 행, 몇 열로 구성되어 있는지 파악 가능
     > dim(test)
     [1] 100 7  #행/열 갯수 출력

     > nrow(test)  #행 갯수 출력
     [1]100

     > ncol(test)  #열 갯수 출력
     [1]7
     
<br>

   ### **<summary(df) 함수>**

<br>

🔹 **<summary값의 의미>**
기호 | 의미 
--- | ---     
Min (Minimum) | 최솟값으로 가장 작은 값
1st Qu (1st Quantile) | 1사분위수로 하위 25%, 즉 1/4지점에 위치하는 값
Median | 중앙값으로 중앙에 위치하는 값
Mean | 평균값으로 모든 값을 더해서 값의 개수로 나눈 값
3rd Qu (3rd Quantile) | 3사분위수로 하위 75%, 즉 3/4지점에 위치하는 값
Max (Maximum) | 최댓값으로 가장 큰 값
    
    🔹 summary(df이름) : 데이터프레임의 데이터 요약 값을 나타냄
     > summary(test)
           ID              CLASS           KOREAN           ENGLISH  
      Min. : 1.00       Min. : 1.0      Min. :16.00       Min. : 17.00
      1st Qu. : 25.75   1st Qu. : 3.0   1st Qu. : 35.00   1st Qu. : 41.75
      Median : 50.50    Median : 5.5    Median : 55.00    Median : 59.00
      Mean : 50.50      Mean : 5.7      Mean : 54.12      Mean : 58.84
      3rd Qu : 75.25    3rd Qu : 8.0    3rd Qu : 71.25    3rd Qu : 76.25
      Max : 100.00      Max : 10.0      Max : 98.00       Max : 99.00
       
          MATH             SCIENCE           MUSIC
      Min. : 15.00      Min. : 16.00      Min. : 16.00   
      1st Qu. : 31.50   1st Qu. : 34.00   1st Qu. : 35.75   
      Median : 54.50    Median : 55.00    Median : 54.50    
      Mean : 54.59      Mean : 56.38      Mean : 56.41    
      3rd Qu : 77.25    3rd Qu : 78.00    3rd Qu : 77.50    
      Max : 00.00       Max : 99.00       Max : 99.00       
     
<br>

   ### **<str(df) 함수>** (p.217)
    
    🔹 str(df이름) : 데이터 프레임에 들어있는 변수들의 속성을 확인할 때 사용됨
     > str(test)
     'data.frame': 100 obs. of 7 variables:
     $ ID      : int 1 2 3 4 5 6 7 8 9 10 ...
     $ CLASS   : int 6 10 4 4 1 3 7 10 6 10 ...        
     $ KOREAN  : int 21 88 81 77 43 34 59 80 52 59 ... 
     $ ENGLISH : int 74 51 91 42 94 76 85 22 48 94 ... 
     $ MATH    : int 34 84 94 15 28 64 89 20 89 80 ... 
     $ SCIENCE : int 17 65 53 66 22 16 92 74 76 57 ... 
     $ MUSIC   : int 61 31 50 81 26 56 58 67 27 89 ... 

     $ df   :  int                                   n n n n n n n n n n ...
    #$열이름  #int(변수의 척도):얼마나 정밀측정했는가  #n:첫행이후 입력된 값의 일부
              - int : 정수
              - float : 실수
     
     - 100 obs : 100개의 관측치(행)(Observation)
     - of 7 variables : 7개의 변수(열) 

<br>

## 15-1-4 ✅ <csv형태로 저장하기> (p.218)

   - **write.csv()** 함수를 통해 생성된 파일을 csv형태로 저장한다.
   - 저장하기에 앞서, **setwd()** 함수를 사용하여 작업폴더를 먼저 지정해 주어야 한다.
  
    > set("C:\\data\\")  #데이터 프레임 생성 위치 설정
    > ID <- factor(c(1, 2, 3, 4, 5, 6, 7))
    > SEX <- c("F", "M", "M", "F", "F", "M", "M")
    > HEIGHT <- c(157, 183, 185, 162, 166, 179, 180)
    > WEIGHT <- c(48, 75, 78, 60, 59, 68, 72)

    > CLUB <- dafa.frame(ID, SEX, HEIGHT, WEIGHT)
    > CLUB

        ID  SEX  HEIGHT  WEIGHT
     1   1   F    157     48
     2   2   M    183     75
     3   3   M    185     78
     4   4   F    162     78
     5   5   F    166     59
     6   6   M    179     68
     7   7   M    180     72

    > write.csv(CLUB,file="CLUB.csv", row.names=TRUE)  #생성된 데이터 프레임 저장
     
       # write.csv(test, "test1.csv", row.names=TRUE/FALSE)
       # write.csv(df이름, 경로x/파일이름o, row.names=TRUE/FALSE)
         # row.names=TRUE : csv파일을 저장할때, 엑셀 A열에 1부터 번호를 매김
         
<br>

------------------------------------------------------------------------------------------  
## 15-2 🟦 변수명 변경하기 (p.218)

     > names(test1) <- c('새변수명1', '새변수명2', ...)
    #열의 이름을 저장하는 벡터    #새롭게 만들어진 열의 이름을 벡터로 만들어서 넣는것
         
<br>

------------------------------------------------------------------------------------------ 
## 15-3 🟦 파생변수 생성하기 (p.220)

<br>

## 15-3-1 ✅ 변수의 조합을 통한 파생변수 생성 (p.222)
    먼저 앞서 예시를 들었던 test.csv파일을 불러온다.
    
    > test_mean <- read.csv("C:\\data\\test.csv", header=T, sep=",")
    
    이후 각 과목별 변수를 모두 더한 후, 과목 수만큼 나누어서 mean이라는 파생변수를 만들어보자.

    > test_mean$mean <->
      
    
------------------------------------------------------------------------------------------ 
------------------------------------------------------------------------------------------  

<br>
<br>

# 16강. R데이터 핸들링1 (p.223~)

<br>

## 16-1 🟦 dplyr 패키지 함수 (p.223)

기호 | 사용법 | 의미  
:---: | --- | --- 
filter() | filter(데이터, 조건) | 조건에 맞는 행을 출력한다.
select() | select(데이터, 조건) |조건에 맞는 열을 출력한다.
arrange() | - |데이터를 정방향으로 정렬한다.
desc() | - | 데이터를 역방향으로 정렬한다.
mutate() | mutate(데이터, 새변수명 = 새변수생성규칙) |새로운 변수 생성
summarise() | summarise(요약변수명1 = 요약함수1, 요약변수명2 = 요약함수2, ...) | 분할된 데이터를 요약하고 다시 합침
group_by() | group_by(변수명1, 변수명2, ...) | 데이터를 집단별로 나눔
%>% | - | (명칭 : 파이프) 이전 함수에 이어 다음 함수까지 실행

<br>
<br>

------------------------------------------------------------------------------------------ 

## 16-1-1 🟦 summarise() 요약 통계량 함수 (p.236)

기호 | 의미  
:---: | --- 
mean() | 평균
median() | 중앙값
sd() | 표준편자(Standard Deviation)
min() | 최솟값
max() | 최댓값
IQR() | 사분위수(Inter Quartile Range)
sum() | 합
n() | 빈도(사례 수 세는 함수)
n_distinict() | 중복 제거 후 사례 수

<br>
<br>

------------------------------------------------------------------------------------------ 

## 16-1-2 🟦 dplyr 패키지 예시

<br>

```
   > iris
   > str(iris) #데이터 구조보기
   > View(iris)
   > table(iris$Species) #범주별 빈도

   > library(dplyr)
```
<br>

### **✅10/31 수업**

```
🔸 filter 함수 : filter(데이터, 조건), 행을 추출
   

🔹예제1
  Species 라는 변수가 "setosa"인 경우만 추출

   > filter(iris, Species == "setosa")  

   > iris %>%
      filter(Species == "setosa")
__________________________________________________________________________________________ 

🔹예제2
   Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 추출
     
   > iris %>%
      filter(Species == "setosa" & Sepal.Width >= 3)
__________________________________________________________________________________________

🔹예제3
   Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에 
   Sepal.Width와 Sepal.Length를 추출
   
   > iris %>%
      filter(Species == "setosa" & Sepal.Width >= 3) %>%
      select(Sepal.Width, Sepal.Length)
__________________________________________________________________________________________

🔹예제4
   Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에 
   Sepal.Width와 Sepal.Length를 추출하고
   Sepal.Width의 내림차순, Sepal.Length는 오름차순으로 정렬   
   
   > iris %>%
      filter(Species == "setosa" & Sepal.Width >= 3) %>%
      select(Sepal.Width, Sepal.Length) %>%
      arrange(desc(Sepal.Width), Sepal.Length)

```      


```
🔸 mutate() : 새로운 변수 생성
🔸 mutate(데이터, 새변수명 = 새변수생성규칙)
__________________________________________________________________________________________

🔹예제1
   Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에 
   Sepal.Width와 Sepal.Length를 추출하고 
   Sepal.Width의 내림차순, Sepal.Length는 오름차순으로 정렬하고 
   Sepal.Width와 Sepal.Length의 합을 Sepal이라는 변수로 저장
   
   > iris %>%
      filter(Species == "setosa" & Sepal.Width >= 3) %>%
      select(Sepal.Width, Sepal.Length) %>%
      arrange(desc(Sepal.Width), Sepal.Length) %>%
      mutate(Sepal = Sepal.Width+Sepal.Length)
__________________________________________________________________________________________

🔹예제2
   Species 라는 변수가 "setosa"이고 Sepal.Width가 3이상인 데이터 중에 
   Sepal.Width와 Sepal.Length를 추출하고 
   Sepal.Width의 내림차순, Sepal.Length는 오름차순으로 정렬하고 
   Sepal.Width와 Sepal.Length의 합을 Sepal이라는 변수로 저장, 
   mean_Septal.Length 변수에 Sepal.Length의 평균을 저장

   > iris %>%
      filter(Species == "setosa" & Sepal.Width >= 3) %>%
      select(Sepal.Width, Sepal.Length) %>%
      arrange(desc(Sepal.Width), Sepal.Length) %>%
      mutate(Sepal = Sepal.Width+Sepal.Length) %>%
      mutate(mean_Septal.Length = mean(Sepal.Length))
```


```
🔸 group_by() : 데이터를 분할
🔸 group_by(변수명1, 변수명2, ...) : 변수의 값 종류에 따라 데이터를 분할

🔸 summarise() : 분할된 데이터를 요약하고 다시 합침
🔸 summarise(요약변수명1 = 요약함수1, 요약변수명2 = 요약함수2, ...)
__________________________________________________________________________________________

🔹예제1
   iris 데이터에서 Species 범주별로 Sepal.Length의 평균, 
   Sepal.Width의 최대값, Petal.Length의 최소값, Petal.Width의 사례 수

   > iris %>%
      group_by(Species) %>%
      summarise(mean_Sepal.Length = mean(Sepal.Length), 
                max_Sepal.Width = max(Sepal.Width), 
                min_Petal.Length = min(Petal.Length), 
                num_Petal.Width = n())  #summarise의 n()함수는 사례 수 계산함수

```


```
🔹gapminder package를 설치 후 불러오고, gapminder 데이터의 구조보기
 
   > install.packages('gapminder')
   > library(gapminder)
   > library(dplyr)
   > str(gapminder)
__________________________________________________________________________________________

🔹연습문제1
   na.omit() 함수로 결측을 제거하고 
   아프리카 대륙에 있는 국가별 lifeExp의 평균, lifeExp의 최대, pop의 합을 구한 뒤 
   country이름의 오름차순으로 정렬

   > na.omit(gapminder) %>%
       filter(continent == "Africa") %>%
       group_by(country) %>%
       summarise(mean_lifeExp=mean(lifeExp), 
                 max_lifeExp=max(lifeExp),
                 sum_pop=sum(pop)) %>%
       arrange(country)
__________________________________________________________________________________________

🔹연습문제2
   airquality 데이터 셋을 이용해서 결측을 제거하고
   Month 별로 Ozone의 평균, Solar.R의 최대값, Wind의 중앙값(중위수)를 계산하고 
   Month 의 오름차순, Ozone의 평균의 내림차순으로 정렬

   > na.omit(airquality) %>%
       group_by(Month) %>%
       summarise(mean_Ozone=mean(Ozone), 
                 max_Solar.R=max(Solar.R),
                 median_Wind=median(Wind)) %>%
       arrange(Month, desc(mean_Ozone))
```
<br>

### **✅11/3 수업**
```
🔹데이터 파일 읽기
   > mtcars  #내장 데이터(R이 가지고 있는 데이터)
   > str(mtcars)  #데이터 구조 보기기
   > View(mtcars)  #표 형태로 보기

   > install.packages('dplyr')  #패키지 설치
   > library(dplyr)  #패키지 불러오기
__________________________________________________________________________________________

🔹예제1
   평균 연비 이상은 '고연비', 나머지는 '저연비' 로 저장하는 '연비'라는 변수생성
   
   방법1))
   > ifelse(mtcars$mpg >= mean(mtcars$mpg), '고연비', '저연비')

   방법2))
   > mtcars %>% 
       mutate(연비=ifelse(mpg >= mean(mpg), '고연비', '저연비'))
__________________________________________________________________________________________

🔹예제2
   평균 연비 이상은 '고연비', 나머지는 '저연비' 로 저장하는 '연비'라는
   변수생성하고 연비에 따른(연비종류 별로) cyl의 평균, 최대, 최소를 요약

   > mtcars %>% 
       mutate(연비=ifelse(mpg >= mean(mpg), '고연비', '저연비')) %>%
       group_by(연비) %>%
       summarise(평균cyl = mean(cyl), 
                 최대cyl = max(cyl),
                 최소cyl = min(cyl))
```

<br>

### **✅11/7 수업**
```
   > enrollment <- read.csv("c:/data/enrollment.csv")
   > library(dplyr)

   > str(enrollment)  #데이터구조보기
   > View(enrollment)  #테이블 형식으로 파일 보기
   > summary(enrollment)  #파일 내용 요약
__________________________________________________________________________________________

🔹취득학점에 따른 점수 계산 (A+ => 4.5)
   > ifelse(enrollment$성적 == 'A+', 4.5, 
            ifelse(enrollment$성적 == 'Ao', 4.0, 
                   ifelse(enrollment$성적 == 'B+', 3.5,
                          ifelse(enrollment$성적 == 'Bo', 3.0,
                                 ifelse(enrollment$성적 == 'C+', 2.5,
                                        ifelse(enrollment$성적 =='Co', 2.0, 0))))))
__________________________________________________________________________________________

🔹dplyr를 통한 변수생성

   > enrollment %>%
       mutate(성적점수 = ifelse(성적 == 'A+', 4.5, 
                         ifelse(성적 == 'Ao', 4.0, 
                         ifelse(성적 == 'B+', 3.5,
                         ifelse(성적 == 'Bo', 3.0,
                         ifelse(성적 == 'C+', 2.5,
                         ifelse(성적 == 'Co', 2.0, 0))))))) %>%
       mutate(학점수X성적점수 = 학점수*성적점수) %>%
       group_by(학번 ) %>%
       summarise(성적점수합 = sum(학점수X성적점수),
                 학점수합 = sum(학점수)) %>%
       mutate(GPA = 성적점수합/학점수합) %>%
       select(학번, GPA) %>% 
       merge(enrollment, by='학번', all.x=TRUE) %>%
       select(학번, GPA, 소속학과, 학년) %>%
       write.csv("C:/data/GPA.csv")
  ```



<br>

------------------------------------------------------------------------------------------ 

## 16-2 🟦 website자료 스크래핑 예시

<br>

### **✅ 11/14 수업 (주가스크래핑하기1)**

```
   > https://finance.naver.com/item/main.naver?code=005930

   > url1 <- 'https://finance.naver.com/item/main.naver?code='
   > movie_code <- '005930'
   > url <- paste(url1, movie_code, sep='')
   > url

   > html <- url %>%
       read_html(encoding='euc-kr')  #html 내용 가져오기


🔹삼성전자 주가 가져오기
   > stock_price <- html %>%
       html_node("div.rate_info > div.today > p.no_today > em.no_down") %>%   #tag정보 가져오기 / . : R에서는 CLASS를 의미
       html_text()  #tag 사이의 글자 추출
   > stock_price

   > stock_price <- gsub("(\\r|\\n|\\t)", "", stock_price)  #찾기, 바꾸기 / 줄바꿈 문자, 탭 제거
   > stock_price

   > stock_price <-substr(stock_price, 1, nchar(stock_price)/2)  #첫글자에서 중간까지 잘라냄
   > stock_price
   > stock_price <- gsub(",", "", stock_price) 
   > stock_price <- as.numeric(stock_price)  #숫자화
   > stock_price
  ```

<br>

### **✅ 11/15 수업 (주가 스크래핑하기2)**

```
🔹필요 패키지 설치 및 불러오기 
   > if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
   > # if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
   > if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
   > if(!require(httr)) {install.packages("httr"); library(httr)} 
   > if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
   > if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 
__________________________________________________________________________________________

🔹url 생성
   > url1 <- 'https://finance.naver.com/item/main.naver?code='
   > stock_code <- '005930'
   > url <- paste(url1, stock_code, sep='')

   > html <- url %>%
       read_html(encoding = 'euc-kr')
   > html


🔹주식가격 가져오기
   > stock_price <- html %>%
       html_node("p.no_today") %>% 
       html_text()
   > stock_price
   > stock_price <- gsub("(\\r|\\n|\\t)", "", stock_price)
   > stock_price
   > stock_price <- gsub(",", "", stock_price)
   > stock_price
   > stock_price <-substr(stock_price, 1, nchar(stock_price)/2)
   > stock_price
   > stock_price <- as.numeric(stock_price)
   > stock_price
```

<br>

### **✅ 11/21 수업 (영화리뷰 스크래핑하기1)**

```
# 1 page 내용 가져오기

🔹url 생성
   > url1 <- 'https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver?code='
   > url2 <- '&type=after&isActualPointWriteExecute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page='
   > movie_code <- 93756

   > i <- 1

   > url <- paste(url1, movie_code, url2, i, sep='')  #url1, 2 합침
   > url


🔹html 읽기
   > html <- url %>%
       read_html()

   > star_score <- html %>%
       html_nodes('div.score_result > ul > li > div.star_score') %>%
       html_text()
   > star_score
   > star_score <- as.numeric(star_score)
   > star_score


   > review_contents <- html %>%
       html_nodes('div.score_reple > p') %>%
       html_text()
   > review_contents
   > review_contents <- gsub("(\\r|\\n|\\t)", "", review_contents)
   > review_contents


   > sympathy_count <- html %>%
       html_nodes('a._sympathyButton') %>%
       html_text()
   > sympathy_count
   > sympathy_count <- gsub("(\\r|\\n|\\t)", "", sympathy_count)
   > sympathy_count
   > sympathy_count <- gsub("공감", "", sympathy_count)
   > sympathy_count
   > sympathy_count <- as.numeric(sympathy_count)
   > sympathy_count


   > unsympathy_count <- html %>%
       html_nodes('a._notSympathyButton') %>%
       html_text()
   > unsympathy_count
   > unsympathy_count <- gsub("(\\r|\\n|\\t)", "", unsympathy_count)
   > unsympathy_count
   > unsympathy_count <- gsub("비공감", "", unsympathy_count)
   > unsympathy_count
   > unsympathy_count <- as.numeric(unsympathy_count)
   > unsympathy_count
```

<br>

### **✅ 11/22 수업 (영화리뷰 스크래핑하기2)**

```
🔹필요 패키지 설치 및 불러오기 
   > if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
   > # if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
   > if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
   > if(!require(httr)) {install.packages("httr"); library(httr)} 
   > if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
   > if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 
__________________________________________________________________________________________

🔹url 생성
   > url1 <- 'https://movie.naver.com/movie/bi/mi/basic.nhn?code='
   > movie_code <- 93756
   > url <- paste(url1, movie_code, sep='')

   > html <- url %>%
       read_html()


🔹영화줄거리 가져오기
   > movie_story <- html %>%
       html_node("div.story_area > p.con_tx") %>% 
       html_text()
   > movie_story
```

<br>

### **✅ 11/28 수업 (신문기사 스크래핑하기)**

```
🔹필요 패키지 설치 및 불러오기 
   > if(!require(devtools)) {install.packages("devtools"); library(devtools)} 
   > # if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)} 
   > if(!require(rvest)) {install.packages("rvest"); library(rvest)} 
   > if(!require(httr)) {install.packages("httr"); library(httr)} 
   > if(!require(stringr)) {install.packages("stringr"); library(stringr)} 
   > if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)} 
__________________________________________________________________________________________

   > url <- 'https://news.naver.com/main/ranking/popularDay.naver'

   > html <- url %>%
       read_html()


🔹언론사 이름 가져오기
   > media_name <- html %>%
       html_nodes('strong.rankingnews_name') %>%
       html_text()
   > media_name

🔹언론사 뉴스 제목 가져오기
   > news_title <- html %>%
       html_nodes('div.list_content > a' ) %>%
       html_text()
   > news_title
```

<br>

### **✅ 과제3**

```
# 20223015 이정욱 과제3


🔹 패키지 설치 및 불러오기
if(!require(devtools)) {install.packages("devtools"); library(devtools)}
# if(!require(RSelenium)) {install.packages("RSelenium"); library(RSelenium)}
if(!require(rvest)) {install.packages("rvest"); library(rvest)}
if(!require(httr)) {install.packages("httr"); library(httr)}
if(!require(stringr)) {install.packages("stringr"); library(stringr)}
if(!require(dplyr)) {install.packages("dplyr"); library(dplyr)}
__________________________________________________________________________________________

🔹 url생성
   > url1 <- 'https://comic.naver.com/bestChallenge/list?titleId='
   > url2 <- '&page='
   > webtoon_code <- 701701
   > url


🔹 여러페이지 스크래핑 결과 합치기
   > single_webtoon_review_total <- c()


   > for (page in 1:5) {
       url <- paste(url1, webtoon_code, url2, page, sep='')
       url
       html <- url %>%
         read_html
  
  
    #toon_score 가져오기
     > toon_score <- html %>%
         html_nodes ("div.rating_type > strong") %>%
         html_text()
     > toon_score
     > toon_score <- as.numeric(toon_score)
     > toon_score
  
  
    #toon_title가져오기
     > toon_title <- html %>%
         html_nodes("td.title > a") %>%
         html_text()
     > toon_title
  
  
    #loop 설정하기
     > review_one_page <- data.frame(toon_title=toon_title, toon_score=toon_score)
     > str(review_one_page)
     > single_webtoon_review_total <- rbind(single_webtoon_review_total, review_one_page)
   > }  #For Loop 끝


   > str(single_webtoon_review_total)
   > nrow(single_webtoon_review_total)


🔹 PC에 저장하기
   > write.csv(single_webtoon_review_total, "c:/data/webtoon.csv")
```

<br>

### **✅ 기말예시**
```
🔹dplyr 패키지의 이해

# filter
# select
# arrange
# mutate
# group_by
# summarise


data(mtcars)
str(mtcars)
__________________________________________________________________________________________

🔹am 변수 값이 1이면서 mpg가 평균 이상인 자동차의 최대 hp값, 최소 hp 값을 구하는 코드

> library(dplyr)

> my_mtcars <- mtcars %>%
   filter(am==1) %>%
   filter(mpg >= mean(mpg))
> max(my_mtcars)
> min(my_mtcars)


> library(dplyr)
> my_mtcars <- mtcars %>%
   filter(?????) 

  
> max(my_mtcars)
> min(my_mtcars)
__________________________________________________________________________________________

🔹mtcars data에서 am의 종류에 따라 연비(mpg)가 어떻게 달라지는지 mpg의 평균, 최대, 최소, 중앙값을 비교하여 출력하시오.

> mtcars %>%
   group_by(am) %>%
   summarise(mean_mpg = mean(mpg),
             max_mpg = max(mpg),
             min_mpg= min(mpg),
             median_mpg = median(mpg))
__________________________________________________________________________________________

🔹mtcars 데이터에서 평균연비 이상인 차는 '고연비', 이하는 '저연비'라고 저장하는 '연비종류'변수를 생성하시오.

> mtcars %>%
   mutate(연비종류 = ifelse(mpg >= mean(mpg), '고연비', '저연비'))
__________________________________________________________________________________________

🔹네이버 웹툰에서 별점을 스크래핑하는 코드의 일부분이다.  완성하시오.

> url <- 'lieriejioeiower'
> star_score <- url %>%
   read_html() %>%
   html_nodes() %>%
   html_text()  
```