# Mesh::Modify

This method performs a batch modification of mesh data.

## Syntax

- void **Modify**(const vector<[Vertex](Vertex.md)\>& vertices)
- void **Modify**(const vector<uint32_t\>& indices)

| Parameter | Description |
|---|---|
| vertices | vertex array to set |
| indices | indice array to set |

## Remarks

The size of the vertex or indice array must be less than or equal to the number of mesh vertices or indices.

If the indice array size is less than the number of mesh indices, the remaining indices will be set to 0.
