# Entity::SetVelocity

This method sets the velocity of an entity.

## Syntax

- void **SetVelocity**(const dFloat x, const dFloat y, const dFloat z, const bool recursive = true)
- void **SetVelocity**(const [xVec3](xVec3.md)& velocity, const bool recursive = true)

| Parameter | Description |
| --- | --- |
| velocity, (x, y, z) | velocity to set, in meters per second |
| global | if set to true velocity is in global space, otherwise local space is used |
