# CreateMesh

This function creates a new mesh.

## Syntax

```csharp
Mesh CreateMesh(MeshPrimitives primitive = MeshPrimitives.MESH_TRIANGLES, List<Vertex> vertices = null, List<uint> indices = null)
```

| Parameter | Description |
|---|---|
| primitive | can be `MeshPrimitives.MESH_POINTS`, `MeshPrimitives.MESH_LINES`, `MeshPrimitives.MESH_TRIANGLES`, or `MeshPrimitives.MESH_QUADS` |
| vertices | optional vertex array |
| indices | optional indice array |

## Returns

Returns a new mesh if successful.

If the indices array size is not evenly divisible by the number of indices per primitive then null is returned.

If the indices array contains invalid vertex indices then null is returned.

Example:

```csharp
// Creating a new mesh with triangles
Mesh mesh = CreateMesh(MeshPrimitives.MESH_TRIANGLES, new List<Vertex> { vertex1, vertex2, vertex3 }, new List<uint> { 0, 1, 2 });
```