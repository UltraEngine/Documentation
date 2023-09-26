# TransformRotation

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformRotation**([Vec3](Vec3.md) v, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [Vec3](Vec3.md) **TransformRotation**(number x, number y, number z, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xVec3](xVec3.md) **TransformRotation**([xVec3](xVec3.md) rotation, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [xVec3](xVec3.md) **TransformRotation**(number x, number y, number z, [Entity](Entity.md) src, [Entity](Entity.md) dst)
- [Quat](Quat.md) **TransformRotation**([Quat](Quat.md) rotation, [Mat4](Mat4.md) src, [Mat4](Mat4.md) dst)
- [xQuat](xQuat.md) **TransformRotation**([xQuat](xQuat.md) rotation, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
rotation, (x, y, z) | Euler or quaternion rotation to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed rotation.
