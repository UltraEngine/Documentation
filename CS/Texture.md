# Texture

**Base class:** [Asset](Asset.md)

A texture is an image that can be applied to 2D or 3D surfaces. Textures can be loaded from DDS files or other file formats loaded with plugins.

| Property | Type | Description |
| --- | --- | --- |
| mipchain | const List<List<shared_ptr<[Pixmap](Pixmap.md)\>>> | stores texture mipmaps when loaded with LOAD_MIPCHAIN |
| size | const [Vector3i](Vector3i.md)& | read-only dimensions |
| [BuildMipmaps](Texture_BuildMipmaps.md) | Method | generates mipmaps for the texture |
| [SetPixels](Texture_SetPixels.md) | Method | sets the texture image data |
| [SetSubPixels](Texture_SetSubPixels.md) | Method | sets the texture image data of an area |
| [CreateTexture](CreateTexture.md) | Function | creates a new texture |
| [LoadTexture](LoadTexture.md) | Function | loads a texture from a file or stream |

## Example

```csharp
// Create a new texture
Texture myTexture = CreateTexture();

// Load texture from file
LoadTexture(myTexture, "texture.png");

// Set pixels of the texture
Color[] pixels = new Color[] { Color.Red, Color.Green, Color.Blue };
SetPixels(myTexture, pixels);

// Generate mipmaps for the texture
BuildMipmaps(myTexture);
```
