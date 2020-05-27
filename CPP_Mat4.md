# Mat4 #
This structure describes a 4x4 matrix.

## Constructors ##
- **Mat4**()
- **Mat4**(const float scale)
- **Mat4**(const [Vec4](API_Vec4)& i, const [Vec4](API_Vec4)& j, const [Vec4](API_Vec4)& k, const [Vec4](API_Vec4)& t)
- **Mat4**(const float ix, const float iy, const float iz, const float iw, const float jx, const float jy, const float jz, const float jw, const float kx, const float ky, const float kz, const float kw, const float tx, const float ty, const float tz, const float tw)
- **Mat4**(const float* f)

## Members ##
- [Vec4](API_Vec4) **i**
- [Vec4](API_Vec4) **j**
- [Vec4](API_Vec4) **k**
- [Vec4](API_Vec4) **t**

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
