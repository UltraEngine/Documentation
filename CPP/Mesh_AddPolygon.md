# Mesh::AddPrimitive

This method adds a polygon to a mesh.

## Syntax

- uint32_t **AddPrimitive**(const uint32_t a, const uint32_t b, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)
- uint32_t **AddPrimitive**(const uint32_t a, const uint32_t b, const uint32_t c, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)
- uint32_t **AddPrimitive**(const uint32_t a, const uint32_t b, const uint32_t c, const uint32_t d, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)

| Parameter | Description |
|---|---|
| a | first indice |
| b | second indice |
| c | third indice, for a triangle or quad mesh |
| d | fourth indice, for a quad mesh |
| flags | primitive flags, can be PRIMITIVE_DEFAULT or any combination of PRIMITIVE_FLAT, PRIMITIVE_TESSELLATE_OUTER0, PRIMITIVE_TESSELLATE_OUTER1, PRIMITIVE_TESSELLATE_OUTER2, PRIMITIVE_TESSELLATE_OUTER3, PRIMITIVE_TESSELLATE_INNER0, and PRIMITIVE_TESSELLATE_INNER1 |

## Remarks

The number of indices being added must match the number of polygon vertices the mesh uses. For example, you must use the overload of the method that adds three indices if the mesh is a triangle mesh.

## Returns

Returns the polygon index, or -1 if the polygon could not be added.
