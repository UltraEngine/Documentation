# Mesh::AddVertex

This methods adds a new vertex to the mesh.

## Syntax

- int **AddVertex**(const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal = 0, const [Vec2](Vec2.md)& texcoords = 0, const float displacement = 1)
- int **AddVertex**(const float x, const float y, const float z, const float nx = 0, const float ny = 0, const float nz = 0, const float u0 = 0, const float v0 = 0, const float displacement = 1)

| Parameter | Description |
|---|---|
| position, (x, y, z) | |
| normal, (nx, ny, nz) | |
| texcoords, (u, v) | |
| displacement | |

## Returns

Returns the index of the new vertex.
