# Terrain::GetLayers

This method gets all the layers in use on the terrain at the specified coordinate.

## Syntax

std::vector<int\> **GetLayers**(const int x, const int y)

| Parameter | Description |
|---|---|
| x, y | terrain coordinate |

## Returns

Returns an array containing all the layer indexes in use at the specified point, sorted from most to least influential.
