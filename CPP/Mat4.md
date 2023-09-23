# Mat4

This class describes a 4x4 matrix used for 3D orientations in space.

| Property | Type | Description |
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
| [Determinant](Mat4_Determinant.md) | Method | gets the matrix determinant |
| [GetQuaternion](Mat4_GetQuaterniont.md) | Method | gets the matrix rotation |
| [GetRotation](Mat4_GetRotation.md) | Method | gets the matrix Euler rotation |
| [GetScale](Mat4_GetScale.md) | Method | gets the matrix scale |
| [GetTranslation](Mat4_GetTranslation.md) | Method | gets the matrix translation |
| [Inverse](Mat4_Inverse.md) | Method | gets the inverse matrix |
| [Normalize](Mat4_Normalize.md) | Method | gets the normalized matrix |
| [Transpose](Mat4_Transpose.md) | Method | gets the transpose matrix |
