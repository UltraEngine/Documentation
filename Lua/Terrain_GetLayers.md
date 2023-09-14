# Terrain:GetLayers

This method gets all the layers in use on the terrain at the specified coordinate.

## Syntax

- [table](https://www.lua.org/manual/5.4/manual.html#6.6) **GetLayers**(number x, number y)
- [table](https://www.lua.org/manual/5.4/manual.html#6.6) **GetLayers**([iVec2](iVec2.md))

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |

## Returns

Returns an array containing all the layer indexes in use at the specified point, sorted from most to least influential.

