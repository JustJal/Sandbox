has = {"Pepino","aguacate", "cebolla"}

A= io.read ()

while A ~= (has[1]) and A ~=  (has[2]) and A ~=  (has[3]) do 
    print ("El producto ingresado no se encuentra en el inventario")
    
    A= io.read ()
    
  end
  
if A == (has[1]) then 
  print ("El costo de ".. has[1] .. " es de 0.97$")
  
  
elseif A == (has[2]) then
  print (" El costo de ".. has[2].. " es de 0,67$")
  
  
elseif A == (has[3]) then 
  print ("El costo de ".. has[3].." es de 0,23$")
end 