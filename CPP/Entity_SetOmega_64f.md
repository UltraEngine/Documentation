# Entity::SetOmega #
This method sets the angular velocity of an entity.

## Syntax ##
- void **SetOmega**(const double x, const double y, const double z, const bool recursive = true)
- void **SetOmega**(const [dVec3](dVec3.md)& omega, const bool recursive = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **x** | x component of angular velocity |
| **y** | y component of angular velocity |
| **z** | z component of angular velocity |
| **omega** | angular velocity to set, in radians per second |
| **global** | if set to true angular velocity is in global space, otherwise local space is used |