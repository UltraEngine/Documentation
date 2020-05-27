# Quat #
This structure describes a quaternion rotation using double float precision.

## Constructors ##
- **Quat**(const double x, const double y, const double z, const double w)
- **Quat**(const dVec3& euler)
- **Quat**(const double angle, const dVec3& axis)

## Members ##
- double **x**
- double **y**
- double **z**
- double **w**

## Methods ##
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp
