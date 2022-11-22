# Terrain::GetElevation

This method gets the height of the terrain, in global coordinates.

## Syntax

- float **GetElevation**(const int tx, const int ty)
- float **GetElevation**(const [iVec2](iVec2.md)& coord)
- float **GetElevation**(const dFloat x, const dFloat y, const dFloat z)
- float **GetElevation**(const [Vec3](Vec3.md)& position)

| Parameter | Description |
|---|---|
| coord, (tx, ty) | terrain coordinate |
| position, (x, y, z) | global position |

## Returns

Returns the global height of the terrain above the terrain position at the specified coordinate, or the interpolated height at the specified global position.
