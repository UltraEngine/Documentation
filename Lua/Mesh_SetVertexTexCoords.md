# Mesh:SetVertexTexCoords

This method sets the texture coordinates of a single vertex in the mesh.

## Syntax

- **SetVertexTexCoords**(number index, number u, number v, number texcoordset = 1)
- **SetVertexTexCoords**(number index, [Vec2](Vec2.md) texcoords, number texcoordset = 1)

| Parameter | Description |
| --- | --- |
| index | vertex index, starting with zero |
| texcoords, (u, v) | vertex texture coordinates to set |
| texcoordset | texture coordinate set, can be 1 or 2 |
