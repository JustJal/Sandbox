function love.load ()
  playeroneCheck = 1
  playertwoCheck = 2
  ArenaCheck =     3
  Wall1Check =     4
  Wall2Check =     5
  Wall3Check =     6
  
  PlayerSpeed = 350
  BulletSpeed = 500
  
    playerone = {
    
      color = {0.902, 0.31, 0.141, 1},
    
      pos = {
      
        x = 55,
        y = 500
      },
      
      width=  40,
      
      height= 40,
      
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
       
        x = 690,
        y = 60
      }, 
      
      width=  40,
      
      height= 40,
      
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
      x=      800,
      y=      600,
      width=  10,
      height= 10
    }
    
    BulletTwo={
      x=      0,
      y=      0,
      width=  10,
      height= 10
    }
    
    Wall1={
      x=       150,
      y=       100,
      width=   30,
      height=  400
    }
    
    Wall2={
      x=       625,
      y=       100,
      width=   30,
      height=  400
    }
    
     Wall3={
      x=       225,
      y=       250,
      width=   355,
      height=  50
    }
  
  end
  
  function love.update (dt)

    for k,v in pairs (playerone.control) do -- Movement for each player, ill do a different one for shooting
      
      if (love.keyboard.isDown (v)) then
          
        if v == "up" then
            
          playerone.pos.y = (playerone.pos.y - PlayerSpeed * dt)
          
          direction1 = "up"
          
          elseif v == "down" then 

            playerone.pos.y = (playerone.pos.y + PlayerSpeed * dt)
            
            direction1 = "down"
            
            elseif v == "right" then

              playerone.pos.x = (playerone.pos.x + PlayerSpeed * dt)
              
              direction1 = "right"
          
            elseif v == "left" then

                playerone.pos.x = (playerone.pos.x - PlayerSpeed * dt)
                
                direction1 = "left"
                
        end
      end
    end 
  
    for k,v in pairs (playertwo.control) do 
      
      if (love.keyboard.isDown (v)) then
          
        if v == "w" then
            
            playertwo.pos.y = (playertwo.pos.y - PlayerSpeed * dt)
            
            direction2 = "w"
            
            elseif v == "s" then 
            
              playertwo.pos.y = (playertwo.pos.y + PlayerSpeed * dt)
              
              direction2 = "s"
            
              elseif v == "d" then
            
                playertwo.pos.x = (playertwo.pos.x + PlayerSpeed * dt)
                
                direction2 = "d"
            
                elseif v == "a" then
            
                  playertwo.pos.x = (playertwo.pos.x - PlayerSpeed * dt)
                  
                  direction2 = "a"
            
        end
      end
    end 
    
    CheckPos (playerone,Arena)
    
    CheckPos (playertwo,Arena)
      
      if (love.keyboard.isDown ("space")) then --This is for shooting, basicly this part makes the position of the bullet the same as the player and with the boolean value starts the animation until the border of the arena. All of this using an statement if down there for each conditiion
        if direction1 == "up" then
            
          BulletUp = true 
          BulletOne.x = playerone.pos.x + 15
          BulletOne.y = playerone.pos.y + 15
        end
        
        if direction1 == "down" then 
            
          BulletDown = true
          BulletOne.x =   playerone.pos.x + 15
          BulletOne.y =   playerone.pos.y + 15
        end 
        
        if direction1 == "right" then
          
          BulletRight = true
          BulletOne.x =   playerone.pos.x + 15
          BulletOne.y =   playerone.pos.y + 15
        end
        if direction1 == "left" then
          
          BulletLeft = true
          BulletOne.x = playerone.pos.x + 15
          BulletOne.y = playerone.pos.y + 15
        end
      end

      if BulletUp == true then --These are the statements for the animation for each direction
      
      BulletOne.x = BulletOne.x 
      BulletOne.y = BulletOne.y - BulletSpeed *dt
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
      BulletOne.y = BulletOne.y + BulletSpeed *dt
      Bull1 =       true
      BulletUp =    false
      BulletRight = false
      BulletLeft =  false
      
      if BulletOne.y >= Arena.car.y + Arena.car.height then
        
        Bull1 =       false
        BulletUp =    false
        BulletDown =  false
        BulletRight = false 
        BulletLeft =  false
      end 
    end
    
    if BulletRight == true then 
      
      BulletOne.x = BulletOne.x + BulletSpeed *dt
      BulletOne.y = BulletOne.y
      Bull1 =       true
      BulletUp =    false
      BulletDown =  false
      BulletLeft =  false
      
      if BulletOne.x >= Arena.car.x + Arena.car.width then
        
        Bull1 =       false
        BulletUp =    false
        BulletDown =  false
        BulletRight = false 
        BulletLeft =  false
      end 
    end
    
    if BulletLeft == true then
      
      BulletOne.x = BulletOne.x - BulletSpeed *dt
      BulletOne.y = BulletOne.y
      Bull1 =       true
      BulletUp =    false
      BulletDown =  false
      BulletRight = false
      
      if BulletOne.x <= Arena.car.x then
        
        BullDraw =    false
        BulletUp =    false
        BulletDown =  false
        BulletRight = false 
        BulletLeft =  false 
      end
    end
   
      if love.keyboard.isDown ("q") then --Same but for player two
        
        if direction2 == "w" then
            
          BulletW = true 
          BulletTwo.x = playertwo.pos.x + 15
          BulletTwo.y = playertwo.pos.y + 15
        end
        
        if direction2 == "s" then 
            
          BulletS = true
          BulletTwo.x =   playertwo.pos.x + 15
          BulletTwo.y =   playertwo.pos.y + 15
        end 
        
        if direction2 == "a" then
          
          BulletA = true
          BulletTwo.x =   playertwo.pos.x + 15
          BulletTwo.y =   playertwo.pos.y + 15
        end
        if direction2 == "d" then
          
          BulletD = true
          BulletTwo.x = playertwo.pos.x + 15
          BulletTwo.y = playertwo.pos.y + 15
        end
      end
    
  if BulletW == true then --These are the statements for the animation for each direction
      
      BulletTwo.x = BulletTwo.x 
      BulletTwo.y = BulletTwo.y - BulletSpeed *dt
      Bull2 =    true -- Used in print 
      BulletS =  false -- It bugged when i runned it, so i decided to put this switches
      BulletD =  false
      BulletA =  false 
      
      if BulletTwo.y <= Arena.car.y then
        
        Bull2 =    false
        BulletW =  false
        BulletS =  false
        BulletD =  false 
        BulletA =  false
      end
    end
    
    if BulletS == true then
      
      BulletTwo.x = BulletTwo.x
      BulletTwo.y = BulletTwo.y + BulletSpeed *dt
      Bull2 =    true
      BulletW =  false
      BulletD =  false
      BulletA =  false
      
      if BulletTwo.y >= Arena.car.y + Arena.car.height then
        
        Bull2 =    false
        BulletW =  false
        BulletS =  false 
        BulletD =  false
        BulletA =  false 
      end 
    end
    
    if BulletD == true then 
      
      BulletTwo.x = BulletTwo.x + BulletSpeed *dt
      BulletTwo.y = BulletTwo.y
      Bull2 =    true
      BulletW =  false
      BulletS =  false
      BulletA =  false
      
      if BulletTwo.x >= Arena.car.x + Arena.car.width then
        
        Bull2 =    false
        BulletW =  false
        BulletS =  false 
        BulletD =  false
        BulletA =  false 
      end 
    end
    
    if BulletA == true then
      
      BulletTwo.x = BulletTwo.x - BulletSpeed *dt
      BulletTwo.y = BulletTwo.y
      Bull2 =    true
      BulletW =  false
      BulletS =  false
      BulletD =  false
      
      if BulletTwo.x <= Arena.car.x then
        
        Bull2 =    false
        BulletW =  false
        BulletS =  false 
        BulletD =  false
        BulletA =  false 
      end
    end
    
    if  BulletTwo.x <= playerone.pos.x + playerone.width    and 
        BulletTwo.x >= playerone.pos.x                      and 
        BulletTwo.y <= playerone.pos.y + playerone.height   and 
        BulletTwo.y >= playerone.pos.y                      then --This is a check for the bullet. It tells you if the bullet hit the enemy or not. Player 2 wins
      
      Win2()
      
    end
    
    if  BulletOne.x <= playertwo.pos.x + playertwo.width  and 
        BulletOne.x >= playertwo.pos.x                    and 
        BulletOne.y <= playertwo.pos.y + playertwo.height and 
        BulletOne.y >= playertwo.pos.y                    then --This is a check for the bullet. It tells you if the bullet hit the enemy or not. Player 1 wins
      
      Win1()
      
    end
    
    CheckBullet1Pos (BulletOne, Wall1)
    CheckBullet1Pos (BulletOne, Wall2)
    CheckBullet1Pos (BulletOne, Wall3)
    
    CheckBullet2Pos (BulletTwo, Wall1)
    CheckBullet2Pos (BulletTwo, Wall2)
    CheckBullet2Pos (BulletTwo, Wall3)
   
    
    if Vic1 == true then
    
    love.event.quit ("restart")
  end
  
  if Vic2 == true then
    
    love.event.quit ("restart")
  end
  end
  
  function love.draw ()
      if ArenaCheck == 3 then --I didnt know how to split this part of the code and when i used the table it didnt work, so i did different variables as checks
            
            love.graphics.setColor  (Arena.color)
            love.graphics.rectangle ("fill",Arena.car.x, Arena.car.y, Arena.car.width, Arena.car.height)
            
      end 
          
      if playeroneCheck == 1 then 
        
        love.graphics.setColor  (playerone.color)
        love.graphics.rectangle ("fill", playerone.pos.x, playerone.pos.y, playerone.width, playerone.height)
        
          if Bull1 == true then --Draws the bullet
          
          love.graphics.setColor  (playerone.color)
          love.graphics.rectangle ("fill",BulletOne.x, BulletOne.y, BulletOne.width, BulletOne.height)
          
        end
      end 
    
      if playertwoCheck == 2 then
          
        love.graphics.setColor  (playertwo.color)
        love.graphics.rectangle ("fill",playertwo.pos.x, playertwo.pos.y, playertwo.width, playertwo.height)
        
         if Bull2 == true then -- Draws the bullet
          
          love.graphics.setColor  (playertwo.color)
          love.graphics.rectangle ("fill",BulletTwo.x, BulletTwo.y, BulletTwo.width, BulletTwo.height)
          
        end
      
      end
      
    if Vic2 == true then
      love.graphics.setColor  (playertwo.color)
      love.graphics.print ("Player 2 Wins!", 340, 15)
    end
    
     if Vic1 == true then
      love.graphics.setColor (playerone.color)
      love.graphics.print ("Player 1 Wins!", 340, 15)
    end
    
    if Wall1Check == 4 then
      love.graphics.setColor (0.251, 0.341, 0.537, 1)
      love.graphics.rectangle ("fill", Wall1.x, Wall1.y, Wall1.width, Wall1.height)
    end
    
     if Wall2Check == 5 then
      love.graphics.setColor (0.251, 0.341, 0.537, 1)
      love.graphics.rectangle ("fill", Wall2.x, Wall2.y, Wall2.width, Wall2.height)
    end
    
    if Wall3Check == 6 then
      love.graphics.setColor (0.251, 0.341, 0.537, 1)
      love.graphics.rectangle ("fill", Wall3.x, Wall3.y, Wall3.width, Wall3.height)
    end
  end
  
  function Win2 ()
    Bull2 = false
    Vic2 = true
  end
  
  function Win1 ()
    Bull1 = false
    Vic1 = true
  end
  
  function CheckPos (a,b)
    if a.pos.x <= b.car.x then -- This long code over there is for checking if the player is in the arena or not. This part is just for the walls of the arena
    
        a.pos.x = b.car.x 
      
          elseif a.pos.x >= b.car.x + b.car.width - a.width then
      
            a.pos.x = b.car.x + b.car.width - a.width
      
              elseif a.pos.y <= b.car.y then
      
               a.pos.y = b.car.y
      
                elseif a.pos.y >= b.car.y + b.car.height - a.height then
            
                  a.pos.y = b.car.y + b.car.height - a.height
            
    end        
    
    if  (a.pos.x <= b.car.x ) and 
        (a.pos.y <= b.car.y)  then --This part is for the corners
            
        a.pos.x = b.car.x 
        a.pos.y = b.car.y
            
          elseif  (a.pos.x <= b.car.x )                          and 
                  (a.pos.y >= b.car.y + b.car.height - a.height) then
            
            a.pos.x =  b.car.x 
            a.pos.y = (b.car.y + b.car.height - a.height)
      
            elseif  (a.pos.x >= b.car.x + b.car.width - a.width) and 
                    (a.pos.y <= b.car.y)                         then
        
              a.pos.x = (b.car.x + b.car.width - a.width)
              a.pos.y =  b.car.y
        
              elseif  (a.pos.x >= b.car.x + b.car.width - a.width)   and 
                      (a.pos.y >= b.car.y + b.car.height - a.height) then
                  
                a.pos.x = (b.car.x + b.car.width - a.width)
                a.pos.y = (b.car.y + b.car.height - a.width)
    end 
  end
  function CheckBullet1Pos (BulletOne, Wall)
    if  BulletOne.x <= Wall.x + Wall.width  and 
        BulletOne.x >= Wall.x               and 
        BulletOne.y <= Wall.y + Wall.height and 
        BulletOne.y >= Wall.y               then --This is a check for the bullet. It tells you if the bullet hit the wall  or not. Player 1
    
        Bull1 =           false
        BulletUp =        false
        BulletDown =      false 
        BulletRight =     false
        BulletLeft =      false 
    end
  end
  function CheckBullet2Pos (BulletTwo, Wall)
    if  BulletTwo.x <= Wall.x + Wall.width  and 
        BulletTwo.x >= Wall.x               and 
        BulletTwo.y <= Wall.y + Wall.height and 
        BulletTwo.y >= Wall.y               then --This is a check for the bullet. It tells you if the bullet hit the wall  or not. Player 2
    
        Bull2 =           false
        BulletW =         false
        BulletS =         false 
        BulletD =         false
        BulletA =         false 
    end
  end