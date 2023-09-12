# Mesh:SetVertexNormal

This method sets the normal of a single vertex in the mesh.

## Syntax

```lua
Mesh:SetVertexNormal(index, normal)
Mesh:SetVertexNormal(index, x, y, z)
```

## Parameters

- `index`: The vertex index, starting at zero.
- `normal, (x, y, z)`: The vertex normal to set.

## Example

```lua
-- Create a mesh
local mesh = Mesh()

-- Set the vertex normal using the Vec3 object
local normal = Vec3(0, 0, 1)
mesh:SetVertexNormal(0, normal)

-- Set the vertex normal using separate coordinates
mesh:SetVertexNormal(1, 0, 1, 0)
```