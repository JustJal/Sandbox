
function max(A,B)
  
  if A > B then
  result = A
  
elseif A < B then
  result = B
  
else 
  
  print ("Los numeros son iguales")
  
end
return result
end

print ("Ingrese el valor Nro 1")
A = io.read ("*n")

print ("Ingrese el valor Nro 2")
B = io.read ("*n")

print ("El mayor valor entre los dos es "..max(A,B))

  