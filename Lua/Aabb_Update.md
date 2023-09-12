# Aabb:Update

This method calculates the bounding box size, center, and radius from the minimum and maximum extents.

## Syntax

```lua
function Aabb:Update()
```

## Example

```lua
-- Create an Aabb object
local aabb = Aabb()

-- Set the minimum and maximum extents
aabb.minExtent = Vector3(-1, -1, -1)
aabb.maxExtent = Vector3(1, 1, 1)

-- Update the bounding box
aabb:Update()

-- Print the bounding box size, center, and radius
print("Size:", aabb.size)
print("Center:", aabb.center)
print("Radius:", aabb.radius)
```