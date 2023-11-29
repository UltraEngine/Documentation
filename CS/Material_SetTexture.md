# Material.SetTexture

This method assigns a texture to a material.

## Syntax 

```csharp
void SetTexture(Texture texture, int index = TEXTURE_BASE);
```

| Parameter | Description |
|---|---|
| texture | texture to set |
| index | can be `TEXTURE_BASE`, `TEXTURE_NORMAL`, `TEXTURE_METALLICROUGHNESS`, `TEXTURE_EMISSION`, `TEXTURE_DISPLACEMENT`, or any number from 0 to 15 |