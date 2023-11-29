# Material.GetTexture

This method retrieves a texture from the material.

## Syntax

```csharp
public Texture GetTexture(int index = TEXTURE_BASE)
```

| Parameter | Description |
|----|----|
| index | texture slot from 0 to 15 |

## Returns

Returns the material texture if it exists, otherwise `null` is returned.

### Example

```csharp
Texture texture = material.GetTexture();
if (texture != null)
{
    // Use the texture
}
else
{
    // Texture does not exist
}
```