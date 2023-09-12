# Terrain:GetNormal

This function gets the terrain normal at the specified coordinate or 3D position.

## Syntax

```lua
function Terrain:GetNormal(tx, ty: number): Vec3
function Terrain:GetNormal(coord: iVec2): Vec3
function Terrain:GetNormal(coord: xVec3): Vec3
function Terrain:GetNormal(x, y, z: number): Vec3
```

## Parameters

- `coord, (tx, ty)`: terrain coordinate
- `position, (x, y, z)`: position in global space

## Returns

Returns the terrain normal at the specified coordinate or the interpolated normal at the specified position in global space.