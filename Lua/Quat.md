# Quat

This class describes a quaternion rotation. Quaternions are more accurate than Euler angles and do not suffer from Gimbal lock, but they more difficult to intuitively understand.

| Property | Type | Description |
|---|---|---|
| Quat | Constructor | Quat(number x, number y, number z, number w) |
| Quat | Constructor | Quat([Vec3](Vec3.md) euler) |
| Quat | Constructor | Quat(number angle, [Vec3](Vec3.md) axis) |
| x | float | X component |
| y | float | Y component |
| z | float | Z component |
| w | float | W component |
| [Inverse](Quat_Inverse.md) | Method | gets the inverse quaternion |
| [Normalize](Quat_Normalize.md) | Method | gets the normalized quaternion |
| [Slerp](Quat_Slerp.md) | Method | spherical linear interpolation for smooth transitions between 3D rotations |
| [ToEuler](Quat_ToEuler.md) | Method | converts the quaternion to a Euler angle |
