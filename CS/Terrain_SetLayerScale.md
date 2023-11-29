# Terrain.SetLayerScale

This method sets the layer texture mapping scale.

## Syntax

```csharp
void SetLayerScale(int layer, float scale)
```

| Parameter | Description |
|---|---|
| layer | the index of the layer to use |
| scale | texture mapping scale to set, in texels per meter |

## Example

```csharp
Terrain.SetLayerScale(0, 5.0f);
```

This example sets the texture mapping scale for layer 0 to 5.0 texels per meter.