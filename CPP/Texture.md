# Texture

**Base class:** [Asset](Asset.md)

A texture is an image that can be applied to 2D or 3D surfaces. Textures can be loaded from DDS files or other file formats loaded with plugins.

| Property | Type | Description |
| --- | --- | --- |
| size | const [iVec3](iVec3.md)& | read-only dimensions |
| [BuildMipmaps](Texture_BuildMipmaps.md) | Method | generates mipmaps for the texture |
| [SetPixels](Texture_SetPixels.md) | Method | sets the texture image data |
| [LoadTexture](LoadTexture.md) | Function | loads a texture from a file or stream |

### Texture Limits

Some of the performance optimizations Ultra Engine uses require a hard limit on the maximum number of textures that can be loaded at once. This value can be increased by defining the following values in a file called "Ultra.json", in your game's directory:

```json
{
  "maxTextures": 512,
  "maxCubemaps": 16,
  "maxShadowmaps": 64,
  "maxIntegerTextures": 32,
  "maxUIntegerTextures": 32,
  "maxCubeShadowmaps": 32,
  "maxVolumeTextures": 32
}
```

You must also define the same values in the shader file "Shaders/Base/Limits.glsl" and recompile all shaders:

```c++
#define MAX_TEXTURES_2D 512
#define MAX_TEXTURES_CUBE 16
#define MAX_TEXTURES_SHADOW 64
#define MAX_TEXTURES_2D_INTEGER 32
#define MAX_TEXTURES_2D_UINTEGER 32
#define MAX_TEXTURES_CUBE_SHADOW 32
#define MAX_VOLUME_TEXTURES 32
```

An error will result if the limits defined in the shader do not match the limits defined in the JSON file.
