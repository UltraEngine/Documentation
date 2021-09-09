# Mat4

This class describes a 4x4 matrix used for 3D orientations in space.

## Properties

| Name | Type | Description |
|---|---|---|
| i | [Vec4](Vec4) | first matrix row |
| j | [Vec4](Vec4) | second matrix row |
| k | [Vec4](Vec4) | third matrix row |
| t | [Vec4](Vec4) | fourth matrix row |
| Mat4 | Constructor | Mat4() |
| Mat4 | Constructor | Mat4(const float scale) |
| Mat4 | Constructor | Mat4(const [Vec4](Vec4)& i, const [Vec4](Vec4)& j, const [Vec4](Vec4)& k, const [Vec4](Vec4)& t) |
| Mat4 | Constructor | Mat4(const [Vec3](Vec3)& translation, const [Vec3](Vec3)& rotation, const [Vec3](Vec3)& scale) |
| Mat4 | Constructor | Mat4(const [Vec3](Vec3)& translation, const [Quat](Quat)& rotation, const [Vec3](Vec3)& scale) |
| Determinant | Method | |
| GetTranslation | Method | |
| GetQuaternion | Method | |
| GetRotation | Method | |
| GetScale | Method | |
| Inverse | Method | |
| Ortho | Method | |
| Perspective | Method | |
| Transpose | Method | |
| Normalize | Method | |
