# Quat

This class describes a quaternion rotation. Quaternions are more accurate than Euler angles and do not suffer from Gimbal lock, but they more difficult to intuitively understand.

| Property | Type | Description |
|---|---|---|
| Quat | Constructor | Quat(float x, float y, float z, float w) |
| Quat | Constructor | Quat(Vec3 euler) |
| Quat | Constructor | Quat(float angle, Vec3 axis) |
| x | float | X component |
| y | float | Y component |
| z | float | Z component |
| w | float | W component |
| [Inverse](Quat_Inverse.md) | Method | gets the inverse quaternion |
| [Normalize](Quat_Normalize.md) | Method | gets the normalized quaternion |
| [Slerp](Quat_Slerp.md) | Method | spherical linear interpolation for smooth transitions between 3D rotations |
| [ToEuler](Quat_ToEuler.md) | Method | converts the quaternion to a Euler angle |

## Example syntax in C#

```csharp
Quat quaternion = new Quat(x, y, z, w);
Quat quaternion = new Quat(euler);
Quat quaternion = new Quat(angle, axis);

float x = quaternion.x;
float y = quaternion.y;
float z = quaternion.z;
float w = quaternion.w;

Quat inverseQuaternion = quaternion.Inverse();
Quat normalizedQuaternion = quaternion.Normalize();
Quat slerpQuaternion = quaternion.Slerp(t, otherQuaternion);
Vec3 eulerAngle = quaternion.ToEuler();
```