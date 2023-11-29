# CreateTexture

This function creates a new texture.

## Syntax

```csharp
Texture **CreateTexture**(TextureType type, int width, int height, TextureFormat format = TextureFormat.TEXTURE_RGBA, List<Pixmap> mipchain = null, int layers = 1, TextureFlags flags = TextureFlags.TEXTURE_DEFAULT, TextureFilter filter = TextureFilter.TEXTUREFILTER_LINEAR, int samples = 0)
```
  
| Parameter | Description |
|---|---|
| type | texture type, can be TextureType.TEXTURE_2D, TextureType.TEXTURE_3D, or TextureType.TEXTURE_CUBE |
| width, height | texture dimensions |
| format | texture format |
| mipchain | the mipmap chain can be specified upon creation, or each mipmap level can be set afterwards |
| layers | texture layers |
| flags | texture flags, can be TextureFlags.TEXTURE_DEFAULT or any combination of TextureFlags.TEXTURE_BUFFER, TextureFlags.TEXTURE_MIPMAPS, TextureFlags.TEXTURE_CLAMP_U, TextureFlags.TEXTURE_CLAMP_V, TextureFlags.TEXTURE_CLAMP_W |
| samples | for multisampled texture |
| filter | texture filter, can be TextureFilter.TEXTUREFILTER_LINEAR, TextureFilter.TEXTUREFILTER_NEAREST, or TextureFilter.TEXTUREFILTER_CUBIC |

## Returns
  
Returns a new texture.