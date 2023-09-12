# Mesh:CountPrimitives

This method retrieves the number of mesh primitives.

---
## Syntax

`uint32_t Mesh:CountPrimitives()`

---
## Returns

Returns the number of primitives the mesh contains.

---
## Example

```lua
local mesh = Mesh()
local numPrimitives = mesh:CountPrimitives()
print("Number of primitives:", numPrimitives)
```