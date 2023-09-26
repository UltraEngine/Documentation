# TransformPoint

## Syntax

- [Vec3](Vec3.md) **TransformPoint**(const [Vec3](Vec3.md)& point, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformPoint**(const float x, const float y, const float z, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [dVec3](dVec3.md) **TransformPoint**(const [dVec3](dVec3.md)& point, const [dMat4](dMat4.md)& src, const [dMat4](dMat4.md)& dst)
- [dVec3](dVec3.md) **TransformPoint**(const double x, const double y, const double z, const [dMat4](dMat4.md)& src, const [dMat4](dMat4.md)& dst)
- [xVec3](xVec3.md) **TransformPoint**(const [xVec3](xVec3.md)& poin, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)
- [xVec3](xVec3.md) **TransformPoint**(const dFloat x, const dFloat y, const dFloat z, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)

Parameter | Description
---|---
point, (x, y, z) | position to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity
