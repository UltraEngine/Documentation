# Mesh::AddVertex

This methods adds a new vertex to the mesh.

## Syntax

- int **AddVertex**(const [Vec3](Vec3.md)& position, const [Vec3](Vec3.md)& normal, const [Vec2](Vec2.md)& texcoords0, const [Vec2](Vec2.md)& texcoords1, const [Vec4](Vec4.md)& color)
- int **AddVertex**(const float x, const float y, const float z, const float nx = 0.0, const float ny = 0.0, const float nz = 0.0, const float u0 = 0.0, const float v0 = 0.0, const float u1 = 0.0, const float v1 = 0.0, const float r = 1.0, const float g = 1.0, const float b = 1.0, const float a = 1.0)

| Parameter | Description |
|---|---|
| position | |
| normal | |
| texcoords0 | |
| texcoords1 | |
| color | |

## Returns

Returns the index of the new vertex.
