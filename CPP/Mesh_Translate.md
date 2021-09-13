# Mesh::Translate

This method translates all vertex positions by the specified offset.

## Syntax 

- void **Translate**(const [Vec3](Vec3.md) offset)
- void **Translate**(const float x, const float y, const float z)

| Parameter | Description |
|---|---|
| offset, (x, y, z) | offset to translate mesh vertices by |

## Remarks

A call to [Mesh::Finalize](Mesh_Finalize.md) must be made before the results of this command are visible.
