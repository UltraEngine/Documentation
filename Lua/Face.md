# Face

Base class: [Object](Object.md)

This class describes a flat surface of a Brush entity.

| Property | Type | Description |
|---|---|---|
| plane | [Plane](Plane.md) | read-only face plane |
| AddIndice | Method | adds an indice to the face |
| GetMaterial | Method | returns the face material |
| GetTextureMappingPlane | Method | returns the face texture mapping planes |
| GetTextureMappingRotation | Method | returns the face texture mapping rotation |
| GetTextureMappingScale | Method | returns the face texture mapping scale |
| GetTextureMappingTranslation | Method | returns the face texture mapping translation |
| SetMaterial | Method | applies a material to the face |
| SetTextureMappingPlane | Method | overrides the automatic face texture mapping planes |
| SetTextureMappingRotation | Method | sets the face texture mapping rotation |
| SetTextureMappingScale | Method | sets the face texture mapping scale |
| SetTextureMappingTranslation | Method | sets the face texture mapping translation |

@@ Example

```lua
-- Create a face object with a given plane
local plane = Plane({0, 0, 1}, 0)
local face = Face(plane)

-- Add an indice to the face
face:AddIndice(0)

-- Get the face material
local material = face:GetMaterial()

-- Get the face texture mapping planes
local mappingPlanes = face:GetTextureMappingPlane()

-- Get the face texture mapping rotation
local rotation = face:GetTextureMappingRotation()

-- Get the face texture mapping scale
local scale = face:GetTextureMappingScale()

-- Get the face texture mapping translation
local translation = face:GetTextureMappingTranslation()

-- Apply a material to the face
face:SetMaterial(material)

-- Override the automatic face texture mapping planes
face:SetTextureMappingPlane(mappingPlanes)

-- Set the face texture mapping rotation
face:SetTextureMappingRotation(rotation)

-- Set the face texture mapping scale
face:SetTextureMappingScale(scale)

-- Set the face texture mapping translation
face:SetTextureMappingTranslation(translation)
```
