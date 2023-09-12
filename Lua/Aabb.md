# Aabb

This class describes an axis-aligned bounding box.

| Property | Type | Description |
| ---- | ---- | ---- |
| Aabb | Constructor | Aabb() |
| Aabb | Constructor | Aabb(min: Vec3, max: Vec3) |
| Aabb | Constructor | Aabb(x0: number, y0: number, z0: number, x1: number, y1: number, z1: number) |
| min | Vec3 | Minimum extent of the bounding box. |
| max | Vec3 | Maximum extent of the bounding box. |
| center | Vec3 | Halfway point between the minimum and maximum extents |
| size | Vec3 | Distance between the minimum and maximum extents |
| radius | number | Radius of a sphere that completely encloses the bounding box. |
| \+= | Operator | Expands one Aabb to enclose another. |
| \+ | Operator | Expands one Aabb to enclose another and returns the result. |
| [Update](Aabb_Update.md) | Method | Calculates the bounding box size, center, and radius from the minimum and maximum extents. |


## Example
```lua
local Vec3 = require("Vec3")

-- Create a new Aabb
local aabb1 = Aabb()

-- Create a new Aabb with given minimum and maximum extents
local min = Vec3(0, 0, 0)
local max = Vec3(1, 1, 1)
local aabb2 = Aabb(min, max)

-- Create a new Aabb with given coordinates
local aabb3 = Aabb(0, 0, 0, 1, 1, 1)

-- Access properties
local minExtent = aabb2.min
local maxExtent = aabb2.max
local centerPoint = aabb2.center
local boxSize = aabb2.size
local boxRadius = aabb2.radius

-- Expand one Aabb to enclose another
aabb1 += aabb2

-- Expand one Aabb to enclose another and store the result in a new Aabb
local result = aabb1 + aabb2

-- Update the bounding box size, center, and radius from the minimum and maximum extents
aabb1:Update()
```
