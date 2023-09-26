# TransformRotation

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformRotation**(const [Vec3](Vec3.md)& v, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformRotation**(const float x, const float y, const float z, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [xVec3](xVec3.md) **TransformRotation**(const [xVec3](xVec3.md)& rotation, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)
- [xVec3](xVec3.md) **TransformRotation**(const dFloat x, const dFloat y, const dFloat z, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)
- [Quat](Quat.md) **TransformRotation**(const [Quat](Quat.md)& rotation, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [xQuat](xQuat.md) **TransformRotation**(const [xQuat](xQuat.md)& rotation, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)

Parameter | Description
---|---
rotation, (x, y, z) | 3D vector to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed rotation.
