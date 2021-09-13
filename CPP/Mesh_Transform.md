# Mesh::Transform

This method multiplies all vertex positions, normals, and tangents by the specified matrix.

## Syntax 

- void **Transform**(const [Mat4](Mat4.md) matrix)

| Parameter | Description |
|---|---|
| matrix | mesh transform matrix |

## Remarks

A call to [Mesh::Finalize](Mesh_Finalize.md) must be made before the results of this command are visible.
