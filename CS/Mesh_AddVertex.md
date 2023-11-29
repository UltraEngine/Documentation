# Mesh.AddVertex

This methods adds a new vertex to the mesh.

## Syntax

- uint **AddVertex**(Vec3 position, Vec3 normal = 0, Vec2 texcoords = 0, float displacement = 1)
- uint **AddVertex**(float x, float y, float z, float nx = 0, float ny = 0, float nz = 0, float u = 0, float v = 0, float displacement = 1)

| Parameter | Description |
|---|---|
| position, (x, y, z) | vertex position |
| normal, (nx, ny, nz) | vertex normal |
| texcoords, (u, v) | vertex texture coordinates |
| displacement | maximum tessellation displacement value |

## Returns

Returns the index of the new vertex.

## Remarks

Once a mesh has been submitted to the rendering thread, additional vertices cannot be added to it. This occurs during the first call to [World.Render](World_Render.md) after the mesh is created.

## Example

```csharp
// Create a new Mesh object
Mesh mesh = new Mesh();

// Add vertex using vectors
Vec3 position = new Vec3(1, 2, 3);
Vec3 normal = new Vec3(0, 0, 1);
Vec2 texcoords = new Vec2(0.5f, 0.5f);
float displacement = 1;
uint index1 = mesh.AddVertex(position, normal, texcoords, displacement);

// Add vertex using individual coordinates
float x = 4;
float y = 5;
float z = 6;
float nx = 0;
float ny = 0;
float nz = 1;
float u = 0;
float v = 0;
float displacement = 1;
uint index2 = mesh.AddVertex(x, y, z, nx, ny, nz, u, v, displacement);
```