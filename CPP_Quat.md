# Quat #
This structure describes a quaternion rotation. Quaternions are more accurate than Euler angles, but more difficult to intuitively understand.

## Members ##
- float **x**
- float **y**
- float **z**
- float **w**

## Constructors ##
- **Quat**(const float x, const float y, const float z, const float w)
- **Quat**(const [Vec3](CPP_Vec3.md)& euler)
- **Quat**(const float angle, const [Vec3](CPP_Vec3.md)& axis)

## Methods ##
- Euler
- GetAverageOmega
- Inverse
- Normalize
- Slerp
