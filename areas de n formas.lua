stop = 0

function areac(A)
  
 result = A *A
 
 return result
end

function areat (B,C)
  
  area = ((B * C) / 2)
  
  return area 
end

print ("Ingrese la cantidad de areas a calcular")
  
  n = io.read ("*n")
  
  while n ~= stop do
    print ()
    print ("Ingrese el numero correspondiente segun el area que desea calcular")
    print ()
    print ("Triangulo {1}")
    print ("Cuadrado {2}")
    
    z = io.read ("*n")
    
    if z == 2 then
    
     print ()
     print ("Ingrese el valor de uno de los lados del cuadrado")

     A = io.read ("*n")
     
  while A < 0 do 
  print()
  print ("El valor ingresado es negativo, por favor ingrese un valor mayor a 0")
  
  A = io.read ("*n")
  
  print()
end

     print ("El area del cuadrado es " ..areac(A))
     
     stop = stop + 1
     
   elseif z == 1 then
     
     print ()
     print ("Ingrese el valor de la base y la altura del triangulo respectivamente")

     B= io.read ("*n")
     C = io.read ("*n")
     
  while (B < 0 or C < 0) do
  print()
  print ("El valor ingresado es negativo, por favor ingrese un valor mayor a 0")
  
  B= io.read ("*n")
  C = io.read ("*n")
  print()
  end
     print ("El area del triangulo es " ..areat(B,C))
     
     stop = stop + 1
   else
     print ()
     print ("Ingrese un valor correspondiente a los estipulados")
   end
 end
