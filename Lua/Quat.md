# Quat

This class describes a quaternion rotation. Quaternions are more accurate than Euler angles and do not suffer from Gimbal lock, but they are more difficult to intuitively understand.

## Properties

| Name | Type | Description |
|---|---|---|
| Quat | Constructor | `Quat(x: number, y: number, z: number, w: number)` |
| Quat | Constructor | `Quat(euler: Vec3)` |
| Quat | Constructor | `Quat(angle: number, axis: Vec3)` |
| x | number | X component |
| y | number | Y component |
| z | number | Z component |
| w | number | W component |
| [Inverse](Quat_Inverse.md) | Method | gets the inverse quaternion |
| [Normalize](Quat_Normalize.md) | Method | gets the normalized quaternion |
| [Slerp](Quat_Slerp.md) | Method | spherical linear interpolation for smooth transitions between 3D rotations |
| [ToEuler](Quat_ToEuler.md) | Method | converts the quaternion to an Euler angle |

## Example

```lua
-- Create a new quaternion with components (1, 2, 3, 4)
local quat1 = Quat(1, 2, 3, 4)

-- Create a new quaternion from a Vec3 object
local euler = Vec3(1, 2, 3)
local quat2 = Quat(euler)

-- Create a new quaternion from an angle and an axis
local angle = 45
local axis = Vec3(1, 0, 0)
local quat3 = Quat(angle, axis)

-- Get the inverse quaternion
local inverseQuat = quat1:Inverse()

-- Get the normalized quaternion
local normalizedQuat = quat2:Normalize()

-- Perform spherical linear interpolation between two quaternions
local quat4 = quat1:Slerp(quat2, 0.5)

-- Convert the quaternion to an Euler angle
local eulerAngle = quat3:ToEuler()
```