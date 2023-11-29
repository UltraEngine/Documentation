## Syntax

- void **Scale**(Vec3 offset)
- void **Scale**(float x, float y, float z)

**Parameters**

- **offset** - A [Vec3](link) representing the amount by which to scale the mesh's vertex positions.

- **x** - The amount by which to scale the mesh's vertex positions along the x-axis.

- **y** - The amount by which to scale the mesh's vertex positions along the y-axis.

- **z** - The amount by which to scale the mesh's vertex positions along the z-axis.

```c#
// Example usage
Mesh mesh = new Mesh();

// Using Vec3 offset
Vec3 scaleOffset = new Vec3(2.0f, 2.0f, 2.0f);
mesh.Scale(scaleOffset);

// Using float values
float scaleX = 2.0f;
float scaleY = 2.0f;
float scaleZ = 2.0f;
mesh.Scale(scaleX, scaleY, scaleZ);
```