# Terrain.GetLayerWeight

This method gets all the layers in use on the terrain at the specified coordinate.

## Syntax

- float **GetLayerWeight**(int x, int y)
- float **GetLayerWeight**(iVec2 coord)

| Parameter | Description |
|---|---|
| coord, (x, y) | terrain coordinate |

## Returns

Returns an array containing all the layer indexes in use at the specified point, sorted from most to least influential.

### Example

```csharp
float[] GetLayerWeight(int x, int y)
{
    // Code to get layer weights at the specified coordinate
}

float[] GetLayerWeight(iVec2 coord)
{
    // Code to get layer weights at the specified coordinate (using iVec2 as a custom coordinate type)
}
```