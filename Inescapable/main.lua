function love.load (aad)
    rectangulo ={}
end

 function create()
  Cua ={}
  Cua.x = 350
  Cua.y = 275
  Cua.width = 50
  Cua.height = 50
  Cua.x1=100
  Cua.x2=650
  Cua.y1 = 200
  Cua.y2 =350
  table.insert(rectangulo,Cua)
end

function love.update (Dt)
  
for i,v in ipairs (rectangulo) do
  
  if love.keyboard.isDown ("right") then 
    
  v.x = v.x + 100*Dt

elseif love.keyboard.isDown ("left") then 
  
  v.x = v.x - 100*Dt
  
elseif love.keyboard.isDown ("up") then
  
  v.y = v.y - 100 *Dt
  
elseif love.keyboard.isDown("down") then  
  
  v.y = v.y + 100*Dt
  
  end
end
for i,v in ipairs (rectangulo) do
  if v.x1 >= v.x then
    
    v.x = v.x1
    
    
  elseif v.x2 <= v.x then
    
    v.x = v.x2
    
    
  elseif v.y1 >= v.y then
    
    v.y = v.y1
    
    
  elseif v.y2 <= v.y then
    
    v.y = v.y2
   
  end
end
for i,v in ipairs (rectangulo) do
  
  if  v.x1 >= v.x and  v.y1 >= v.y then
  
  v.y = v.y1
   
  v.x = v.x1
  
elseif  v.y2 <= v.y and v.x1 >= v.x then

  v.y = v.y2
  
  v.x = v.x1

elseif v.x2 <= v.x and v.y1 >= v.y then
  
  v.x = v.x2
  
  v.y = v.y1
  
  
elseif v.x2 <= v.x and  v.y2 <= v.y then
  
  v.x = v.x2
   
  v.y = v.y2
  
  
end
end
end
function love.draw (asas)
  love.graphics.rectangle ("line",100 , 200 , 600,200)
for i,v in ipairs (rectangulo) do
    love.graphics.rectangle(mode, v.x ,v.y , v.width, v.height)
end
end

function love.keypressed(key)
  if key == ("space") then
    create()
  end
end
