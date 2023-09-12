# Face:GetTextureMappingPlane

This method returns the texture mapping plane for this face.

## Syntax 
- [Plane](Plane.md) **Face:GetTextureMappingPlane**(axis:number)

| Parameter | Description |
|---|---|
| axis | 0 for horizontal, 1 for vertical texture mapping plane |

## Returns

Returns the face texture mapping plane.

## Example

```lua
-- Assume the 'Face' class instance is already created and assigned to the variable 'face'
local textureMappingPlane = face:GetTextureMappingPlane(0)
print(textureMappingPlane)
```