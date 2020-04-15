print ("Buen dia por favor ingrese la cantidad de alumnos a evaluar")
z= io.read ("*n")
AcumM = 0
AcumH = 0
AcumO = 0
for i = 1, z,  1 
do
  print()
  print ("Ingrese el sexo del alumno " ..i)
  print()
  print ("Femenino {1}")
  print("Masculino {2}")
  print("Otro {3}")
  a = io.read ('*n')
if a == 1 then
  print ("El alumno a estudiar es del sexo femenino")
  print ("Ingrese la nota acumalada por la alumna en el primer corte")
            A= io.read ('*n')
             while A > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  A = io.read ('*n')
end
  while A < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    A = io.read ('*n')
  end
print ("Excelente! Ahora ingresa la nota del segundo corte")
            B = io.read ('*n')
           while B > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  B = io.read ('*n')
end
  while B < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    B= io.read ('*n')
  end
print ("Ya casi estamos! Ingresa la nota del tercer corte")
print()
            C= io.read ('*n')
while C > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  C = io.read ('*n')
end
  while C < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    C = io.read ('*n')
  end
Prom = (A+B+C)/3
      if Prom >18 then
  print ((" Felicidades! Haz entrado al Cuadro de Honor con un promedio de %.1f"):format(Prom))
          else
              if  Prom < 10 then 
         print (("Debes esforzarte aun mas! Haz reprobado con %.1f"):format(Prom))
                  else
                   print ((" Muy bien! Sigue asi y trata de mejorar tu promedio %.1f"):format(Prom))
              end
      end
  AcumM = AcumM + 1
else
  if a == 2 then 
    print ("El alumno a estudiar es del sexo masculino")
  print ("Ingrese la nota acumalada por el alumno en el primer corte")
            A= io.read ('*n')
                     while A > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  A = io.read ('*n')
end
  while A < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    A = io.read ('*n')
  end
print ("Excelente! Ahora ingresa la nota del segundo corte")
            B = io.read ('*n')
           while B > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  B = io.read ('*n')
end
  while B < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    B= io.read ('*n')
  end
print ("Ya casi estamos! Ingresa la nota del tercer corte")
print()
            C= io.read ('*n')
while C > 20 do
  print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores menores a 20")
  C = io.read ('*n')
end
  while C < 0 do
    print ("El valor introducido no es valido en el sistema de notas por favor ingrese valores mayores a 0")
    C = io.read ('*n')
  end
Prom = (A+B+C)/3
      if Prom >18 then
  print (("Felicidades! Haz entrado al Cuadro de Honor con un promedio de %.1f"):format(Prom))
          else
              if  Prom < 10 then 
         print (("Debes esforzarte aun mas! Haz reprobado con %.1f"):format(Prom))
                  else
                   print (("Muy bien! Sigue asi y trata de mejorar tu promedio %.1f"):format(Prom))
              end
      end
  AcumH = AcumH+ 1
  
    end
end
end
print ("El numero total de alumnos es " ..z..", el numero de hombres es de " ..AcumH.. " , el numero de mujeres es de "..AcumM)
if AcumH > AcumM then
  print ("Las mujeres representan la minoria del salon con una diferencia de " ..(AcumH - (AcumM )) " alumnos")
else
  if AcumH < AcumM then 
  print ("Los hombres representan la minoria del salon con una diferencia de " ..(AcumM - (AcumH)) " alumnos")
else 
end
end