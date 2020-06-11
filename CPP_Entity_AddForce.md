# Entity::AddForce #
This method adds a physical force to the object, measured in Newtons.

## Syntax ##
- void **AddForce**(const dFloat x, const dFloat y, const dFloat z, const bool global = true)
- void **AddForce**(const [Vec3](CPP_Vec3.md)& force, const bool global = true)
- void **AddForce**(const [dVec3](CPP_dVec3.md)& force, const bool global = true)

### Parameters ###
| Name | Description |
| - | - |
| **x** | x component of force to add |
| **y** | y component of force to add |
| **z** | z component of force to add |
| **force** | force to add |
| **global** | set to true to indicate a vector in global space, otherwise the vector will be in local space |
