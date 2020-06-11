# dQuat #
This structure describes a quaternion rotation with double float precision.

## Members ##
- double **x**
- double **y**
- double **z**
- double **w**

## Constructors ##
- **Quat**(const double x, const double y, const double z, const double w)
- **Quat**(const dVec3& euler)
- **Quat**(const double angle, const dVec3& axis)

## Methods ##
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp
