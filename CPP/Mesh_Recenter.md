# Mesh::Recenter

This method centers a mesh along one or more axes.

## Syntax

- void **Recenter**(const bool x = true, const bool y = true, const bool z = true)

| Parameter | Description |
|---|---|
| x, y, z | if set to true the mesh will be recentered along this axis |

## Remarks

No changes will be visible until a call to [Mesh::Finalize](Mesh_Finalize.md) is made.
