# Terrain.GetNormal

This method gets the terrain normal at the specified coordinate or 3D position.

## Syntax

- [Vec3](Vec3.md) **GetNormal**(int tx, int ty)
- [Vec3](Vec3.md) **GetNormal**(iVec2 coord)
- [Vec3](Vec3.md) **GetNormal**(xVec3 coord)
- [Vec3](Vec3.md) **GetNormal**(float x, float y, float z)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | position in global space |

## Returns

Returns the terrain normal at the specified coordinate or the interpolated normal at the specified position in global space.

### Example

```csharp
Vec3 normal1 = Terrain.GetNormal(tx, ty);
Vec3 normal2 = Terrain.GetNormal(coord);
Vec3 normal3 = Terrain.GetNormal(coord);
Vec3 normal4 = Terrain.GetNormal(x, y, z);
```