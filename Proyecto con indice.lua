 print ("Bienvenido por favor ingrese su usuario para ingresar al sistema")
print()
 print ("Ingrese su usuario")
 
  Usu = io.read ()
  
  acum= 0
  while Usu ~= "JustJal" do
    print()
    print(" El usuario es incorrecto")
    
    Usu = io.read ()
    
  end
  print ()
  print ("Ingrese la contraseña")
  
  Con = io.read()
  
  while Con ~= "pole" do

    print()
    print(" La contraseña es incorrecta")
    
    Con = io.read ()
    
    acum = acum + 1
    
    if acum == 3 then
      print (" Se te han acabado los intentos")
      break
      else 
    end
  
end

if acum == 3 then
  print ("Vuelve a iniciar el programa")
else 
  print ("Has iniciado sesion")
end

 Pro = {"Pepino", 0.97, "///", "Ojo de mandragora", 1000, "///", "Niño abandonado", 2000, "///", "El corazon de ella", 10000, "///", "A Fever You Cant Sweat Out", 35.32, "///", "Banana", 0.23,"///","Samsung S20 Ultra", 800, "///","Jal de bolsillo", 25000}

for a,b in ipairs(Pro) do
  print (a,b)
end

A = 0

while A == 0 do
print "Ingrese el numero correspondiente a la opcion a usar"
print ""
print "[1] Descripcion de los productos"
print "[2] Comprar"

A = io.read ("*n")

while A ~= 1 and A ~= 2 do
  
  print "El valor ingresado no coincide con una de las opciones"
  
  A = io.read ("*n")
  
end

B = io.read ()


while A == 1 do
    
  print "Ingrese el nombre del producto del cual desea saber su descripcion"
  
  B = io.read()
  
  while B ~= (Pro[1]) and B ~= (Pro[4]) and B ~= (Pro[7]) and B ~= (Pro[10]) and  B ~=(Pro[13]) and B ~= (Pro[16]) and B ~= (Pro[19]) and B ~= (Pro[22]) do
  
print()
print("El producto o caracteres ingresados no coincide con los productos")

B = io.read()

end
  
if B == (Pro[1]) then 
  
     print "Descripcion: Pepino"
     print "El pepino, vegetal versatil como ninguno, puedes usarlo para rellenar desde una grosera hamburguesa, hasta tu ensalada mas light o mascarilla para lucir mas bellx"
    print "Precio: 0.97$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
   Z = io.read ()
   
  elseif B == (Pro[4]) then 
    
    print "Descripcion: Ojo de Mandragora"
    print "La mandragora es un genero perteneciente a la subfamilia Solanoidae, tiene una peculiar forma de humano y pues hay algunas vivas... Mediante metodos definitivamente para nada torturosos, extrajimos ojos de las mismas..."
    print "Precio: 1000$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
     
  elseif B == (Pro[7]) then 
    
    print "Descripcion: Niño Abandonado"
    print "Un niño abandonado, necesita de alguien, amor, comida, todo lo que necesita un niño, diras, pero es un niño ponlo en adopcion, amigo, es internet lo siento..."
    print "Precio: 2000$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
     
   elseif B == (Pro[10]) then 
     
       print "Descripcion: El corazon de ella"
    print "Con corazon nos referimos a amor claro... Le pagaremos a una actriz que sea parecia a esa supuesta Ella. Para que te ame, porque admitamos, si estas comprando esto es porque de verdad estas desesperado..."
    print "Precio: 10000$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
    
   elseif B == (Pro[13]) then 
     
     print "Descripcion: A Fever You Cant Sweat Out"
    print "El mejor album de Panic! At The Disco, merece la pena comprarlo, es todo lo que podemos decir"
    print "Precio: 35.32$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
     
   elseif B == (Pro[16]) then 
     
    print "Descripcion: Banana"
    print "Solo es una banana, ya veras tu si te la comes o no..."
    print "Precio: 0.23$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
     
   elseif B == (Pro[19]) then
     
   print "Descripcion: Samsung S20 Ultra"
    print "El mejor Smartphone del mercado, potencia, calidad y una cmra que te deja ver hasta los malos pensamientos que tendras el siglo proximo, si despues de la muerte, con su zoom x100 no hay nada que se le escape a este monstruo"
    print "Precio: 800$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
     
   elseif B == (Pro[22]) then 
     
      print "Descripcion: Jal de bolsillo"
    print "Es Jal, puede ayudarte en lo que quieras, hasta presentar un examen por ti, es hetero, nada de cosas raras..."
    print "Precio: 25000$"
    print ()
    print()
    print "Ingrese 0 para salir al indice"
    print "Ingrese 1 para ver la descripcion de otro producto"
    
    A = io.read ("*n")
    
     Z = io.read ()
end
end
while A == 2 do 
  
  AcumP = 0
  
  print ()
print ()
print ("Ingrese la cantidad de productos que desea llevar")
print ("Precio dado en dolares")

n=io.read("*n")


while n <= 0 do
  print ("El valor esta por debajo del cero o es cero, por lo tanto, mas bien me debes. Tonto")
  
  n=io.read("*n")
  
end

Z =io.read ()

for i = 1, n, 1 do
  print()
  print()
print("Ingrese el nombre del producto nro ".. i .." que desea llevar, por favor respete mayusculas") 

B = io.read()

while B ~= (Pro[1]) and B ~= (Pro[4]) and B ~= (Pro[7]) and B ~= (Pro[10]) and  B ~=(Pro[13]) and B ~= (Pro[16]) and B ~= (Pro[19]) and B ~= (Pro[22]) do
  
print()
print("El producto o caracteres ingresados no coincide con los productos")

B = io.read()

end
if B == (Pro[1]) then 
    print()
    print ("Que cantidad de ".. Pro[1] .." desea llevar? Valor " .. Pro[2] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[2])
    
    AcumP = AcumP + cal
    
    
  elseif B == (Pro[4]) then 
      print ()
    print ("Que cantidad de ".. Pro[4] .." desea llevar? Valor " .. Pro[5] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[5])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[7]) then 
      print ()
    print ("Que cantidad de ".. Pro[7] .." desea llevar? Valor " .. Pro[8] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[8])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[10]) then 
      print ()
    print ("Que cantidad de ".. Pro[10] .." desea llevar? Valor " .. Pro[11] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[11])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[13]) then 
      print ()
    print ("Que cantidad de ".. Pro[13] .." desea llevar? Valor " .. Pro[14] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[14])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[16]) then 
      print ()
    print ("Que cantidad de ".. Pro[16] .." desea llevar? Valor " .. Pro[17] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[17])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[19]) then
    print ("Que cantidad de ".. Pro[19] .." desea llevar? Valor " .. Pro[20] .."$")
    
    s = io.read ()
    
    print ()
    print ("Excelente! Prosiga a escoger su siguiente producto")
    
    cal = s * (Pro[20])
    
    AcumP = AcumP + cal
    
     elseif B == (Pro[22]) then 
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
  break
else
  break
end
end
end 