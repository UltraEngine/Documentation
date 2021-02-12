# Entity::SetVelocity #
This method sets the velocity of an entity.

## Syntax ##
- void **SetVelocity**(const double x, const double y, const double z, const bool recursive = true)
- void **SetVelocity**(const [dVec3](dVec3.md)& velocity, const bool recursive = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **x** | x component of velocity |
| **y** | y component of velocity |
| **z** | z component of velocity |
| **velocity** | velocity to set, in meters per second |
| **global** | if set to true velocity is in global space, otherwise local space is used |