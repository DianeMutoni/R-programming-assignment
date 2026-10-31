###Assignment:Importing data from stastistical package and from DBMS with API

#1.import data from excel file

sample <- read.csv("C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.csv",
                   header = TRUE)
View(sample)
head(sample)
tail(sample)
summary(sample)

#2.import data from csv file
students_marks<- read.csv("C:/Users/FALCON TECHNOLOGY/Desktop/R docs/students_marks.csv",
                          header = TRUE)
View(students_marks)
head(students_marks)
tail(students_marks)
summary(students_marks)

#3.import data from excel file into SPSS
#3.1 SPSS file
install.packages("readxl")
install.packages("haven")

library(readxl)
library(haven)
data <- read_excel("C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.xlsx")

write_sav(data, "C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.sav")
spss_data <- read_sav("C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.sav")         
View(spss_data)
head(spss_data)
tail(spss_data)



#3.2.stata file
library(readxl)
library(haven)
write_dta(data, "C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.dta")
dta_data <- read_dta("C:/Users/FALCON TECHNOLOGY/Desktop/R docs/sample.dta")
View(dta_data)
head(dta_data)
tail(dta_data)


#4.import data from dbms table result
#4.1With Microsoft access

install.packages(c("DBI", "odbc"))
library(DBI)
library(odbc)

con <- dbConnect(odbc(),.connection_string =
    "Driver={Microsoft Access Driver (*.mdb, *.accdb)};
  DBQ=C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.accdb;"
)

# Display all existing tables
dbListTables(con)
# Importing Result table
Result <- dbReadTable(con, "Result")

# Display the imported data-table
print(Result)

# Check the table
str(Result)

# Close the connection
dbDisconnect(con)



#import data from dbms/ms access table Student
install.packages(c("DBI", "odbc"))
library(DBI)
library(odbc)

con <- dbConnect(
  odbc(),
  .connection_string =
    "Driver={Microsoft Access Driver (*.mdb, *.accdb)};
  DBQ=C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.accdb;"
)
# Display all existing tables
dbListTables(con)
# Import Student table
Student <- dbReadTable(con, "Student")

# Display the imported data
print(Student)

# Check the structure
str(Student)
dbDisconnect(con)






library(DBI)




#4.2import data using Msqlite


install.packages(c("DBI", "RSQLite"))

 RSQLite::SQLite()
 # "C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.db"
#)


library(DBI)
library(odbc)
library(RSQLite)

# Connect to Microsoft Access
access_con <- dbConnect(
  odbc(),
  .connection_string =
    "Driver={Microsoft Access Driver (*.mdb, *.accdb)};
  DBQ=C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.accdb;"
)
# Connect to SQLite 
sqlite_con <- dbConnect(
  SQLite(),
  "C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.db"
)

# Check  tables
dbListTables(access_con)

# Import the existing Result,student tables from Access
Result <- dbReadTable(access_con, "Result")
Result <- dbReadTable(access_con, "Student")



dbWriteTable(sqlite_con,"Result",Result,overwrite = TRUE)
dbWriteTable(sqlite_con,"Student",Student,overwrite = TRUE)



# Read the table from SQLite
sqlite_Result <- dbReadTable(sqlite_con, "Result")
sqlite_Student <- dbReadTable(sqlite_con, "Student")

print(sqlite_Result)
print(sqlite_Student)


# Close both connections
dbDisconnect(access_con)
dbDisconnect(sqlite_con)


#4.3import data using Mysql
install.packages("RMariaDB")
library(DBI)
library(odbc)
library(RMariaDB)

access_con <- dbConnect(
  odbc(),
  .connection_string =
    "Driver={Microsoft Access Driver (*.mdb, *.accdb)};
  DBQ=C:/Users/FALCON TECHNOLOGY/Desktop/Advanced DB/UniversityStudentDB.accdb;"
)


dbListTables(access_con)
Result <- dbReadTable(access_con, "Result")
print(Result)


  dbIsValid(mysql_con)
  
  #destination database
  dbExecute(mysql_con, " UniversityDB")
  
  #connecting database
  mysql_con <- dbConnect(
    RMariaDB::MariaDB(),
    dbname = "UniversityDB",
    host = "localhost",
    port = 3306,
    user = "root",
    password = "Mutonidiane@97",
  )
  
  #transfering  Access table
  Result <- dbReadTable(access_con, "Result")
  
  dbWriteTable(mysql_con,"Result",Result,overwrite = TRUE)
  
  
  dbListTables(mysql_con)
  print(dbReadTable(mysql_con, "Result"))
  
  ##Assignment2 use of geom functions
  install.packages("ggplot2")
  library(ggplot2)
  data("iris")
  View(iris)
  
  # Bar chart
  p1<-ggplot(iris, aes( Species)) +
    geom_bar()
  
  # Boxplot
  p2<-ggplot(iris, aes( Species, Sepal.Length)) +
    geom_boxplot()
  
  # Density plot
  p3<-ggplot(iris, aes(Sepal.Length)) +
    geom_density()
  
  # Histogram
  p4<-ggplot(iris, aes(Sepal.Length)) +
    geom_histogram()
  
  # hline
  p5<-ggplot(iris, aes(Sepal.Length, Petal.Length)) +
    geom_hline(yintercept = 4.8)
  
  # Jitter plot
  p6<-ggplot(iris, aes( Species, Sepal.Length)) +
    geom_jitter()
  
  #line plot
  p7<-ggplot(iris, aes(Sepal.Length, Petal.Length)) +
    geom_line()
  
  #geom_point
  p8<-ggplot(iris, aes(Sepal.Length, Petal.Length, color = Species)) +
    geom_point()
  
  #geom_rug
  p9<-ggplot(iris, aes(x = Sepal.Length, y = Petal.Length)) +
    geom_point() +
    geom_rug()
  
  #geom_smooth
  p10<-ggplot(iris, aes(Sepal.Length, Petal.Length)) +
    geom_point() +
    geom_smooth()
  
  #geom_text
  p11<-ggplot(iris, aes(x = Sepal.Length,
                   y = Petal.Length,
                   label = Species,color = Species)) +
    geom_point(size = 2,alpha = 0.7) +
    geom_text()
  
  #geom_violin
  p12<-ggplot(iris, aes(x = Species, y = Sepal.Length,fill = Species)) +
    geom_violin()
  
  #geom_vlin
  p13<-ggplot(iris, aes(x = Sepal.Length,
                   y = Petal.Length)) +
    geom_point() +
    geom_vline(xintercept = 6,
               color = "blue",
               linewidth = 0.5,
               linetype = "solid")
  
  
  
  

