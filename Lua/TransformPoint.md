# TransformPoint

This function transforms a 3D point from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformPoint**([Vec3](Vec3.md) point, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [Vec3](Vec3.md) **TransformPoint**(number x, number y, number z, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xVec3](xVec3.md) **TransformPoint**([xVec3](xVec3.md) poin, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [xVec3](xVec3.md) **TransformPoint**(number x, number y, number z, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
point, (x, y, z) | position to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed point.
