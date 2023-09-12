# Terrain:GetElevation

This method gets the height of the terrain, in global coordinates.

## Syntax

```lua
function Terrain:GetElevation(tx: number, ty: number): number
```

```lua
function Terrain:GetElevation(coord: iVec2): number
```

```lua
function Terrain:GetElevation(x: number, y: number, z: number): number
```

```lua
function Terrain:GetElevation(position: Vec3): number
```

### Parameters

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | global position |

## Returns

Returns the global height of the terrain above the terrain position at the specified coordinate, or the interpolated height at the specified global position.