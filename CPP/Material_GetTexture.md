# Material::GetTexture

This method retrieves a texture from the material.

## Syntax

- shared_ptr<[Material](Material.md)> **GetTexture**(const [TextureSlot](Constants.md#TextureSlot) index = TEXTURE_BASE)

| Parameter | Description |
|----|----|
| index | texture slot |

## Returns

Returns the material texture if it exists, otherwise NULL is returned.
