# Material::SetTexture

This method assigns a texture to a material.

## Syntax 

- void **SetTexture**(shared_ptr<[Texture](Texture)\> texture, const int index = TEXTURE_BASE)

| Parameter | Description |
|---|---|
| texture | texture to set |
| index | can be TEXTURE_BASE, TEXTURE_NORMAL, TEXTURE_METALLICROUGHNESS, TEXTURE_EMISSION, TEXTURE_DISPLACEMENT, or any number from 0 to 15 |
