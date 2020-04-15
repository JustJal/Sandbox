function love.load ()
  rectangles ={}
end

function create()

  rect= {}
  rect.x = 100
  rect.y = 100
  rect.width =100
  rect.height = 100
  rect.speed= 100
  
  
  table.insert(rectangles, rect)
  end


  
function love.keypressed (key)
  if key == "space" then
    create()
  end
end

function love.update (Dt)
  for i,v in ipairs(rectangles) do
    v.x = v.x + v.speed * Dt
  end
end

function love.draw (Dt)
  for i,v in ipairs(rectangles) do
    love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
  end
  end