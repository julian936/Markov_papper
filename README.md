# Traza Markov

Se realizo una interpretacion del articulo [1] y se implemnta un programa donde se muestra la traza de Markov.
El programa genera una traza en el tiempo de 20 ciclos en el deterioro a la salud que tienen 
pacientes con HIV sometidos a dos tratamientos. 

## Comenzando 🚀

Deacuerdo al articulo la matriz de transicion tiene se definen los sientes estados:

Estado A: Paciente con VIH positivo sin SIDA, con CD4 entre 200 y 500 células/mm3.
Estado B: Paciente con VIH positivo sin SIDA, con CD4 menor a 200 células/mm3.
Estado C: Paciente con VIH positivo diagnosticado con SIDA.
Estado D: Fallecimiento del paciente.

Cada tratamiento tiene una cadena de markov asociada:

### Matriz de transicion de monoterapia para el tratamiento del VIH, uso del medicamento Zidovudine (ZCV).

<p align="center">
  <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/T1.PNG">
</p>


### Matriz de transicion para el tratamiento combinado para el VIH, uso de los medicamentos Lamivudine (3TC) y Zidovudine (ZCV).

<p align="center">
  <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/T2.PNG">
</p>




<table class="default">

  <tr>

    <td>
<p align="center">
  <img width="350" height="300" src="https://github.com/julian936/Markov_papper/blob/master/images/RplotA.png">
</p>
</td>

    <td>Celda 2</td>

    <td>Celda 3</td>

  </tr>

  <tr>

    <td>Celda 4</td>

    <td>Celda 5</td>

    <td>Celda 6</td>

  </tr>

</table>


<center>
![Estado A](https://github.com/julian936/Markov_papper/blob/master/images/RplotA.png=100x20).
</center>
<center>
![Estado B](https://github.com/julian936/Markov_papper/blob/master/images/RplotB.png=100x20).
</center>
<center>
![Estado C](https://github.com/julian936/Markov_papper/blob/master/images/RplotC.png=100x20).
</center>
<center>
![Estado D](https://github.com/julian936/Markov_papper/blob/master/images/RplotD.png=100x20).
</center>
<center>
![salida tratamiento I](https://github.com/julian936/Markov_papper/blob/master/images/st1.PNG=100x20).
</center>
<center>
![salida tratamiento II](https://github.com/julian936/Markov_papper/blob/master/images/st2.PNG=100x20).
</center>


## Julian Rojas Ramirez ✒️

- [Github](https://github.com/julian936) - [Linkedin](https://www.linkedin.com/in/julian-rojas-ramirez-040a2552/)


## 📚 Bibliografia

 [1] Chancellor, J.V., Hill, A.M., Sabin, C.A. et al. Modelling the Cost Effectiveness of Lamivudine/Zidovudine Combination Therapy in HIV Infection. Pharmacoeconomics 12, 54–66 (1997). https://doi.org/10.2165/00019053-199712010-00006
