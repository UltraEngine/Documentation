## Mesh:CountVertices

This method returns the number of vertices in the mesh.

### Syntax

```lua
function Mesh:CountVertices()
```

### Returns

Returns the number of mesh vertices.

## Example

```lua
local mesh = Mesh() -- create a new mesh object
local vertexCount = mesh:CountVertices() -- get the number of vertices in the mesh
print("Vertex Count:", vertexCount) -- print the number of vertices
```