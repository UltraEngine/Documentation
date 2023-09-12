# dQuat #
This structure describes a quaternion rotation with double float precision.

## Members ##
- number **x**
- number **y**
- number **z**
- number **w**

## Constructors ##
- **Quat**(x: number, y: number, z: number, w: number): [Quat](#Quat)
- **Quat**(euler: [dVec3](dVec.md)): [Quat](#Quat)
- **Quat**(angle: number, axis: [dVec3](dVec.md)): [Quat](#Quat)

## Methods ##
- Euler()
- GetAverageOmega()
- Inverse()
- Normalize()
- Slerp()

Example usage:
```lua
-- Create a quaternion with custom x, y, z, and w values
local quat1 = Quat(0.1, 0.2, 0.3, 0.4)

-- Create a quaternion from Euler angles
local euler = dVec3(0.1, 0.2, 0.3)
local quat2 = Quat(euler)

-- Create a quaternion from an angle and axis
local axis = dVec3(1, 1, 0)
local quat3 = Quat(0.1, axis)

-- Perform operations on quaternions
local inverseQuat = quat1:Inverse()
local normalizedQuat = quat2:Normalize()
local slerpQuat = quat3:Slerp(0.5)
```