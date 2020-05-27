# dMat4 #
This structure describes a 4x4 matrix with double float precision.

## Constructors ##
- **dMat4**()
- **dMat4**(const double scale)
- **dMat4**(const [dVec4](API_dVec4)& i, const [dVec4](API_dVec4)& j, const [dVec4](API_dVec4)& k, const [dVec4](API_dVec4)& t)
- **dMat4**(const double ix, const double iy, const double iz, const double iw, const double jx, const double jy, const double jz, const double jw, const double kx, const double ky, const double kz, const double kw, const double tx, const double ty, const double tz, const double tw)

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
