## mesh:AddPrimitive

This method adds a single line, triangle, or quad to the mesh.

### Syntax

```lua
index = mesh:AddPrimitive(a, b)
index = mesh:AddPrimitive(a, b, c)
index = mesh:AddPrimitive(a, b, c, d)
```

### Parameters

- `a`, `b`, `c`, `d`: Vertex indices

### Returns

- `index`: The index of the new primitive

### Remarks

The number of arguments must match the mesh primitive type.