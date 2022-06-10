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
| flags | primitive flags, can be PRIMITIVE_DEFAULT or any combination of values in the table below. |

## Remarks

| Flag | Description |
| --- | --- |
| PRIMITIVE_TESSELLATE_OUTER0 | primitive is tessellated along the outside of the edge between indices 0 and 1 |
| PRIMITIVE_TESSELLATE_OUTER1 | primitive is tessellated along the outside of the edge between indices 1 and 2 |
| PRIMITIVE_TESSELLATE_OUTER2 | primitive is tessellated along the outside of the edge between indices 2 and 3 |
| PRIMITIVE_TESSELLATE_OUTER3 | for quads only, primitive is tessellated along the outside of the edge between indices 3 and 0 |
| PRIMITIVE_TESSELLATE_INNER0 | interior of primitive is tessellated |
| PRIMITIVE_TESSELLATE_INNER1 | for quads only, interior of primitive is tessellated |
| PRIMITIVE_TESSELLATE_ALL | primitive is tessellated along all edges |

The number of indices being added must match the number of polygon vertices the mesh uses. For example, you must use the overload of the method that adds three indices if the mesh is a triangle mesh.

Once a mesh has been finalized, additional primitives cannot be added to it.

## Returns

Returns the index of the added primitive.
