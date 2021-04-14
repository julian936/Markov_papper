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


#Matriz Salida

final<-function(tratamiento){
  
  nf<-filas+1
  
  mAux<-matrix(0, nrow=filas, ncol=columnas, byrow=F,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))
  
  mp1<-matrix(0, nrow=nf, ncol=columnas, byrow=F,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))
  out1<-matrix(0, nrow=nf, ncol=columnas, byrow=F,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))
  
  mAux<-generaMatriz(tratamiento,filas,escalar)
  
  mp1[1,2]<-1000
  
  for(x in 2:nf){
    for(y in 1:6){
      mp1[x,y]<-mAux[x-1,y]
    }
  }
  
  for(x in 1:nf){
    mp1[x,6]<- round(mp1[x,2]+mp1[x,3]+ mp1[x,4]+  mp1[x,5])
  }
  
  for(x in 2:nf){
    mp1[x,1]<-x-1
  }
  
  
  for(x in 1:nf){
    for(y in 1:6){
      out1[x,y]<-round(mp1[x,y])
    }
  }
  out1 
}

#Arma la matriz final resultante
graficat1<-matrix(0, nrow=filas, ncol=columnas, byrow=F,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))
graficat2<-matrix(0, nrow=filas, ncol=columnas, byrow=F,dimnames=list(c(),c("Cycle","State A", "State B", "State C", "State D", "Total")))


grafica<-function(m1,m2,estado){  
    varaux<-0
    if(estado=="A"){
      posx<-16
      posy<-600
      varaux<-2
      titulo="Estado A en Tratamiento I vs II"
    }
    if(estado=="B"){
      varaux<-3
      posx<-17
      posy<-240
      titulo="Estado B en Tratamiento I vs II"
    }
    if(estado=="C"){
      varaux<-4
      posx<-18
      posy<-360
      titulo="Estado C en Tratamiento I vs II"
    }
    if(estado=="D"){
      varaux<-5
      posx<-17
      posy<-250
      titulo="Estado D en Tratamiento I vs II"
    }
    if(varaux==0){
      "Ingrese la letra A,B,C o D"
    }
    else{
        graficat1<-final(m1)
        graficat2<-final(m2)
        x <- graficat1[,1]
        y <- graficat1[,varaux]
        q <- graficat2[,1]
        p <- graficat2[,varaux]
        par(mfrow = c(1, 1))
        plot(x,y,type = "b",main = titulo,
             xlab = "Years", ylab = "Surviving patients")
        lines(q, p, type = "b",col="green", pch = 22)
        legend(posx,posy, legend=c("T2", "T1"),
               col=c("green", "black"), lty=1:1, cex=0.8,)
    }
}
grafica(t1,t2,"C")
final(t1)
final(t2)
