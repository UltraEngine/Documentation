# Texture.SetPixels

This method sets the image data of a texture.

## Syntax

```csharp
public void SetPixels(Pixmap pixels, int miplevel = 0, int layer = 0)
```

| Parameter | Description |
|---|---|
| pixels | pixel data to set |
| miplevel | the mipmap level to set |
| layer | texture layer or cubemap face |

## Remarks

The provided pixmap must use the same format as the texture, and have the same dimensions as the specified miplevel.

## Example

```csharp
// Assuming a Pixmap object called pixmap and a Texture object called texture
texture.SetPixels(pixmap);
```