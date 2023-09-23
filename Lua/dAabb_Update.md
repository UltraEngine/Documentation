# dAabb:Update

This method calculates the bounding box size, center, and radius from the minimum and maximum extents.

## Syntax

- **Update**()

## Example

```lua
-- Create an Aabb object
local aabb = dAabb()

-- Set the minimum and maximum extents
aabb.min = Vec3(-1, -1, -1)
aabb.max = Vec3(1, 1, 1)

-- Update the bounding box
aabb:Update()

-- Print the bounding box size, center, and radius
Print("Size: " .. tostring(aabb.size.x) .. ", " ..tostring(aabb.size.y) .. ", " .. tostring(aabb.size.z))
Print("Center: " .. tostring(aabb.center.x) .. ", " ..tostring(aabb.center.y) .. ", " .. tostring(aabb.center.z))
Print("Radius: " .. tostring(aabb.radius))
```
