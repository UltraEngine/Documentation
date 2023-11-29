# Terrain.AddLayer

This method adds a material layer to the terrain.

## Syntax

```csharp
int AddLayer([Material](link to Material class) material);
```

| Parameter | Description |
|---|---|
| material | material to apply to the terrain |

## Returns

Returns the index of the new layer, or the index to any existing layer that uses the specified material.

## Example

```csharp
int newLayerIndex = terrain.AddLayer(material);
```
