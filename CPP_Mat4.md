# Mat4 #
This structure describes a 4x4 matrix.

## Members ##
- [Vec4](API_Vec4) **i**
- [Vec4](API_Vec4) **j**
- [Vec4](API_Vec4) **k**
- [Vec4](API_Vec4) **t**

## Constructors ##
- **Mat4**()
- **Mat4**(const float scale)
- **Mat4**(const [Vec4](API_Vec4)& i, const [Vec4](API_Vec4)& j, const [Vec4](API_Vec4)& k, const [Vec4](API_Vec4)& t)
- **Mat4**(const Vec3& translation, const Vec3& rotation, const Vec3& scale)
- **Mat4**(const Vec3& translation, const Quat& rotation, const Vec3& scale)
- **Mat4**(const float ix, const float iy, const float iz, const float iw, const float jx, const float jy, const float jz, const float jw, const float kx, const float ky, const float kz, const float kw, const float tx, const float ty, const float tz, const float tw)

## Methods ##
- Determinant
- GetTranslation
- GetQuaternion
- GetRotation
- GetScale
- Inverse
- Ortho
- Perspective
- Transpose
- Normalize
