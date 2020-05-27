# Quat #
This structure describes a quaternion rotation.

## Constructors ##
- **Quat**(const float x, const float y, const float z, const float w)
- **Quat**(const Vec3& euler)
- **Quat**(const float angle, const Vec3& axis)

## Members ##
- float **x**
- float **y**
- float **z**
- float **w**

## Methods ##
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp
