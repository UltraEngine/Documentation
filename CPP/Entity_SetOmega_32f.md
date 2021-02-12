# Entity::SetAngularVelocity #
This method sets the angular velocity of an entity.

## Syntax ##
- void **SetOmega**(const float x, const float y, const float z, const bool recursive = true)
- void **SetOmega**(const [Vec3](Vec3.md)& omega, const bool recursive = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **x** | x component of angular velocity |
| **y** | y component of angular velocity |
| **z** | z component of angular velocity |
| **omega** | angular velocity to set, in radians per second |
| **global** | if set to true angular velocity is in global space, otherwise local space is used |