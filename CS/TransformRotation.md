# TransformRotation

This function transforms a 3D vector from one space to another.

## Syntax

- [Vec3](Vec3.md) **TransformRotation**(const [Vec3](Vec3.md)& v, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vec3](Vec3.md) **TransformRotation**(const float x, const float y, const float z, const [Mat4](Mat4.md)& src, const [Mat4](Mat4.md)& dst)
- [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=netcore-3.1) **TransformRotation**(float x, float y, float z, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) src, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) dst)
- [Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=netcore-3.1) **TransformRotation**([Vector3](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.vector3?view=netcore-3.1) v, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) src, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) dst)
- [Quaternion](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.quaternion?view=netcore-3.1) **TransformRotation**([Quaternion](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.quaternion?view=netcore-3.1) rotation, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) src, [Matrix4x4](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.matrix4x4?view=netcore-3.1) dst)
- [Quaternion](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.quaternion?view=netcore-3.1) **TransformRotation**([Quaternion](https://docs.microsoft.com/en-us/dotnet/api/system.numerics.quaternion?view=netcore-3.1) rotation, [Entity](Entity.md) src, [Entity](Entity.md) dst)

Parameter | Description
---|---
rotation, (x, y, z) | Euler or quaternion rotation to transform
src | source 4x4 matrix or entity
dst | destination 4x4 matrix or entity

## Returns

Returns the transformed rotation.

## Example

```csharp
Vector3 v = new Vector3(1, 2, 3);
Matrix4x4 src = new Matrix4x4();
Matrix4x4 dst = new Matrix4x4();
Vector3 transformedRotation = TransformRotation(v, src, dst);
```