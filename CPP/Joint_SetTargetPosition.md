# Joint::SetTargetPosition

This method sets the target rotation of a motorized hinge or kinematic joint.

## Syntax

- void **SetTargetPosition**(const dFloat position)
- void **SetTargetPosition**(const [xVec3](xVec3.md)& position)
- void **SetTargetPosition**(const dFloat x, const dFloat y, const dFloat z = 0)

| Parameter | Description |
|---|---|
| position, (x, y, z) | target position to set |

## Remarks

A slider joint accepts a single offset value. A kinematic joint requires a position in 3D space.

You must call [Joint::SetMaxForce](Joint_SetMaxForce.md) and specify a non-zero force before this command will have any effect.
