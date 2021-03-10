local entities = {}

function entities.load(name)
  
  log.record("Entities","Loading entity: "..name)
  
  local ent_ = lf.load(("resources/entities/%s.ent"):format(name))()
  local ent = {}
  
  ent.stats = {
    
    curr = ent_.stats,
    base = ent_.stats
    
  }
  
  ent.active = false
  
  ent.name = name
  --
  ent.hitbox = game.world:newRectangleCollider(0,0,ent_.hitbox[1],ent_.hitbox[2])
  ent.hitbox.dimensions = {ent_.hitbox[1],ent_.hitbox[2]}
  ent.hitbox:setType("dynamic")
  ent.hitbox:setMass(ent.stats.curr.wgh)
  ent.hitbox:setLinearDamping(ent.stats.curr.wgh)
  ent.hitbox:setFixedRotation(true)
  ent.hitbox:setObject(ent)
  ent.hitbox:setActive(false)
  ent.hitbox:setCollisionClass("entity")
  ent.hitbox.contact = {object = {}, entity = {}}
  
  ent.dimensions = {ent_.size[1],ent_.size[2]}
  
  ent.position = {0,0}
  
  ent.anim = assets.animation(ent_.anim)
  ent.anim:setState("idle_down")
  
  ent.direction = "down"
  
  function ent:forcemove(x,y)
    
    self.hitbox:setPosition(x,y)
    self.hitbox:setLinearVelocity(0,0)
    
  end
  
  function ent:getDirection()
    return ent.direction
  end
  
  local move = {
    up = {0,-1},
    down = {0,1},
    left = {-1,0},
    right = {1,0}
  }
  
  function ent:move(direction)
    
    local x,y = unpack(move[direction])
    self.hitbox:applyLinearImpulse((self.stats.curr.spd*x)/4,(self.stats.curr.spd*y)/4)
    self.anim:setState("move_"..direction)
    self.direction = direction
    self.hasMoved = true
    
  end
  
  function ent.hitbox:getDimensions()
    return unpack(self.dimensions)
  end
  
  function ent:getDimensions()
    return unpack(self.dimensions)
  end
  
  function ent:update(dt)
    
    local spdl = self.stats.curr.spd/self.stats.curr.wgh
    local spdr = self.stats.curr.spd/self.stats.curr.wgh
    local spdu = self.stats.curr.spd/self.stats.curr.wgh
    local spdd = self.stats.curr.spd/self.stats.curr.wgh
    
    if self.hitbox:enter("object") then
      local collision_data = self.hitbox:getEnterCollisionData("object")
      local b = collision_data.collider:getObject()
      self.hitbox.contact.object[b] = b
    end
    if self.hitbox:exit("object") then
      local collision_data = self.hitbox:getEnterCollisionData("object")
      local b = collision_data.collider:getObject()
      self.hitbox.contact.object[b] = nil
    end
    for _,v in pairs(self.hitbox.contact.object) do
      
      local spd = (self.stats.curr.str/v.wgh)+1
      
      local bx,by = v.hitbox:getPosition()
      local bw,bh = v.hitbox:getDimensions()
      
      local ax,ay = self.hitbox:getPosition()
      local aw,ah = self.hitbox:getDimensions()
      
      if ax+(aw/2) > bx+(bw/2) then spdl = spd end
      if ax+(aw/2) < bx+(bw/2) then spdr = spd end
      if ay+(ah/2) > by+(bh/2) then spdd = spd end
      if ay+(ah/2) < by+(bh/2) then spdu = spd end
      
    end
    
    -- Speed Capping -- Inefective, needs to be redone to count for getting pushed by external sources
    local ix,iy = self.hitbox:getLinearVelocity()
    if ix > spdr then ix = spdr end
    if iy > spdu then iy = spdu end
    if ix < -spdl then ix = -spdl end
    if iy < -spdd then iy = -spdd end
    self.hitbox:setLinearVelocity(ix,iy)
    self.anim:update(dt)
    if not self.hasMoved then
      self.anim:setState("idle_"..self.direction)
    else
      self.hasMoved = false
    end
    
    self.hitbox:setLinearDamping((ent.stats.curr.wgh/4)+(game.region:getTerrainFriction(self.hitbox:getPosition())))
    
  end
  
  function ent:draw(cx,cy)
    
    local  x, y = self.hitbox:getPosition()
    local aw,ah = self.anim:getDimensions()
    local ew,eh = unpack(self.dimensions)
    local hw,hh = unpack(self.hitbox.dimensions)
    local  w, h = math.resize(aw,ah,ew,eh)
    
    x = x-(ew-hw)+cx
    y = y-(eh-hh)+cy
    
    local function draw()
      self.anim:draw(x,y,0,w,h)
    end
    
    camera.draw(draw,x,y+(ah*h)-5,2)
    
  end
  
  function ent:getName()
    return self.name
  end
  
  function ent:setActive(bool)
    self.hitbox:setActive(bool)
    self.active = bool
  end
  
  return ent
  
end

return entities