# Mesh::AddPrimitive

This method adds a primtive to a mesh.

## Syntax

- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)
- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const unsigned int c, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)
- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const PrimitiveFlags flags = PRIMITIVE_DEFAULT)

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
