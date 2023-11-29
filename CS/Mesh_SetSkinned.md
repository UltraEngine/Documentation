# Mesh.SetSkinned

This method enables or disables vertex weighting.

## Syntax

```csharp
public void SetSkinned(bool mode)
```

| Parameter | Description |
|---|---|
| mode | if set to true vertex weighting will be enabled |

## Remarks

Mesh skinning can be disabled in order to use bone indice and weight properties to store other information for a custom shader. For example, bone weights could be used to store vertex colors.