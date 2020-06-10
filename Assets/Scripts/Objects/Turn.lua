Entity.turnspeed = Vec3(0,0.1,0)

function Entity:Update()
    self:Turn(self.turnspeed)
end
