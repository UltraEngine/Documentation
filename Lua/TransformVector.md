# TransformVector

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformVector**([Vec3](Vec3.md) v, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [Vec3](Vec3.md) **TransformVector**(number x, number y, number z, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xVec3](xVec3.md) **TransformVector**([xVec3](xVec3.md) v, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [xVec3](xVec3.md) **TransformVector**(number x, number y, number z, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
v, (x, y, z) | position to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed vector.
