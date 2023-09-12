```lua
-- Face:SetTextureMappingPlane

-- Sets the face texture mapping planes, overriding the default brush texture mapping routine.
-- @param plane (Plane) - the texture mapping plane to set
-- @param axis (number) - 0 for horizontal, 1 for vertical
-- @return none
function Face:SetTextureMappingPlane(plane, axis)
    -- implementation code here
end
```

```lua
-- Example usage
local face = Face()
local plane = Plane(1, 0, 0, 0) -- define a plane
face:SetTextureMappingPlane(plane, 0) -- set the texture mapping plane horizontally
```