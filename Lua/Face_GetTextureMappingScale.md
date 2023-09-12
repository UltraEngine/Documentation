# Face:GetTextureMappingScale

This method returns the texture mapping scale for this face.

## Syntax 

- [`Vec2`](#vec2) **Face:GetTextureMappingScale**()

## Returns

Returns the face texture mapping scale.

## Example

```lua
local face = ...

local mappingScale = face:GetTextureMappingScale()
print(mappingScale.x, mappingScale.y)
```