function love.load ()
  
  player1CurBullets = 10
  player2CurBullets = 10
  
  player1MaxBullets = 10
  player2MaxBullets = 10
  
  playeroneCheck = 1
  playertwoCheck = 2
  ArenaCheck =     3
  
    playerone = {
    
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
        shoot=  "space"
      }
    }
  
    playertwo = {
    
      color = {0.937, 0.722, 0.224,1},
     
        pos = {
       
        x = 550,
        y = 250
        }, 
      
      control={
        
        up=     "w",
        down=   "s",
        right=  "d",
        left=   "a",
        shoot=  "q"
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
    
    BulletOne={
      x=      0,
      y=      0,
      width=  10,
      height= 10
    }
    
    BulletTwo={
      x=      0,
      y=      0,
      width=  10,
      height= 10
    }
  end
  
    function love.update (dt)
    for k,v in pairs (playerone.control) do -- Movement for each player, ill do a different one for shooting
      
      if (love.keyboard.isDown (v)) then
          
        if v == "up" then
            
            playerone.pos.y = (playerone.pos.y - 350 * dt)
            
          elseif v == "down" then 
            
            playerone.pos.y = (playerone.pos.y + 350 * dt)
            
          elseif v == "right" then
            
            playerone.pos.x = (playerone.pos.x + 350 * dt)
            
          elseif v == "left" then
            
            playerone.pos.x = (playerone.pos.x - 350 * dt)
            
        end
      end
    end 
    for k,v in pairs (playertwo.control) do 
      
      if (love.keyboard.isDown (v)) then
          
        if v == "w" then
            
            playertwo.pos.y = (playertwo.pos.y - 350 * dt)
            
          elseif v == "s" then 
            
            playertwo.pos.y = (playertwo.pos.y + 350 * dt)
            
          elseif v == "d" then
            
            playertwo.pos.x = (playertwo.pos.x + 350 * dt)
            
          elseif v == "a" then
            
            playertwo.pos.x = (playertwo.pos.x - 350 * dt)
            
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
    
    for k,v in pairs (playerone.control) do
      if (love.keyboard.isDown (v)) and (love.keyboard.isDown ("space")) then --This is for shooting, basicly this part makes the position of the bullet the same as the player and with the boolean value starts the animation until the border of the arena. All of this using an statement if down there for each conditiion
        if v == "up" then
            
          BulletUp = true 
          BulletOne.x = playerone.pos.x + 15
          BulletOne.y = playerone.pos.y - 15
        end
        
        if v == "down" then 
            
          BulletDown = true
          BulletOne.x =   playerone.pos.x + 15
          BulletOne.y =   playerone.pos.y + 15
        end 
        
        if v == "right" then
          
          BulletRight = true
          BulletOne.x =   playerone.pos.x + 15
          BulletOne.y =   playerone.pos.y + 15
        end
        if v == "left" then
          
          BulletLeft = true
          BulletOne.x = playerone.pos.x + 15
          BulletOne.y = playerone.pos.y + 15
        end
      end
    end 
    
    if BulletUp == true then --These are the statements for the animation for each direction
      
      BulletOne.x = BulletOne.x 
      BulletOne.y = BulletOne.y - 500 *dt
      Bull1 =       true -- Used in print 
      BulletDown =  false -- It bugged when i runned it, so i decided to put this switches
      BulletRight = false
      BulletLeft =  false 
      
      if BulletOne.y <= Arena.car.y then
        
        Bull1 =       false
        BulletUp =    false
        BulletDown =  false
        BulletRight = false 
        BulletLeft =  false
      end
    end
    
    if BulletDown == true then
      
      BulletOne.x = BulletOne.x
      BulletOne.y = BulletOne.y + 500 *dt
      Bull1 =       true
      BulletUp =    false
      BulletRight = false
      BulletLeft =  false
      
      if BulletOne.y >= Arena.car.y + Arena.car.height then
        
        Bull1 =       false
        BulletDown =  false
        BulletUp =    false 
        BulletRight = false
        BulletLeft =  false 
      end 
    end
    
    if BulletRight == true then 
      
      BulletOne.x = BulletOne.x + 500 *dt
      BulletOne.y = BulletOne.y
      Bull1 =       true
      BulletUp =    false
      BulletDown =  false
      BulletLeft =  false
      
      if BulletOne.x >= Arena.car.x + Arena.car.width then
        
        Bull1 =       false
        BulletDown =  false
        BulletUp =    false 
        BulletRight = false
        BulletLeft =  false 
      end 
    end
    
    if BulletLeft == true then
      
      BulletOne.x = BulletOne.x - 500 *dt
      BulletOne.y = BulletOne.y
      Bull1 =       true
      BulletUp =    false
      BulletDown =  false
      BulletRight =  false
      
      if BulletOne.x <= Arena.car.x then
        
        Bull1 =       false
        BulletDown =  false
        BulletUp =    false 
        BulletRight = false
        BulletLeft =  false 
      end
    end
      for k,v in pairs (playertwo.control) do
      if (love.keyboard.isDown (v)) and (love.keyboard.isDown ("q")) then --Same but for player two
        if v == "w" then
            
          BulletW = true 
          BulletTwo.x = playertwo.pos.x + 15
          BulletTwo.y = playertwo.pos.y - 15
        end
        
        if v == "s" then 
            
          BulletS = true
          BulletTwo.x =   playertwo.pos.x + 15
          BulletTwo.y =   playertwo.pos.y + 15
        end 
        
        if v == "a" then
          
          BulletA = true
          BulletTwo.x =   playertwo.pos.x + 15
          BulletTwo.y =   playertwo.pos.y + 15
        end
        if v == "d" then
          
          BulletD = true
          BulletTwo.x = playertwo.pos.x + 15
          BulletTwo.y = playertwo.pos.y + 15
        end
      end
    end 
    
    if BulletW == true then --These are the statements for the animation for each direction, this time for player two
      
      BulletTwo.x = BulletTwo.x 
      BulletTwo.y = BulletTwo.y - 500 *dt
      Bull2 =       true -- Used in print 
      BulletS =     false 
      BulletD =     false
      BulletA =     false 
      
      if BulletTwo.y <= Arena.car.y then
        
        Bull2 =       false
        BulletW =     false
        BulletS =     false
        BulletD =     false 
        BulletA =     false
      end
    end
    
    if BulletS == true then
      
      BulletTwo.x = BulletTwo.x
      BulletTwo.y = BulletTwo.y + 500 *dt
      Bull2 =       true
      BulletW =     false
      BulletD =     false
      BulletA =     false
      
      if BulletTwo.y >= Arena.car.y + Arena.car.height then
        
        Bull2 =       false
        BulletS =     false
        BulletW =     false 
        BulletD =     false
        BulletA =     false 
      end 
    end
    
    if BulletD == true then 
      
      BulletTwo.x = BulletTwo.x + 500 *dt
      BulletTwo.y = BulletTwo.y
      Bull2 =       true
      BulletW =     false
      BulletS =     false
      BulletA =      false
      
      if BulletTwo.x >= Arena.car.x + Arena.car.width then
        
        Bull2 =       false
        BulletS =     false
        BulletW =     false 
        BulletD =     false
        BulletA =     false 
      end 
    end
    
    if BulletA == true then
      
      BulletTwo.x = BulletTwo.x - 500 *dt
      BulletTwo.y = BulletTwo.y
      Bull2 =       true
      BulletW =     false
      BulletS =     false
      BulletD =     false
      
      if BulletTwo.x <= Arena.car.x then
        
        Bull2 =       false
        BulletS =     false
        BulletW =     false 
        BulletD =     false
        BulletA =     false 
      end
    end
  end
  
  function love.draw ()
      if ArenaCheck == 3 then --I didnt know how to split this part of the code and when i used the table it didnt work, so i did different variables as checks
            
            love.graphics.setColor  (Arena.color)
            love.graphics.rectangle ("fill",Arena.car.x, Arena.car.y, Arena.car.width, Arena.car.height)
      end 
          
      if playeroneCheck == 1 then 
        
        love.graphics.setColor  (playerone.color)
        love.graphics.rectangle ("fill", playerone.pos.x, playerone.pos.y, 40, 40)
        
        if Bull1 == true then 
          love.graphics.setColor  (playerone.color)
          love.graphics.rectangle ("fill",BulletOne.x, BulletOne.y, BulletOne.width, BulletOne.height)
        end
      end 
      
      if playertwoCheck == 2 then
          
        love.graphics.setColor  (playertwo.color)
        love.graphics.rectangle ("fill",playertwo.pos.x, playertwo.pos.y, 40, 40)
        
        if Bull2 == true then 
          love.graphics.setColor  (playertwo.color)
          love.graphics.rectangle ("fill",BulletTwo.x, BulletTwo.y, BulletTwo.width, BulletTwo.height)
        end
      end
      
    
    end