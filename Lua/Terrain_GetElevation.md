# Terrain:GetElevation

This method gets the height of the terrain, in global coordinates.

## Syntax

- number **GetElevation**(number tx, number ty)
- number **GetElevation**([iVec2](iVec2.md) coord)
- number **GetElevation**(number x, number y, number z)
- number **GetElevation**([Vec3](Vec3.md) position)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | global position |

## Returns

Returns the global height of the terrain above the terrain position at the specified coordinate, or the interpolated height at the specified global position.
