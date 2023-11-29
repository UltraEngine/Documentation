# TransformPlane

This function transforms a 3D plane from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformPlane**(const [Plane](Plane.md)& p, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformPlane**(const float x, const float y, const float z, const float d, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [xVec3](xVec3.md) **TransformPlane**(const [xPlane](xPlane.md)& p, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)
- [xVec3](xVec3.md) **TransformPlane**(const float x, const float y, const float z, const float d, shared_ptr<[Entity](Entity.md)\> src, shared_ptr<[Entity](Entity.md)\> dst)

Parameter | Description
---|---
p, (x, y, z, d) | 3D plane to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed plane.

**Syntax in C#:**

```csharp
Vec3 TransformPlane(Plane p, Mat4 src, Mat4 dst)
Vec3 TransformPlane(float x, float y, float z, float d, Mat4 src, Mat4 dst)
xVec3 TransformPlane(xPlane p, shared_ptr<Entity> src, shared_ptr<Entity> dst)
xVec3 TransformPlane(float x, float y, float z, float d, shared_ptr<Entity> src, shared_ptr<Entity> dst)
```

**Parameter Description**

p, (x, y, z, d): 3D plane to transform
src: source 4x4 matrix or entity
dst: destination 4x4 matrix or entity

**Returns**

Returns the transformed plane.