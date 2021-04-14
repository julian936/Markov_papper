#Paper: Modelling the Cost Effectiveness of Lamivudine/Zidovudine
#Combination Therapy in HIV Infection

#oprimir ctrl+A y luego oprimir ctrol+Enter para ejecutar
#la funcion final es la encargada de imprimir la matris recive t1 o t2
#por ejemplo: final(t1)
#para graficar debes invocar esta funcion -> grafica(t1,t2,"D")
#recibe las dos matrices de transicion y un estado (A,B,C,D)

#borra objetos
rm(list = ls())

#Parametros
filas<-20
columnas<-6
escalar<-1000

#riesgo relativo
rr=.509


#tratamiento 1
t1<-matrix(c(.721, 0,     0,     0,
            0.202, 0.581, 0,     0,
            0.067, 0.407, 0.75,  0,
            0.01, 0.012, 0.25,  1), nrow=4, ncol=4, byrow=F,dimnames=list(c("State A", "State B", "State C", "State D"), c("State A", "State B", "State C", "State D")))


#tratamiento 2
t2<-matrix(c(1-(0.202+0.067+0.010)*rr, 0.000,0.000,0.000,
             0.202*rr, 1-(0.407+0.012)*rr,0.000,0.000,
             0.067*rr,0.407*rr,1-0.250*rr, 0.000,
             0.010*rr, 0.012*rr,0.250*rr,1), nrow=4, ncol=4, byrow=F,dimnames=list(c("State A", "State B", "State C", "State D"), c("State A", "State B", "State C", "State D")))


#Funcion que genera la matriz de potencia de tamaño que se puede parametrizar, (f:numero de filas, c:numero columnas, e:escalar)
generaMatriz <- function(m1,f,e){
  a<-matrix(0,4,4)
  a<-m1
  out <- matrix(0,f,6,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))
  for(x in 1:f){
    an<-elevado(a,x)
      for(y in 1:dim(an)[1]){
        out[x,y+1] <- (1000*an[1,y])
    }  
  }
  out
}

#Funcion que multiplica n veces una matriz,(A:matriz de entrada, n:potencia)
elevado <- function(A,n){
  if(dim(A)[1]==dim(A)[2] && n>1){
    aux <- A
    j <- 1
    repeat{
      A <- A%X%aux
      j <- j + 1
      if(j==n){break}
    }
    A
  }else # n==1
    A  
}


#Funcion que multiplica n veces una matriz,(x: matriz 1, y:matriz 2 )
"%X%" <- function(x,y){
  n <- dim(x)[1]
  res <- matrix(0,n,n)
  for(i in 1:n){
    for(j in 1:n){
      res[i,j] <- sum(x[i,]*y[,j])
    }
  }
  res
}
