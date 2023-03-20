# Texture::CountLayers

This method returns the number of layers in the texture.

## Syntax

-int **CountLayers**(const int level = 0)

| Parameter | Description |
|---|---|
| level | for 3D textures, the mipmap level to return the number of layers for |

## Returns

Returns the numbers of layers in the texture.

For 2D textures, this method will return one.

For cubemap textures, this method will return six.

For 3D textures, this method will return the number of layers in the specified mip level.

If the texture uses type TEXTURE_3D and the specified mip level is less than zero or greater than the number of mip levels minus one, zero will be returned.
