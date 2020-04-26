function love.load ()
  
  require 'Utilities'
  
  love.keyboard.setKeyRepeat( true ) -- If this is set to true, the key will be pressed every frame. If it's set to false, it won't
  
  io.stdout:setvbuf("no") --Disables console output buffering (Makes the output from "print" appear immediately on console)
  
  Total = 24
  player= {
    
    pos = {
      real = {
        x = 0,
        y = 0
      },
      goal = {
        x = 5,
        y = 5
      }
    },
    
    speed = 0.1,
    
    direction = "",
    
    puntos = 0,
    
    color = {bytecolor(235), bytecolor(223), bytecolor(20), 1},
    name = "DiegoG",
    
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
        return player.pos.goal.x, player.pos.goal.y - 1
      end,
      
      down = function ()
        return player.pos.goal.x, player.pos.goal.y + 1
      end,
      
      right = function ()
        return player.pos.goal.x + 1, player.pos.goal.y 
      end,
      
      left = function ()
        return player.pos.goal.x - 1, player.pos.goal.y
      end
      
    }
  }
  
  player.move[""] = function ()
    return player.pos.goal.x, player.pos.goal.y
  end
  
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
  
  if player.pos.real.x == player.pos.goal.x and player.pos.real.y == player.pos.goal.y then
    checkCell(player.move[player.direction]())
  else
    if player.pos.real.x ~= player.pos.goal.x then
      if player.pos.real.x > player.pos.goal.x then
        player.pos.real.x = player.pos.real.x - player.speed
      else
        player.pos.real.x = player.pos.real.x + player.speed
      end
    end
    if player.pos.real.y ~= player.pos.goal.y then
      if player.pos.real.y > player.pos.goal.y then
        player.pos.real.y = player.pos.real.y - player.speed
      else
        player.pos.real.y = player.pos.real.y + player.speed
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
    love.graphics.circle("fill", player.pos.real.x * TileSize+(TileSize/2), player.pos.real.y * TileSize+(TileSize/2), TileSize/2)
    
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
        
        player.direction = k
        
        checkCell(player.move[k]())
        
      end
    end
  end
  
end

function checkCell(x,y)
  
  if Map[y][x] == 0  then
    
    player.pos.goal.x = x
    player.pos.goal.y = y
    
  elseif Map [y][x] == 2 then
    
    player.pos.goal.x = x
    
    player.pos.goal.y = y
    
    player.puntos = player.puntos + 1
    
    Map[y][x] = 1 -- I mean, what was the check for? plus, a variable will always equal itself in a ==
  end
  
  if player.puntos >= Total then
    
    if Map [y][x] == 3 then
      
      player.pos.goal.x = x
      
      player.pos.goal.y = y
      
      win = true
      
    end
    
  end
  
end