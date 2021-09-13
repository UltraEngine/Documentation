# Joint::SetTargetPosition

This method sets the target rotation of a motorized hinge or kinematic joint.

## Syntax

- void **SetTargetPosition**(const dFloat position)
- void **SetTargetPosition**(const [xVec3](xVec3.md)& position)
- void **SetTargetPosition**(const dFloat x, const dFloat y, const dFloat z)

| Parameter | Description |
|---|---|
| position, (x, y, z) | target position to set |

## Remarks

A hinge joint accepts a single rotation value. A kinematic joint requires a quaternion or Euler rotation.

You must call [Joint::SetMaxForce](Joint_SetMaxForce.md) and specify a non-zero torque before this command will have any effect.
