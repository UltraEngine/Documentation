# Face.SetTextureMappingTranslation

This method manually sets the face texture mapping planes, overriding the default brush texture mapping routine.

## Syntax

```csharp
public void SetTextureMappingTranslation(float x, float y)
```

| Parameter | Description |
|---|---|
| x | horizontal texture offset |
| y | vertical texture offset |

### Example

```csharp
Face face = new Face();
face.SetTextureMappingTranslation(0.5f, 0.75f);
```