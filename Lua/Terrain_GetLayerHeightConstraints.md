# Terrain:GetLayerHeightConstraints

This method retrieves the terrain layer's slope constraints at the specified coordinate.

## Syntax

- [Vec3](Vec3) **GetLayerHeightConstraints**(number layer, number x, number y)
- [Vec3](Vec3) **GetLayerHeightConstraints**(number layer, [iVec2](iVec2) coord)

| Parameter | Description | 
|---|---|
| layer | layer index to use |
| coord, (x, y) | terrain coordinate |

## Returns

Returns the minimum elevation, maximum elevation, and height transition values.
