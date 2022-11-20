# CreateTexture

This function creates a new texture.

## Syntax

- shared_ptr<[Texture](Texture.md)> **CreateTexture**(const TextureType type, const int width, const int height, const TextureFormat format = TEXTURE_RGBA, const std::vector<shared_ptr<Pixmap> > mipchain = {}, const int layers = 1, const TextureFlags flags = TEXTURE_DEFAULT, const TextureFilter filter = TEXTUREFILTER_LINEAR, const int samples = 0)
  
| Parameter | Description |
|---|---|
| type | texture type, can be TEXTURE_2D, TEXTURE_3D, or TEXTURE_CUBE |
| width, height | texture dimensions |
| format | texture format |
| mipchain | the mipmap chain can be specified upon creation, or each mipmap level can be set afterwards |
| layers | texture layers |
| flags | texture flags, can be TEXTURE_DEFAULT or any combination of TEXTURE_BUFFER, TEXTURE_MIPMAPS, TEXTURE_CLAMP_U, TEXTURE_CLAMP_V, TEXTURE_CLAMP_W |
| samples | for multisampled texture |
| filter | texture filter, can be TEXTUREFILTER_LINEAR, TEXTUREFILTER_NEAREST, or TEXTUREFILTER_CUBIC |

  ## Returns
  
  Returns a new texture.
