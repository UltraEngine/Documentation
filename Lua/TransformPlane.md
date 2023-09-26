# TransformPlane

This function transforms a 3D plane from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformPlane**([Plane](Plane.md) p, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [Vec3](Vec3.md) **TransformPlane**(number x, number y, number z, number d, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xVec3](xVec3.md) **TransformPlane**([xPlane](xPlane.md) p, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [xVec3](xVec3.md) **TransformPlane**(number x, number y, number z, number d, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
p, (x, y, z, d) | 3D plane to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed plane.
