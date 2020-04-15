function love.load ()
  x = 0
  y = 0
  fruits = {"pepino","manzana"}
  
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

function love.draw()
  love.graphics.rectangle ("line", x , y, 10, 10)
  love.graphics.circle ("fill", 300, 300, 10, 10)
  love.graphics.print(fruits[1], 100, 200)
  love.graphics.print(fruits[2], 100, 300)
  end