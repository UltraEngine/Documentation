entity.turnspeed = Vec3(0,0,-5)

function entity:Update()
	self:Turn(self.turnspeed)
end
