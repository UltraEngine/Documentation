# Terrain.GetLayerTextureMappingMode

This method retrieves the texture mapping mode of the specified terrain layer.

## Syntax

```csharp
TerrainMappingMode GetLayerTextureMappingMode(int layer)
```

| Parameter | Description |
|---|---|
| layer | index of layer to use |

## Returns

Returns `TerrainMappingMode` enum value: `TERRAINMAPPING_HORIZONTAL`, `TERRAINMAPPING_VERTICAL`, or `TERRAINMAPPING_TRILINEAR`.