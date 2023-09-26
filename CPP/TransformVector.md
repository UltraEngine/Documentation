# TransformVector

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformVector**(const [Vec3](Vec3.md)& v, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformVector**(const float x, const float y, const float z, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [xVec3](xVec3.md) **TransformVector**(const [xVec3](xVec3.md)& v, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)
- [xVec3](xVec3.md) **TransformVector**(const dFloat x, const dFloat y, const dFloat z, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)

Parameter | Description
---|---
v, (x, y, z) | 3D vector to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed vector.
