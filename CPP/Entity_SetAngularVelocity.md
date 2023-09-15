# Entity::SetAngularVelocity

This method sets the angular velocity of an entity.

## Syntax

- void **SetAngularVelocity**(const [xVec3](xVec3.md)& omega, const bool recursive = true)
- void **SetAngularVelocity**(const dFloat x, const dFloat y, const dFloat z, const bool recursive = true)

| Parameter | Description |
| --- | --- |
| omega, (x, y, z) | angular velocity to set, in degrees per second |
| global | if set to true angular velocity is in global space, otherwise local space is used |
