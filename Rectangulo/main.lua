function love.load (ala)
  x = 100
end

function love.update (Dt)
  if x < 600 then 
  
  x = x + 100 * Dt 
  
  end
end

function love.draw (ada)
  love.graphics.rectangle ("line", x , 150, 200, 150)
  end