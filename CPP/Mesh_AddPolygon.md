# Mesh::AddPrimitive

This method adds a primtive to a mesh.

## Syntax

- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const PrimitiveAttributes attributes = PRIMITIVE_TESSELLATE_NONE)
- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const unsigned int c, const PrimitiveAttributes attributes = PRIMITIVE_TESSELLATE_NONE)
- unsigned int **AddPrimitive**(const unsigned int a, const unsigned int b, const unsigned int c, const unsigned int d, const PrimitiveAttributes attributes = PRIMITIVE_TESSELLATE_NONE)

| Parameter | Description |
|---|---|
| a | first indice |
| b | second indice |
| c | third indice, for a triangle or quad mesh |
| d | fourth indice, for a quad mesh |
| attributes | primitive attributes, can be any combination of values from the table below |

## Remarks

The number of indices being added must match the number of polygon vertices the mesh uses. For example, you must use the overload of the method that adds three indices if the mesh is a triangle mesh.

Once a mesh has been submitted to the rendering thread, additional primitives cannot be added to it. This occurs during the first call to [World::Render](World_Render.md) after the mesh is created.

The table below describes the bitwise values that can be specified in the *flags* parameter.

| Attribute | Description |
| --- | --- |
| PRIMITIVE_TESSELLATE_NONE | no tessellation |
| PRIMITIVE_TESSELLATE_EDGE0 | primitive is tessellated along edge 0 |
| PRIMITIVE_TESSELLATE_EDGE1 | primitive is tessellated along edge 1 |
| PRIMITIVE_TESSELLATE_EDGE2 | primitive is tessellated along edge 2 |
| PRIMITIVE_TESSELLATE_EDGE3 | for quads only, primitive is tessellated along edge 3 |
| PRIMITIVE_TESSELLATE_ALL | primitive is tessellated along all edges |
| PRIMITIVE_COPLANAR | indicates all vertices of the primitive are coplanar, even after tessellation |

## Returns

Returns the index of the added primitive.
