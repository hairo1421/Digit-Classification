###############################
#
# Ciencia de Datos
# Miranda Belmonte Hairo Ulises
# Tarea 2 Preguta 3 Ejercicio b
# Ejercicio Extra
# Versi�n 1
#
###############################

######################
## Librerias
######################
library("tidyverse")
library("magrittr")
library("shiny")
library("pixels")
library("e1071")

setwd("C:/Users/h_air/Documents/MEGAsync/CIMAT MCE/Semestre_2/Ciencia de Datos/Tareas/Tarea 2-20190215/Ejercicio 3")
getwd()
########################################
## Nota, el clasificador es del 0 al 9
########################################


######################
## Importando datos
######################
Xtrain <- read.table("mnistXtrain.dat", header = T, sep = "")
Xtrain %>% dim
Xtest <- read.table("mnistXtest.dat", header = T, sep = "")
Xtest %>% dim
Ytrain <- read.table("mnistYtrain.dat", header = T, sep = "")
Ytrain %>% dim
Ytest <- read.table("mnistYtest.dat", header = T, sep = "")
Ytest %>% dim
######################
## Guardando PCA
######################
datos <- prcomp(Xtrain) # componentes principales
saveRDS(datos, file = "my_data.rds")

######################
## Clasificador
######################


# rexportar pca
pc <- readRDS("my_data.rds")

# Seleccionar n�mero de componentes
j <- 100

# scores

entrenarScores <- pc$x
clasificador <- svm(as.factor(Ytrain$x) ~ .,
                    data = entrenarScores[,1:100], 
                    type = 'C-classification', 
                    kernel = 'radial',
                    gamma=0.03,
                    cost=1)


# regresi�n
#entrenamientoReg <-lm(ceroMatrix ~ entrenarScores[,1:j]-1, data=as.data.frame(entrenarScores)) # regresi�n sin constanate
# coeficientes
#entrenamientoCof <- entrenamientoReg$coefficients
# loadings
load <- pc$rotation[,1:100]                    

## incluye la ruta donde esta la carpeta con archivos server y ui
# corra aplicaci�n
runApp(appDir="C:/Users/h_air/Documents/MEGAsync/CIMAT MCE/Semestre_2/Ciencia de Datos/Tareas/Tarea 7/Tarea 7 Hairo Ulises Miranda Belmonte")
