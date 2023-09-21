# Texture

**Base class:** [Asset](Asset.md)

A texture is an image that can be applied to 2D or 3D surfaces. Textures can be loaded from DDS files or other file formats loaded with plugins.

| Property | Type | Description |
| --- | --- | --- |
| mipchain | [table](https://www.lua.org/manual/5.4/manual.html#6.6) | stores texture mipmaps when loaded with LOAD_MIPCHAIN |
| size | [iVec3](iVec3.md) | read-only dimensions |
| [BuildMipmaps](Texture_BuildMipmaps.md) | Method | generates mipmaps for the texture |
| [SetPixels](Texture_SetPixels.md) | Method | sets the texture image data |
| [SetSubPixels](Texture_SetSubPixels.md) | Method | sets the texture image data of an area |
| [CreateTexture](CreateTexture.md) | Function | creates a new texture |
| [LoadTexture](LoadTexture.md) | Function | loads a texture from a file or stream |
