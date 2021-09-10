# Entity::SetAngularVelocity

This method sets the angular velocity of an entity.

## Syntax

- void **SetOmega**(const [xVec3](xVec3.md)& omega, const bool recursive = true)
- void **SetOmega**(const dFloat x, const dFloat y, const dFloat z, const bool recursive = true)

| Parameter | Description |
| --- | --- |
| omega | angular velocity to set, in radians per second |
| x | X component of angular velocity |
| y | Y component of angular velocity |
| z | Z component of angular velocity |
| global | if set to true angular velocity is in global space, otherwise local space is used |
