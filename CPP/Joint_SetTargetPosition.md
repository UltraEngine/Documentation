# Joint::SetTargetPosition

This method sets the target rotation of a motorized hinge or kinematic joint.

## Syntax

- void **SetTargetPosition**(const dFloat rotation)
- void **SetTargetPosition**(const [xQuat](xQuat.md)& rotation)
- void **SetTargetPosition**(const [xVec3](xVec3.md)& rotation)
- void **SetTargetPosition**(const dFloat pitch, const dFloat yaw, const dFloat roll)

| Parameter | Description |
|---|---|
| rotation, (pitch, yaw, roll) | target rotation to set |

## Remarks

A hinge joint accepts a single rotation value. A kinematic joint requires a quaternion or Euler rotation.

You must call [Joint::SetMaxTorque](Joint_SetMaxTorque.md) and specify a non-zero torque before this command will have any effect.
