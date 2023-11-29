```csharp
public Mesh AddMesh(MeshPrimitives type = MeshPrimitives.MESH_TRIANGLES, int lod = 0);
public Mesh AddMesh(Mesh mesh, int lod = 0);
```

| Parameter | Description |
|---|---|
| type | primitive type, can be MeshPrimitives.MESH_POINTS, MeshPrimitives.MESH_LINES, MeshPrimitives.MESH_TRIANGLES, or MeshPrimitives.MESH_QUADS |
| mesh | adds an existing mesh to the model |
| lod | mesh detail level |

## Returns

Returns the added mesh.