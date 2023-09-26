# TransformAabb

This function transforms a 3D bounding box from one space to another.

## Syntax

- [Aabb](Aabb.md) **TransformAabb**(const [Aabb](Aabb.md)& aabb, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst, const bool exact = false)
- [Aabb](Aabb.md) **TransformAabb**(const [xAabb](xAabb.md)& aabb, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst, const bool exact = false)

Parameter | Description
---|---
aabb | bounding box to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity
exact | if set to true a more accurate but slower test is performed that can result in a tighter volume

## Returns

Returns the transformed bounding box.
