## Syntax

```csharp
void SetLayerSlopeConstraints(int layer, float minheight, float maxheight, float transition)
```

| Parameter | Description |
|---|---|
| layer | index of the layer to use |
| minheight | minimum slope above which the layer will appear |
| maxheight | maximum slope under which the layer will appear |
| transition | size of the layer fade |

## Example

```csharp
terrain.SetLayerSlopeConstraints(1, 0.5f, 0.8f, 0.2f);
```