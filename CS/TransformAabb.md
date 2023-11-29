# TransformAabb

This function transforms a 3D bounding box from one space to another.

## Syntax

- [Aabb](Aabb.md) **TransformAabb**(Aabb aabb, Mat4 src, Mat4 dst, bool exact = false)
- [Aabb](Aabb.md) **TransformAabb**(xAabb aabb, shared_ptr<Entity> src, shared_ptr<Entity> dst, bool exact = false)

Parameter | Description
---|---
aabb | bounding box to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity
exact | if set to true a more accurate but slower test is performed that can result in a tighter volume

## Returns

Returns the transformed bounding box.