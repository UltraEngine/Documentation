# Quat

This class describes a quaternion rotation. Quaternions are more accurate than Euler angles and do not suffer from Gimbal lock, but they more difficult to intuitively understand.

## Properties

| Name | Type | Description |
|---|---|---|
| Quat | Constructor | Quat(const float x, const float y, const float z, const float w) |
| Quat | Constructor | Quat(const [Vec3](Vec3.md)& euler) |
| Quat | Constructor | Quat(const float angle, const [Vec3](Vec3.md)& axis) |
| x | float | X component |
| y | float | Y component |
| z | float | Z component |
| w | float | W component |
| [Inverse](Quat_Inverse.md) | Method | |
| [Normalize](Quat_Normalize.md) | Method | |
| [Slerp](Quat_Slerp.md) | Method | spherical linear interpolation for smooth transitions between 3D rotations |
| [ToEuler](Quat_ToEuler.md) | Method | converts the quaternion to a Euler angle |
