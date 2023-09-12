# dAabb:Update

This function calculates the bounding box size, center, and radius from the minimum and maximum extents.

## Syntax

```
function dAabb:Update()
```

## Example

```lua
-- Create a new instance of dAabb
local aabb = dAabb()

-- Set the minimum and maximum extents
aabb.min = {1, 2, 3}
aabb.max = {4, 5, 6}

-- Update the bounding box
aabb:Update()
```