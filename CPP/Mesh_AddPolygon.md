# Mesh::AddPolygon

This method adds a polygon to a mesh.

## Syntax

- uint32_t **AddPolygon**(const uint32_t a, const uint32_t b)
- uint32_t **AddPolygon**(const uint32_t a, const uint32_t b, const uint32_t c)
- uint32_t **AddPolygon**(const uint32_t a, const uint32_t b, const uint32_t c, const uint32_t d)

| Parameter | Description |
|---|---|
| a | first indice |
| b | second indice |
| c | third indice, for a triangle or quad mesh |
| d | fourth indice, for a quad mesh |

## Remarks

The number of indices being added must match the number of polygon vertices the mesh uses. For example, you must use the overload of the method that adds three indices if the mesh is a triangle mesh.

## Returns

Returns the polygon index, or -1 if the polygon could not be added.
