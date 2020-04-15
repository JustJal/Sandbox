Pro = {"Pepino", 0.97, "///", "Ojo de mandragora", 1000, "///", "Niño abandonado", 2000, "///", "El corazon de ella", 10000, "///", "A Fever You Cant Sweat Out", 35.32, "///", "Banana", 0.23,"///","Samsung S20 Ultra", 800, "///","Jal de bolsillo", 25000}

AcumP = 0

for a,b in ipairs(Pro) do
  print (a,b)
end

print ()
print ()
print ("Ingrese la cantidad de productos que desea llevar")
print ("Precio dado en dolares")

n=io.read("*n")


while n < 0 do
  print ("El valor esta por debajo del cero, por lo tanto, mas bien me debes. Tonto")
  
  n=io.read("*n")
  
end
A =io.read ()
for i = 1, n, 1 do
  print()
  print()
print("Ingrese el nombre del producto nro ".. i .." que desea llevar, por favor respete mayusculas") 

A = io.read()

while A ~= (Pro[1]) and A ~= (Pro[4]) and A ~= (Pro[7]) and A ~= (Pro[10]) and  A ~=(Pro[13]) and A ~= (Pro[16]) and A ~= (Pro[19]) and A ~= (Pro[22]) do
  
print()
print("El producto o caracteres ingresados no coincide con los productos")

A = io.read()

end
if A == (Pro[1]) then 
    print()
    print ("Que cantidad de ".. Pro[1] .." desea llevar? Valor " .. Pro[2] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[2])
    
    AcumP = AcumP + cal
    
    
  elseif A == (Pro[4]) then 
      print ()
    print ("Que cantidad de ".. Pro[4] .." desea llevar? Valor " .. Pro[5] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[5])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[7]) then 
      print ()
    print ("Que cantidad de ".. Pro[7] .." desea llevar? Valor " .. Pro[8] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[8])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[10]) then 
      print ()
    print ("Que cantidad de ".. Pro[10] .." desea llevar? Valor " .. Pro[11] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[11])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[13]) then 
      print ()
    print ("Que cantidad de ".. Pro[13] .." desea llevar? Valor " .. Pro[14] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[14])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[16]) then 
      print ()
    print ("Que cantidad de ".. Pro[16] .." desea llevar? Valor " .. Pro[17] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[17])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[19]) then
    print ("Que cantidad de ".. Pro[19] .." desea llevar? Valor " .. Pro[20] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[20])
    
    AcumP = AcumP + cal
    
     elseif A == (Pro[22]) then 
      print ()
    print ("Que cantidad de ".. Pro[22] .." desea llevar? Valor " .. Pro[23] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[23])
    
    AcumP = AcumP + cal
end
end

print()
print ("El valor de su compra es de "..AcumP.."$")
print()

print ("¿Desea saber el valor en bolivares?")

print()
print ("Presione 1 para saber el valor")
print ("Presione cualquier numero para culminar el programa")

de = io.read ("*n")


if de == 1 then
  print()
  print("Ingrese la tasa de cambio actual")
  print ()
  
  tasa = io.read ("*n")
  
  valor = AcumP * tasa
  
  print ("El valor en dolares es "..AcumP.."$ y en bolivares es "..valor.." BS")
else
  end