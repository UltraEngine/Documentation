# Mesh::AddPolygon

This method adds a polygon to a mesh.

## Syntax

- int **AddPolygon**(const int a, const int b)
- int **AddPolygon**(const int a, const int b, const int c)
- int **AddPolygon**(const int a, const int b, const int c, const int d)

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
