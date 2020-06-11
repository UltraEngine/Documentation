# Entity::AddTorque #
This method adds physical torque to the entity, measured in Newton metres.

## Syntax ##
- void **AddTorque**(const dFloat x, const dFloat y, const dFloat z, const bool global = true)
- void **AddTorque**(const [Vec3](CPP_Vec3.md)& torque, const bool global = true)
- void **AddTorque**(const [dVec3](CPP_dVec3.md)& torque, const bool global = true)

### Parameters ###
| Name | Description |
| - | - |
| **x** | x component of torque to add |
| **y** | y component of torque to add |
| **z** | z component of torque to add |
| **force** | torque to add |
| **global** | set to true to indicate a rotation in global space, otherwise the rotation will be in local space |
