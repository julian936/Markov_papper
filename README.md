# Traza Markov

Se realizo una interpretacion del articulo [1] y se implemnta un programa donde se muestra la traza de Markov.
El programa genera una traza en el tiempo de 20 ciclos en el deterioro a la salud que tienen 
pacientes con HIV sometidos a dos tratamientos. 

## 🤓 Comenzando 

Deacuerdo al articulo la matriz de transicion tiene se definen los sientes estados:

Estado A: Paciente con VIH positivo sin SIDA, con CD4 entre 200 y 500 células/mm3.
Estado B: Paciente con VIH positivo sin SIDA, con CD4 menor a 200 células/mm3.
Estado C: Paciente con VIH positivo diagnosticado con SIDA.
Estado D: Fallecimiento del paciente.

Cada tratamiento tiene una cadena de markov asociada:

<table style="text-align:center;">
  <tr>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/T1.PNG"></td>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/T2.PNG"></td>
   </tr> 
   <tr>
      <td><b>Tratamiento I.</b> Matriz de transicion de monoterapia para el tratamiento del VIH, uso del medicamento Zidovudine (ZCV).</td>
      <td><b>Tratamiento II.</b> Matriz de transicion para el tratamiento combinado para el VIH, uso de los medicamentos Lamivudine (3TC) y Zidovudine (ZCV).</td>
  </tr>
</table>


## 🚀 Resultados 



<table style="text-align:center;">
  <tr>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/RplotA.png"></td>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/RplotB.png"></td>
   </tr> 
   <tr>
      <td><b>Tratamiento I.</b> AAAAAAAAAAAA</td>
      <td><b>Tratamiento II.</b> BBBBBBBBBBBB</td>
  </tr>
  <tr>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/RplotC.png"></td>
      <td> <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/RplotD.png"></td>
   </tr> 
   <tr>
      <td><b>Tratamiento I.</b> CCCCCCCCCCCCCCCC </td>
      <td><b>Tratamiento II.</b> DDDDDDDDDDDDDDD  </td>
  </tr>
</table>



## 🚀 Resultados 



</center>
<center>
![salida tratamiento I](https://github.com/julian936/Markov_papper/blob/master/images/st1.PNG).
</center>
<center>
![salida tratamiento II](https://github.com/julian936/Markov_papper/blob/master/images/st2.PNG).
</center>


## ✒️ Julian Rojas Ramirez 

- [Github](https://github.com/julian936) - [Linkedin](https://www.linkedin.com/in/julian-rojas-ramirez-040a2552/)


## 📚 Bibliografia

 [1] Chancellor, J.V., Hill, A.M., Sabin, C.A. et al. Modelling the Cost Effectiveness of Lamivudine/Zidovudine Combination Therapy in HIV Infection. Pharmacoeconomics 12, 54–66 (1997). https://doi.org/10.2165/00019053-199712010-00006
