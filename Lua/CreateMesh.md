# CreateMesh

This function creates a new mesh.

## Syntax

```lua
function CreateMesh(primitive = MESH_TRIANGLES, vertices = {}, indices = {})
```

### Parameters

| Parameter | Description |
|---|---|
| primitive | can be MESH_POINTS, MESH_LINES, MESH_TRIANGLES, or MESH_QUADS |
| vertices | optional vertex array |
| indices | optional indice array |

## Returns

Returns a new mesh if successful.

If the indices array size is not evenly divisible by the number of indices per primitive then NULL is returned.

If the indices array contains invalid vertex indices then NULL is returned.