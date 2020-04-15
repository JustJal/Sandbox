print ("Calculadora de promedios")
print ("Ingrese la nota acumalada en el primer corte")
            primer = io.read ('*n')
print ("Excelente! Ahora ingresa la nota del segundo corte")
            Segun = io.read ('*n')
print ("Ya casi estamos!  Ingresa la nota del tercer corte")
            tercer = io.read ('*n')
A = primer
B = Segun
C = tercer
Prom = (A+B+C)/3
print (("Su promedio este trimestre es de %.1f"):format(Prom))
if Prom >18 then
  print ((" Felicidades! Haz entrado al Cuadro de Honor con un promedio de %.1f"):format(Prom))
    else
      if  Prom < 10 then 
         print (("Debes esforzarte aun mas! Has reprobado con %.1f"):format(Prom))
          else
                   print ((" Muy bien!, sigue asi y trata de mejorar tu promedio %.1f"):format(Prom))
      end
end