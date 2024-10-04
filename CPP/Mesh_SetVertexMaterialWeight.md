# Mesh::SetVertexMaterialWeight

This method sets the material weight of a single vertex in the mesh.

## Syntax

- void **SetVertexMaterialWeight**(const uint32_t vertex, const float weight, const int index)

| Parameter | Description |
|---|---|
| vertex | vertex index, starting with zero |
| weight | material weight to set, between 0 and 1 |
| index | material index, can be 0, 1, 2, or 3 |
