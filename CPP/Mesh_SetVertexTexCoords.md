# Mesh::SetVertexTexCoords

This method sets the texture coordinates of a single vertex in the mesh.

## Syntax

- void **SetVertexTexCoords**(const uint32_t index, const float u, const float v, const int texcoordset = 0)
- void **SetVertexTexCoords**(const uint32_t index, const [Vec2](Vec2.md) texcoords, const int texcoordset = 0)

| Parameter | Description |
|---|---|
| index | vertex index, starting with zero |
| texcoords, (u, v) | vertex texture coordinates to set |
| texcoordset | texture coordinate set, can be 0 or 1 |
