# material:setTexture

This function assigns a texture to a material.

## Syntax

```lua
material:setTexture(texture, index)
```

## Parameters

- `texture`: texture to set.
- `index`: can be `TEXTURE_BASE`, `TEXTURE_NORMAL`, `TEXTURE_METALLICROUGHNESS`, `TEXTURE_EMISSION`, `TEXTURE_DISPLACEMENT`, or any number from 0 to 15.

## Example

```lua
-- Create a new material
material = Material()
 
-- Load a texture
texture = Texture("texture.png")
 
-- Set the texture to the material
material:setTexture(texture, TEXTURE_BASE)
```