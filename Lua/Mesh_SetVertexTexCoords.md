# mesh:SetVertexTexCoords

This method sets the texture coordinates of a single vertex in the mesh.

## Syntax

```lua
mesh:SetVertexTexCoords(index, u, v, texcoordset)
mesh:SetVertexTexCoords(index, texcoords, texcoordset)
```

## Parameters

| Parameter | Description |
| --- | --- |
| index | vertex index, starting with zero |
| u, v | vertex texture coordinates to set |
| texcoords | a [Vec2](Vec2.md) object representing the vertex texture coordinates |
| texcoordset | texture coordinate set, can be 0 or 1 |

## Example

```lua
-- Set the texture coordinates of vertex at index 0 to (0.5, 0.5)
mesh:SetVertexTexCoords(0, 0.5, 0.5)

-- Alternatively, use a Vec2 object to set the texture coordinates
local texcoords = Vec2(0.5, 0.5)
mesh:SetVertexTexCoords(0, texcoords)
```