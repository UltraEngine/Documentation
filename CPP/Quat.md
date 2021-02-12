# Quat #
This structure describes a quaternion rotation. Quaternions are more accurate than Euler angles because they do not suffer from Gimbal lock, but they more difficult to intuitively understand.

## Constructors ##
- **Quat**(const float x, const float y, const float z, const float w)
- **Quat**(const [Vec3](Vec3.md)& euler)
- **Quat**(const float angle, const [Vec3](Vec3.md)& axis)

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