# Mesh::AddVertex

This methods adds a new vertex to the mesh.

## Syntax

- uint32_t **AddVertex**(const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal = 0, const [Vec2](Vec2.md)& texcoords = 0, const float displacement = 1)
- uint32_t **AddVertex**(const float x, const float y, const float z, const float nx = 0, const float ny = 0, const float nz = 0, const float u0 = 0, const float v0 = 0, const float displacement = 1)

| Parameter | Description |
|---|---|
| position, (x, y, z) | vertex position |
| normal, (nx, ny, nz) | vertex normal |
| texcoords, (u, v) | vertex texture coordinates |
| displacement | maximum tessellation displacement value |

## Returns

Returns the index of the new vertex.
