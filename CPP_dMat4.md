# dMat4 #
This structure describes a 4x4 matrix with double float precision.

## Constructors ##
- **dMat4**()
- **dMat4**(const float scale)
- **dMat4**(const [dVec4](API_dVec4)& i, const [dVec4](API_dVec4)& j, const [dVec4](API_dVec4)& k, const [dVec4](API_dVec4)& t)
- **dMat4**(const float ix, const float iy, const float iz, const float iw, const float jx, const float jy, const float jz, const float jw, const float kx, const float ky, const float kz, const float kw, const float tx, const float ty, const float tz, const float tw)

## Members ##
- [dVec4](API_dVec4) **i**
- [dVec4](API_dVec4) **j**
- [dVec4](API_dVec4) **k**
- [dVec4](API_dVec4) **t**

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
