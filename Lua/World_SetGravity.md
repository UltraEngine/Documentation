```lua
-- World:SetGravity

-- Sets the gravitational vector applied uniformly across the world.
-- @param gravity table: gravitational force to set, in meters per second squared
--     - gravity.x number: gravity along the x-axis
--     - gravity.y number: gravity along the y-axis
--     - gravity.z number: gravity along the z-axis
-- @return void

function World:SetGravity(gravity)
    -- Implementation logic here
end
```

## Example

```lua
-- Create a new instance of the World class
local world = World()

-- Set the gravity to (0, -9.8, 0) m/s^2
world:SetGravity(0, -9.8, 0)
```