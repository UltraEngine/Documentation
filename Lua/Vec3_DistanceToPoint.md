# Vec3:DistanceToPoint

This method returns the distance between this point and the specified position.

## Syntax

```lua
function Vec3:DistanceToPoint(position)
```

## Parameters

- `position` (`Vec3`): The position to return the distance to.

## Returns

Returns the distance between this point and the specified position.

## Example

```lua
Vec3 = Vec3 or {}
Vec3.__index = Vec3

function Vec3.new(x, y, z)
    local self = setmetatable({}, Vec3)
    self.x = x or 0
    self.y = y or 0
    self.z = z or 0
    return self
end

function Vec3:DistanceToPoint(position)
    -- calculate distance
    local dx = self.x - position.x
    local dy = self.y - position.y
    local dz = self.z - position.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

local v0 = Vec3.new(0, 0, 0)
local v1 = Vec3.new(1000, 1000, 0)

print(v0:DistanceToPoint(v1))
```