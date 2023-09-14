# Terrain:GetLayerSlopeConstraints

This method retrieves the terrain layer's slope constraints at the specified coordinate.

## Syntax

- [Vec3](Vec3) **GetLayerSlopeConstraints**(number layer, number x, number y)
- [Vec3](Vec3) **GetLayerSlopeConstraints**(number layer, [iVec2](iVec2) coord)

| Parameter | Description | 
|---|---|
| layer | layer index to use |
| coord, (x, y) | terrain coordinate |

## Returns

Returns the minimum angle, maximum angle, and slope transition values.
