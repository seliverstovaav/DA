# Выбрать Working directory. Это нужно сделать, что бы в
# процессе работы каждый раз не прописывать полный путь к файлам,
# а пользоваться относительными путями
# укажите путь до папки part_1 включительно
#setwd("C:/Users/<Имя пользователя>/Documents/ОАД/lab_R/part_1")

#еще можно так (если вы храните проект в Documents(Windows)):
setwd("~/ОАД/lab_R/part_1")

#######################################################################

# 1. Класический вариант загрузки данных (.csv and .txt файлы)

# Загрузка simpsons_episodes.csv, Population.txt и Cities.xlsx из Working directory
simpsons <- read.csv("./data/simpsons_episodes.csv", sep = ",")

View(simpsons)
#тип объекта
typeof(simpsons)


# Вывод первых и последних строк загруженных данных
head(simpsons)
tail(simpsons)

# Просмотр имен столбцов
names(simpsons)

# Здесь нужно написать код для загрузки данных
# используя утилиту read


# Import excel datasets
# Using readxl pacakge
library(readxl)
Cities <- read_excel("./data/Cities.xlsx")
View(Cities)

#######################################################################

# 2. Загрузка данных из других пакетов R
# Загрузка набора данных M3 из пакета Mcomp
library("Mcomp")

data3 <- data(M1, package="Mcomp")

View(M1)

#######################################################################

# 3. Загрузка данных из интернета
# Для этого воспользуемся пакетом RCurl

# вызов пакета Rcurl

# получение данных из интернета
data <- getURL('https://people.sc.fsu.edu/~jburkardt/data/csv/mlb_players.csv',
               ssl.verifyhost=FALSE, ssl.verifypeer=FALSE)

# Чтение данных
myfile<- read.csv(textConnection(data), sep = ",", header = TRUE)
View(myfile)

#######################################################################

# 4. Получение свойств данных
# посмотреть начальные строки объекта
head(myfile)

# посмотреть последние строки объекта
tail(myfile)

# общая информация об объекте
summary(myfile)

# внутренняя структура объекта
str(myfile)

# размерности объекта
dim(myfile)

# имена размерностей объекта
dimnames(myfile)

# имена объекта
names(myfile)

# число элементов
length(myfile)

#######################################################################

# 5. Работа с Data Frame

# создание нового фрейма данных
name <- c("Nicole Y.", "Jane B.", "Pink T.", "Floyd W.", "Sam S.", "George J.")
weight <- c(60, 68, 71, 87, 67, 93)
height <- c(174, 168, 178, 188, 165, 172)
size <- c("L", "S", "XL", "XXL", "S", "M")
sex <- c("male", "female", "male", "male", "female", "male")
data <- data.frame(name, weight, height, size, sex)

data

#ЗАДАНИЯ ДЛЯ САМОСТОЯТЕЛЬНОГО ВЫПОЛНЕНИЯ

# 1.отобрать все колонки кроме 1-ой
# пример команды 
data[,2:4]

# 2.отобрать column weight
# пример:
data$size

# 3.Отобрать только данные, относящиеся к женщинам
# пример:
data1 <- subset(data, size == "M")

# 4.сортировка по весу
# пример: 
data[order(data$weight, decreasing = T), ]

# 5.отсортировать наши данные сначала по полу, а потом по росту

# 6.Сделайте выборку записей с weight <= 80, используя команду subset,
# и убедитесь, что в ней не осталось записей с weight > 80
# (выведите кол-во записей с weight > 80 (команда length()) )