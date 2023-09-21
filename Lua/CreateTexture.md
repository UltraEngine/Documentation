# CreateTexture

This function creates a new texture.

## Syntax

- [Texture](Texture.md) **CreateTexture**(number type, number width, number height, number format = TEXTURE_RGBA, [table](https://www.lua.org/manual/5.4/manual.html#6.6) mipchain = nil, number layers = 1, number flags = TEXTURE_DEFAULT, number filter = TEXTUREFILTER_LINEAR, number samples = 0)

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
