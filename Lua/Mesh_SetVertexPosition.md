# Mesh:SetVertexPosition

This method sets the position of a single vertex in the mesh.

## Syntax

```lua
Mesh:SetVertexPosition(index, position)
Mesh:SetVertexPosition(index, x, y, z)
```

## Parameters

| Parameter | Description |
|---|---|
| index | vertex index, starting with zero |
| position, (x, y, z) | vertex position to set |

## Example

```lua
-- Create a new mesh
local mesh = Mesh()

-- Set the position of the vertex at index 0 using a Vec3 object
local position1 = Vec3(1, 2, 3)
mesh:SetVertexPosition(0, position1)

-- Set the position of the vertex at index 1 using separate x, y, and z values
mesh:SetVertexPosition(1, 4, 5, 6)
```