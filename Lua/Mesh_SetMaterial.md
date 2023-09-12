# SetMaterial

This function sets the material for the mesh.

## Syntax 

```lua
function **SetMaterial**(material)
```

### Parameters

- `material` (table): the material to set for the mesh, or `nil` for no material. 

## Example

```lua
-- Assuming the mesh object is already created
local material = -- create the material object

mesh:SetMaterial(material)
```