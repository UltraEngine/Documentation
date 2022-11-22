# Terrain::GetNormal

This method gets the terrain normal at the specified coordinate or 3D position.

## Syntax

- [Vec3](Vec3.md) **GetNormal**(const int tx, const int ty)
- [Vec3](Vec3.md) **GetNormal**(const [iVec2](iVec2.md)& coord)
- [Vec3](Vec3.md) **GetNormal**(const [xVec3](xVec3.md)& coord)
- [Vec3](Vec3.md) **GetNormal**(const dFloat x, const dFloat y, const dFloat z)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | position in global space |

## Returns

Returns the terrain normal at the specified coordinate or the interpolated normal at the specified position in global space.
