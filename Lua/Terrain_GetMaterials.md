# Terrain:GetMaterials

This method gets all the materials in use on the terrain at the specified coordinate.

## Syntax

```lua
function Terrain:GetMaterials(x, y)
```

**Parameters:**

- `x, y` (number) - terrain coordinate

**Returns:**

- `materials` (table) - An array containing all the materials in use at the specified point.

## Example

```lua
local terrain = Terrain.new()
local materials = terrain:GetMaterials(10, 20)

for i, material in ipairs(materials) do
    print("Material "..i..": "..material.name)
end
```

In this example, the `GetMaterials` method is called on a `Terrain` object to retrieve all the materials at the coordinate (10, 20). The result is stored in the `materials` table, which is then iterated over to print the name of each material.