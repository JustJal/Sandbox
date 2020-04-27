function love.load ()
  
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
        for i=player.pos.y, goal.up , 0.1 do
          
          player.pos.x = player.pos.x
          player.pos.y = player.pos.y - i
          
          return player.pos.x, player.pos.y
        end 
      end,
      
      down = function ()
        return player.pos.x, (player.pos.y + 1) 
      end,
      
      right = function ()
        return (player.pos.x + 1), player.pos.y 
      end,
      
      left = function ()
        return (player.pos.x - 1) , player.pos.y
      end
    }
  }
  goal = {
       up     = player.pos.y - 1,
       down   = player.pos.y + 1,
       right  = player.pos.x + 1,
       left   = player.pos.x - 1
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

function love.update ()
   for k,v in pairs (player.control) do
    for i, v1 in ipairs (v) do
      if ( love.keyboard.isDown(v1)) then
        
        local newx, newy = player.move[k]()
        
        if Map[newy][newx] == 0  then
          
          player.pos.x = newx 
          
          player.pos.y = newy 
          
        elseif Map [newy][newx] == 2 then
          
          player.pos.x = newx
          
          player.pos.y = newy
          
          player.puntos = player.puntos + 1
          
          Map[newy][newx] = 1 
          
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
    love.graphics.circle("fill", player.pos.x * TileSize+(TileSize/2) , player.pos.y * TileSize+(TileSize/2) , TileSize/2)
    
    love.graphics.print ("Puntaje ="..player.puntos.."/"..Total, 350, 10)
    
    love.graphics.print ("Hola! "..player.name, 32, 10)
    
    if win == true then
      
      love.graphics.print ("Gracias por jugar! Has Ganado!", 300, 580)
      
    end
    
    
    love.graphics.setColor(1, 1, 1, 1) --Not necessary i guess -- Absolutely necessary. Este color no se devuelve solo al final del frame.
end