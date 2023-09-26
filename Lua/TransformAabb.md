# TransformAabb

This function transforms a 3D bounding box from one space to another.

## Syntax

- [Aabb](Aabb.md) **TransformAabb**([Aabb](Aabb.md) aabb, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst, boolean exact = false)
- [Aabb](Aabb.md) **TransformAabb**([xAabb](xAabb.md) aabb, [Entity](Entity.md) src, [Entity](Entity.md) dst, boolean exact = false)

Parameter | Description
---|---
aabb | bounding box to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity
exact | if set to true a more accurate but slower test is performed that can result in a tighter volume

## Returns

Returns the transformed bounding box.
