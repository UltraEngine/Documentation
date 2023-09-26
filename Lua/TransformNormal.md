# TransformNormal

This function transforms a normalized vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformNormal**([Vec3](Vec3.md) n, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [Vec3](Vec3.md) **TransformNormal**(number x, number y, number z, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xVec3](xVec3.md) **TransformNormal**([xVec3](xVec3.md) n, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [xVec3](xVec3.md) **TransformNormal**(number x, number y, number z, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
n, (x, y, z) | normal to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed normal.
