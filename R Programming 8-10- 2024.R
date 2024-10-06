print("Programming")
#Variable is the memory container to store values
empcode<-101
print(empcode)

salary=50000.25
print(salary)

550->bonus
print(bonus)

num=155L

print(typeof(empcode))
print(typeof(salary))
print(typeof(num))

empname<-"James Smith"
print(empname)
print(typeof(empname))

#Data Structure
age<-c(25,30,42,27,35)
print(age)
print(age[1:3])


data=c(1:10)
print(data)

odd_number=seq(1,10,2)
print(odd_number)

even_number=seq(0,10,2)
print(even_number)

#boolean Values
booldata=c(TRUE,FALSE,TRUE,TRUE,FALSE)
print(booldata)

#String Values
countryName=c("USA","INDIA",'China',"Canada")
print(countryName)

#check the type of vector
print(class(even_number))
print(class(booldata))
print(class(countryName))

#Convert string to number
empAge=c("25","26","35","37")
print(empAge)
print(class(empAge))

conAge=as.numeric(empAge)
print(conAge)
print(class(conAge))


empsalary<-c(40000,50000,60000,70000,658)
print(sum(empsalary))
#cat use for concatenate
cat("Total Salary is ",sum(empsalary))
cat("Maximum Salary is ",max(empsalary))
cat("Minimum Salary is ",min(empsalary))
cat("Mean/Average Salary is ",mean(empsalary))

cat("Median is ",median(empsalary))

#Marks of Students
#c use for concatenate
marks=c(70,72,80,92,65,74)
cat("Variance is ",var(marks))

#50 update to 10
cat("Range is ",range(1:10,50))


print(c(1:10))

print(range(1:30,50))

#Range Example
x <- c(0:5, 8)
xm <- range(x)

c(xm, range(x,10))

#Standard Deviation is Square root of the variance
cat("Standard Deviation ",sd(marks))


Historymarks=c(75,72,68,65,67,73)
cat("Mean is ",mean(Historymarks))
cat("Variance is ",var(Historymarks))
cat("Standard Deviation ",sd(Historymarks))

Mathmarks=c(83,70,70,62,70,70)
cat("Mean is ",mean(Mathmarks))

#corr use for to check the relationship of two variable

cat("Correlation is ",cor(Historymarks,Mathmarks))

#Matrix
stockprice=c(124,125,130,485,265,124)
stockMatrix=matrix(stockprice,ncol = 3)
stockMatrix
#transpose BY ROW
stockMatrix=matrix(stockprice,ncol = 3,byrow = TRUE)
stockMatrix

#vector store only one type of data
empinfo=c('E001','James',65252,256250)
empinfo
print(class(empinfo[3]))
#print(empinfo[3]+10000) it is the non-numeric

#list store different type of data
prodinfo=list('p001','Computer',65000)
prodinfo
print(typeof(prodinfo[3]))
print(as.integer(prodinfo[3])+10000)

#pass the vector to list
info=list(101,c('James','Anil'),500,c(50,100))
info
print(info[2])
print(info[4])

#$ use for print perticular values from data
product=list(name=c("Computer","Mouse"),price=c(50000,6000))
product
product$name
product$price

#We are discusing about the factor
#Factor useful for categorical data

dataProduct=c('Rock','Classic','Rock','Book')
dataProduct

dataFact=as.factor(dataProduct)
dataFact

#Dataframe show data into tabular format

name<-c("James","Gita","Kellon","Harry","Anita")
age<-c(25,27,21,60,45)
income<-c(5000,6000,7000,8000,9000)

data=data.frame(name,age,income)
View(data)
data$name

#creating a Dataframe from matrix
#vector
stockprice=c(100,200,300,400,500,600)
stockprice
#matrix
stockMatrix=matrix(stockprice,ncol = 2)
stockMatrix
#DataFrame
stockDataFrame=data.frame(stockMatrix)
stockDataFrame

View(stockDataFrame)

st=data.frame(Price=c(50,60,80))
st

cityname=data.frame(A=c("California","Taxes","Delhi"),
                    B=c(1000,2000,3000))
cityname
#Give the columns names
colnames(cityname)=c("City","Amount")
cityname

#First Method
cityname$Amount
#Second Method - this word on column index number
cityname[[1]]

EmpID=c("E001","E002","E003","E004")
EmpName=c("James","Gita","Kellon","Harry")
Salary=c(50000,60000,70000,80000)
Address=c("California","Taxes","Delhi","London")

EmpDetails=data.frame(EmpID,EmpName,Salary,Address)
EmpDetails
#show column number and rows
EmpDetails[1:3,2]

EmpDetails[[2]]

EmpDetails[2]

#Load External File
#getwd() function use for check your system current path/location
getwd()

#setwd() use for set the location in your system
setwd("F://DataSet")

getwd()

df=read.csv("salaries.csv")
df
View(df)

#show how many row and columns
dim(df)

#Data Filtration
filterData=df[df$Salary>100000,]
filterData






