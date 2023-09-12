# Face:GetTextureMappingTranslation

This method returns the texture mapping translation for this face.

## Syntax

```lua
function Face:GetTextureMappingPlane()
```

## Returns

Returns the face texture mapping translation.

## Example

```lua
-- Assuming `face` is an instance of the `Face` class

local translation = face:GetTextureMappingPlane()
print(translation)
```