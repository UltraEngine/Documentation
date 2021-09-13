# Joint::SetTargetRotation

This method sets the target rotation of a motorized hinge or kinematic joint.

## Syntax

- void **SetTargetRotation**(const dFloat rotation)
- void **SetTargetRotation**(const [xVec3](xVec3.md)& rotation)
- void **SetTargetRotation**(const dFloat pitch, const dFloat yaw, const dFloat roll)

| Parameter | Description |
|---|---|
| position, (pitch, yaw, roll) | target rotation to set |

## Remarks

A hinge joint accepts a single rotation value. A kinematic joint requires a quaternion or Euler rotation.

You must call [Joint::SetMaxTorque](Joint_SetMaxTorque.md) and specify a non-zero torque before this command will have any effect.
