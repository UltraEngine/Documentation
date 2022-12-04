# Material::GetTexture

This method retrieves a texture from the material.

## Syntax

- shared_ptr<[Material](Material.md)> **GetTexture**(const int index = TEXTURE_BASE)

| Parameter | Description |
|----|----|
| index | texture slot from 0 to 15 |

## Returns

Returns the material texture if it exists, otherwise NULL is returned.
