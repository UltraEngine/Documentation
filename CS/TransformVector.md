# TransformVector

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformVector**(Vec3 v, Mat4 src, Mat4 dst)
- [Vec3](Vec3.md) **TransformVector**(float x, float y, float z, Mat4 src, Mat4 dst)
- [xVec3](xVec3.md) **TransformVector**(xVec3 v, shared_ptr<Entity> src, shared_ptr<Entity> dst)
- [xVec3](xVec3.md) **TransformVector**(float x, float y, float z, shared_ptr<Entity> src, shared_ptr<Entity> dst)

Parameter | Description
---|---
v, (x, y, z) | 3D vector to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed vector.

## Example

```csharp
Vec3 v = new Vec3(1.0f, 2.0f, 3.0f);
Mat4 src = new Mat4();
Mat4 dst = new Mat4();

Vec3 transformedVector = TransformVector(v, src, dst);
```

```csharp
float x = 1.0f;
float y = 2.0f;
float z = 3.0f;
Mat4 src = new Mat4();
Mat4 dst = new Mat4();

Vec3 transformedVector = TransformVector(x, y, z, src, dst);
```

```csharp
xVec3 v = new xVec3(1.0f, 2.0f, 3.0f);
shared_ptr<Entity> src = new shared_ptr<Entity>();
shared_ptr<Entity> dst = new shared_ptr<Entity>();

xVec3 transformedVector = TransformVector(v, src, dst);
```

```csharp
float x = 1.0f;
float y = 2.0f;
float z = 3.0f;
shared_ptr<Entity> src = new shared_ptr<Entity>();
shared_ptr<Entity> dst = new shared_ptr<Entity>();

xVec3 transformedVector = TransformVector(x, y, z, src, dst);
```