function love.load ()
  
  playeroneCheck = 1
  
  playertwoCheck = 2
  
  ArenaCheck = 3
  
  playerone = {
    
    MaxBullets = {10},
    
    color = {0.902, 0.31, 0.141, 1},
    
    pos = {
      
      x = 200,
      y = 250
    },
    control ={
      
      up=     "up",
      down=   "down",
      right=  "right",
      left=   "left",
      attack= "space"
    }
  }
  
  playertwo = {
    
    MaxBullets={10},
    
    color = {0.937, 0.722, 0.224,1},
     
      pos = {
       
       x = 600,
       y = 250
      }, 
      
      control={
        
        up=     "w",
        down=   "s",
        right=  "d",
        left=   "a",
        attack= "q"
      }
    }
    
    Arena = {
      car={
      x=      50,
      y=      50,
      width=  700,
      height= 500
    },
      color= {0.263, 0.631, 0.525, 1}  
    }
    
  end
  
  function love.update (dt)
    for k,v in pairs (playerone.control) do -- Movement for each player, ill do a different one for shooting
      
      if (love.keyboard.isDown (v)) then
          
        if v == "up" then
            
            playerone.pos.y = (playerone.pos.y - 500 *dt)
            
          elseif v == "down" then 
            
            playerone.pos.y = (playerone.pos.y + 500 * dt)
            
          elseif v == "right" then
            
            playerone.pos.x = (playerone.pos.x + 500 * dt)
            
          elseif v == "left" then
            
            playerone.pos.x = (playerone.pos.x - 500 * dt)
            
        end
      end
    end 
    for k,v in pairs (playertwo.control) do 
      
      if (love.keyboard.isDown (v)) then
          
        if v == "w" then
            
            playertwo.pos.y = (playertwo.pos.y - 500 *dt)
            
          elseif v == "s" then 
            
            playertwo.pos.y = (playertwo.pos.y + 500 * dt)
            
          elseif v == "d" then
            
            playertwo.pos.x = (playertwo.pos.x + 500 * dt)
            
          elseif v == "a" then
            
            playertwo.pos.x = (playertwo.pos.x - 500 * dt)
            
        end
      end
    end 
    
    if playerone.pos.x <= Arena.car.x then -- This long code over there is for checking if the player is in the arena or not. This part is just for the walls 
    
        playerone.pos.x = Arena.car.x 
      
          elseif playerone.pos.x >= Arena.car.x + Arena.car.width - 40 then
      
            playerone.pos.x = Arena.car.x + Arena.car.width - 40
      
              elseif playerone.pos.y <= Arena.car.y then
      
                playerone.pos.y = Arena.car.y
      
                elseif playerone.pos.y >= Arena.car.y + Arena.car.height - 40 then
            
                  playerone.pos.y = Arena.car.y + Arena.car.height - 40
            
    end        
    
    if (playerone.pos.x <= Arena.car.x ) and (playerone.pos.y <= Arena.car.y) then --This part is for the corners
            
        playerone.pos.x = Arena.car.x 
        playerone.pos.y = Arena.car.y
            
          elseif (playerone.pos.x <= Arena.car.x ) and (playerone.pos.y >= Arena.car.y + Arena.car.height - 40) then
            
            playerone.pos.x =  Arena.car.x 
            playerone.pos.y = (Arena.car.y + Arena.car.height - 40)
      
              elseif (playerone.pos.x >= Arena.car.x + Arena.car.width - 40) and (playerone.pos.y <= Arena.car.y) then
        
                playerone.pos.x = (Arena.car.x + Arena.car.width - 40)
                playerone.pos.y =  Arena.car.y
        
                  elseif (playerone.pos.x >= Arena.car.x + Arena.car.width - 40) and (playerone.pos.y >= Arena.car.y + Arena.car.height - 40) then
                  
                    playerone.pos.x = (Arena.car.x + Arena.car.width - 40)
                    playerone.pos.y = (Arena.car.y + Arena.car.height - 40)
    end 
    
    if playertwo.pos.x <= Arena.car.x then -- Same thing but for player two
    
        playertwo.pos.x = Arena.car.x 
      
          elseif playertwo.pos.x >= Arena.car.x + Arena.car.width - 40 then
      
            playertwo.pos.x = Arena.car.x + Arena.car.width - 40
      
              elseif playertwo.pos.y <= Arena.car.y then
      
                playertwo.pos.y = Arena.car.y
      
                elseif playertwo.pos.y >= Arena.car.y + Arena.car.height - 40 then
            
                  playertwo.pos.y = Arena.car.y + Arena.car.height - 40
            
    end        
    
    if (playertwo.pos.x <= Arena.car.x ) and (playertwo.pos.y <= Arena.car.y) then
            
        playertwo.pos.x = Arena.car.x 
        playertwo.pos.y = Arena.car.y
            
          elseif (playertwo.pos.x <= Arena.car.x ) and (playertwo.pos.y >= Arena.car.y + Arena.car.height - 40) then
            
            playertwo.pos.x =  Arena.car.x 
            playertwo.pos.y = (Arena.car.y + Arena.car.height - 40)
      
              elseif (playertwo.pos.x >= Arena.car.x + Arena.car.width - 40) and (playertwo.pos.y <= Arena.car.y) then
        
                playertwo.pos.x = (Arena.car.x + Arena.car.width - 40)
                playertwo.pos.y =  Arena.car.y
        
                  elseif (playertwo.pos.x >= Arena.car.x + Arena.car.width - 40) and (playertwo.pos.y >= Arena.car.y + Arena.car.height - 40) then
                  
                    playertwo.pos.x = (Arena.car.x + Arena.car.width - 40)
                    playertwo.pos.y = (Arena.car.y + Arena.car.height - 40)
    end 
  end
  
  function love.draw ()
      if ArenaCheck == 3 then --I didnt know how to split this part of the code and when i used the table it didnt work, so i did different variables as checks
            
            love.graphics.setColor  (Arena.color)
            love.graphics.rectangle ("fill",Arena.car.x, Arena.car.y, Arena.car.width, Arena.car.height)
      end 
          
      if playeroneCheck == 1 then -- 
        
        love.graphics.setColor  (playerone.color)
        love.graphics.rectangle ("fill", playerone.pos.x, playerone.pos.y, 40, 40)
      end 
      
      if playertwoCheck == 2 then
          
        love.graphics.setColor  (playertwo.color)
        love.graphics.rectangle ("fill",playertwo.pos.x, playertwo.pos.y, 40, 40)
      end
      
    end