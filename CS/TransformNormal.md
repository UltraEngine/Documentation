# TransformNormal

This function transforms a 3D point from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformNormal**(const [Vec3](Vec3.md)& normal, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformNormal**(const float x, const float y, const float z, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [xVec3](xVec3.md) **TransformNormal**(const [xVec3](xVec3.md)& normal, shared_ptr<[Entity](Entity.md)> src, shared_ptr<[Entity](Entity.md)> dst)
- [xVec3](xVec3.md) **TransformNormal**(const float x, const float y, const float z, shared_ptr<[Entity](Entity.md)> src, shared_ptr<[Entity](Entity.md)> dst)

Parameter | Description
---|---
normal, (x, y, z) | position to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed normal.


# TransformNormal

This function transforms a 3D point from one space to another.

## Syntax

- **Vec3** **TransformNormal**(const **Vec3** normal, const **Matrix4x4** src, const **Matrix4x4** dst)
- **Vec3** **TransformNormal**(const **float** x, const **float** y, const **float** z, const **Matrix4x4** src, const **Matrix4x4** dst)
- **xVec3** **TransformNormal**(const **xVec3** normal, **shared_ptr<Entity>** src, **shared_ptr<Entity>** dst)
- **xVec3** **TransformNormal**(const **float** x, const **float** y, const **float** z, **shared_ptr<Entity>** src, **shared_ptr<Entity>** dst)

Parameter | Description
---|---
normal, (x, y, z) | position to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed normal.