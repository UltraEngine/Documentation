# Terrain:GetMaterialWeight

This method gets the weighting of a material at the specified terrain point.

## Syntax

```lua
function Terrain:GetMaterialWeight(x: number, y: number, material: Material): number
```

### Parameters

| Name | Type | Description |
|------|------|-------------|
| x | number | terrain coordinate |
| y | number | terrain coordinate |
| material | Material | material to get the weight of |

## Returns

Returns the material weight if it is in use at the specified terrain point, otherwise 0 is returned.

## Example

```lua
local terrain = Terrain.new()

-- Create a material
local material = Material.new()

-- Set the material weight at (10, 20)
terrain:SetMaterialWeight(10, 20, material)

-- Get the material weight at (10, 20)
local weight = terrain:GetMaterialWeight(10, 20, material)
print(weight) -- Output: material weight (if it is in use), otherwise 0
```