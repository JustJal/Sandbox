function love.load (ala)
  x = 0
  y = 0
end

function love.update (Dt)
  
  if love.keyboard.isDown ("right") then 
  x = x + 100 * Dt 
  
elseif love.keyboard.isDown ("left") then 
x = x - 100 * Dt

elseif love.keyboard.isDown ("up") then
  y = y - 100 * Dt
  
elseif love.keyboard.isDown("down") then  
y = y + 100 * Dt

  end
end

function love.draw (ada)
  love.graphics.rectangle ("line", x , y , 200, 150)
end