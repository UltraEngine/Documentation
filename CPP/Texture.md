# Texture

**Base class:** [Asset](Asset.md)

A texture is an image that can be applied to 2D or 3D surfaces. Textures can be loaded from DDS files or other file formats loaded with plugins.

## Properties

| Name | Type | Description |
| --- | --- | --- |
| size | [iVec3](iVec3.md) | read-only dimensions |
| [LoadTexture](LoadTexture.md) | Function | loads a texture from a file or stream |

## Texture Limits

Some of the performance optimizations Ultra Engine uses require a hard limit on the maximum number of textures that can be loaded at once. This value can be increase by defining the following values in a file called "Ultra.json", in your game's directory:
| Name | Default |
|--|--|
| MAX_TEXTURES | 512 |
| MAX_CUBEMAPS | 16 |
| MAX_SHADOWMAPS | 64 |
| MAX_INTEGER_TEXTURES | 32 |
| MAX_UINTEGER_TEXTURES | 32 |
| MAX_CUBE_SHADOWMAPS | 64 |
| MAX_VOLUME_TEXTURES | 32 |

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
