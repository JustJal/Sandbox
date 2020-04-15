function love.load()
  
  player = { --player > table
    pos = { --player.pos > table
      x = 5, --player.pos.x > number --starting position
      y = 5 -- player.pos.y > number
    },
    color = {1, 0.5, 0.25, 1},
    name = "Jal", --player.name > string
    control = { --player.control > table || https://love2d.org/wiki/KeyConstant
      up = { --player.control.up > table
        "up", --player.control.up[1] > string
        "w" --player.control.up[2] > string
      },
      down = { --player.control.down > table
        "down", --player.control.down[1] > string
        "s" --player.control.down[2] > string
      },
      left = { --...
        "left",
        "a"
      },
      right = {
        "right",
        "d"
      }
    },
    move = { -- Yes! You can put functions within tables my good dude. But you need to use a different syntax.
      up = function() --Instead of actually moving the player, this returns the position of where the player would be if it moved. So that we can use it to check if he can
        return player.pos.x, player.pos.y - 1
      end,
      down = function()
        return player.pos.x, player.pos.y + 1
      end,
      left = function()
        return player.pos.x - 1, player.pos.y
      end,
      right = function()
        return player.pos.x + 1, player.pos.y
      end
    }
  }
  
  TileSize = 32
  
  map = { --1 == full; 0 == empty || 16x16 || Pay close attention to the commas. Also, the spaces and lines are completely irrelevant. but it helps in seeing what you're doing.
  --  01,02,03,04,05,06,07,08,09,10,11,12,13,14,15,16
    {  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }, --01
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --02
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --03
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --04
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --05
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --06
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --07
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --08
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --09
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --10
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --11
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --12
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --13
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --14
    {  1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1 }, --15
    {  1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 }  --16
  } --now close the map table
  --map[y][x]
  --Since Map is filled with tables, and we arranged the tables vertically, y must be the first coordinate.
  --Since each table within Map is filled with numbers, which we arranged horizontally, x is the second coordinate.
  --Think ONLY of table access in this context. Don't get confused.
  
end

function love.update()
  
  for k,v in pairs(player.control) do --for Key, Value in Pairs(table) "name" would be a key for "Jal" within player
    for i,v1 in ipairs(v) do --We loop through the tables so that we can have more than one defined key for one single action
      if(love.keyboard.isDown(v1)) then
        local newx, newy = player.move[k]() -- there is no key called "k", instead, we use [] so that the VALUE within k is returned, and used as a key. player.move.k would be the same as player["move"]["k"], but player.move[k] (assuming k is "up") is the same as player.move["up"]
        if map[newy][newx] == 0 then -- If it's a valid position, we apply the change
          player.pos.x = newx 
          player.pos.y = newy 
        end
      end
    end
  end
  
end

function love.draw()
  
  for y,vy in ipairs(map) do --for Index, Value in IndexPairs(Map) -- Where Index is y, and vy is the //table// within map[y]
    for x,vx in ipairs(vy) do --for Index1, Value1 in IndexPairs(v) -- Where Index1 is x, and vx is the //value// within map[y][x]
      if vx == 1 then
        love.graphics.setColor(0, 0.5, 0.75, 1) --r, g, b, a -- Red, Green, Blue, Alpha -- Alpha = Transparency
        love.graphics.rectangle("fill", x*TileSize, y*TileSize, TileSize, TileSize)
      else --We only have to check for two values here.
        love.graphics.setColor(0, 0.19, 0.29, 1)
      end
      --love.graphics.setColor(0,0,0,1) -- If you want to see the numbers, uncomment both of these
        love.graphics.rectangle("fill", x*TileSize, y*TileSize, TileSize, TileSize)
      --love.graphics.print(vx, x*TileSize+(TileSize/3), y*TileSize+(TileSize/3))-- +TileSize/3 so its centered. 3 becase the origin of a print starts at its topleft corner, not its center.
      love.graphics.setColor(1, 1, 1, 1) --Remember to set the color back to white!
    end
  end
  
  --Now we draw the player. After the map, so that the player gets drawn on top. The player is a ball.
  love.graphics.setColor(player.color)
  love.graphics.circle("fill", player.pos.x * TileSize+(TileSize/2), player.pos.y * TileSize+(TileSize/2), TileSize/2) --+(TileSize/2) So its centered. The size of the ball is half a tile
  love.graphics.setColor(1,1,1,1) --Always remember to set it back to white.
  
end

function percent(a,b) -- You could use this to use colors from 0 to 255, as in percent(color,255). But I calculated these beforehand
  return a/b
end