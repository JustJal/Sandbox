function love.load ()
  
  love.keyboard.setKeyRepeat( true ) -- If this is set to true, the key will be pressed every frame. If it's set to false, it won't
  
  Total = 24
  player= {
    pos = {
      x = 5,
      y = 5
    },
    
    puntos = 0,
    
    color = {1, 1, 0, 1},
    name = "JustJal",
    
    control = {
      
      up = { 
        "up",
        "w"
      },
      
      down = { 
        "down",
        "s"
      },
      
      right = {
        "right",
        "d"
      },
      
      left = {
        "left",
        "a"
      }
    },
    
    move = {
      
      up = function ()
        return player.pos.x, player.pos.y - 1
      end,
      
      down = function ()
        return player.pos.x, player.pos.y + 1
      end,
      
      right = function ()
        return player.pos.x + 1, player.pos.y 
      end,
      
      left = function ()
        return player.pos.x - 1, player.pos.y
      end
    }
  }
  
  TileSize = 32
  
  Map = {
    
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 2, 1, 0, 0, 0, 0, 0, 1, 1, 2, 0, 0, 0, 1, 2, 0, 1, 2, 0, 0, 0, 1},
    {1, 0, 1, 2, 0, 0, 1, 2, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1},
    {1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 2, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1},
    {1, 1, 1, 1, 1, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 0, 1, 0, 0, 1},
    {1, 2, 0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 2, 1, 2, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 0, 1, 0, 0, 2, 1, 0, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1},
    {1, 2, 0, 1, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1},
    {1, 0, 0, 0, 2, 1, 0, 1, 2, 1, 1, 1, 1, 0, 2, 0, 2, 0, 0, 1, 0, 1, 1},
    {1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 2, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 2, 1},
    {1, 0, 1, 1, 1, 2, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 0, 1},
    {1, 0, 0, 2, 1, 0, 1, 1, 1, 0, 0, 1, 2, 0, 1, 0, 0, 1, 0, 1, 2, 0, 1},
    {1, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1},
    {1, 2, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 2, 1, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 3, 1},
    {4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1}
  }
end

function love.update (dt)
  
  --This is empty now. Because we previously used to check for user input, but now that has migrated over to love.keypressed at line 137
  
end 

  function love.draw ()
    
    for y,vy in ipairs (Map) do
      for x,vx in pairs (vy) do
        if vx == 1 then
          
          love.graphics.setColor(0, 0.5, 0.75, 1)
          
          love.graphics.rectangle("fill", x*TileSize, y*TileSize, TileSize, TileSize) 
          
        elseif vx == 0 then
          
           love.graphics.setColor(0, 0.325, 0.38, 1)
           love.graphics.rectangle("fill", x*TileSize, y*TileSize, TileSize, TileSize)
         elseif vx == 2 then
           
           love.graphics.setColor(0.5, 0, 0, 1)
           
           love.graphics.rectangle ("fill", x*TileSize, y*TileSize, TileSize, TileSize)
           
         elseif vx == 3 then
           
            love.graphics.setColor(0.5, 0.5, 0, 1)
          
           love.graphics.rectangle("fill", x*TileSize, y*TileSize, TileSize, TileSize) 
           
        end
        
      end
    end
    
    love.graphics.setColor(player.color)
    love.graphics.circle("fill", player.pos.x * TileSize+(TileSize/2), player.pos.y * TileSize+(TileSize/2), TileSize/2)
    
    love.graphics.print ("Puntaje ="..player.puntos.."/"..Total, 350, 10)
    
    love.graphics.print ("Hola! "..player.name, 32, 10)
    
    if win == true then
      
      love.graphics.print ("Gracias por jugar! Has Ganado!", 300, 580)
      
    end
    
    
    love.graphics.setColor(1, 1, 1, 1) --Not necessary i guess -- Absolutely necessary. Este color no se devuelve solo al final del frame.
end

function love.keypressed( key, scancode ) -- There's also function love.keyreleased( key, scancode )
  --This is different from love.keyboard.isDown becasuse isDown checks /every frame/. This only checks whether the key was pressed at a point in time or not. Not if its currently being pressed. But if isrepeat is set to true, the key will be "pressed" repeatedly
  
  for k,v in pairs (player.control) do
    for i, v1 in ipairs (v) do
      if ( key == v1) then
        
        local newx, newy = player.move[k]() -- These are only useful in this scope
        
        if Map[newy][newx] == 0  then
          
          player.pos.x = newx
          
          player.pos.y = newy
          
        elseif Map [newy][newx] == 2 then
          
          player.pos.x = newx
          
          player.pos.y = newy
          
          player.puntos = player.puntos + 1
          
          Map[newy][newx] = 1 -- I mean, what was the check for? plus, a variable will always equal itself in a ==
          
        end
        if player.puntos >= Total then
          
          if Map [newy][newx] == 3 then
            
            player.pos.x = newx
            
            player.pos.y = newy
            
            win = true
            
          end
        end
        
      end
    end
  end
  
end