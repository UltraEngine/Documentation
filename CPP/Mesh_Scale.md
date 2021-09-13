# Mesh::Scale

This method scales all vertex positions by the specified value.

## Syntax 

- void **Scale**(const [Vec3](Vec3.md) offset)
- void **Scale**(const float x, const float y, const float z)

| Parameter | Description |
|---|---|
| scale, (x, y, z) | mesh vertex scale |

## Remarks

A call to [Mesh::Finalize](Mesh_Finalize.md) must be made before the results of this command are visible.
