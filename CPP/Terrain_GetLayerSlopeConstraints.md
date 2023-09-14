# Terrain::GetLayerSlopeConstraints

This method retrieves the terrain layer's slope constraints at the specified coordinate.

## Syntax

- [Vec3](Vec3) **GetLayerSlopeConstraints**(const int layer, const int x, const int y)
- [Vec3](Vec3) **GetLayerSlopeConstraints**(const int layer, const [iVec2](iVec2)& coord)

## Returns

Returns the minimum angle, maximum angle, and slope transition values.
