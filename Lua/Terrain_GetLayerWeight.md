# Terrain:GetLayerWeight

This method gets all the layers in use on the terrain at the specified coordinate.

## Syntax

- number **GetLayerWeight**(number x, number y)
- number **GetLayerWeight**([iVec2](iVec2.md))

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |

## Returns

Returns an array containing all the layer indexes in use at the specified point, sorted from most to least influential.
