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
  
  while Con ~= "yrgx2445" do

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