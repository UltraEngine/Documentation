# Mesh::AddPrimitive

This method add a single line, triangle, or quad to the mesh.

## Syntax

- int **AddPrimitive**(const uint32_t a, const uint32_t b)
- int **AddPrimitive**(const uint32_t a, const uint32_t b, const uint32_t c)
- int **AddPrimitive**(const uint32_t a, const uint32_t b, const uint32_t c, const uint32_t d)

| Parameter | Description |
|---|---|
| a, b, c, d | vertex indices |

## Returns

Returns the index of the new primitive.

## Remarks

THe number of arguments must match the mesh primitive type.
