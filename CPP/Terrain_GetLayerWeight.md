# Terrain::GetLayerWeight

This method gets all the layers in use on the terrain at the specified coordinate.

## Syntax
- float **GetLayerWeight**(const int layer, const int x, const int y)
- float **GetLayerWeight**(const int layer, const [iVec2](iVec2.md)& coord)

| Parameter | Description |
|---|---|
| layer | terrain layer to retrieve information for |
| coord, (x, y) | terrain coordinate |

## Returns

Returns an array containing all the layer indexes in use at the specified point, sorted from most to least influential.
