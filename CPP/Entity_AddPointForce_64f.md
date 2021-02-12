# Entity::AddPointForce #
This method applies a force, measured in Newtons, to an entity at a specified point. This can result in both movement and rotation of the entity.

## Syntax ##
- void **AddPointForce**(const double fx, const double fy, const double fz, const double x, const double y, const double z, const bool 
- void **AddPointForce**(const [dVec3](dVec3.md)& force, const [dVec3](dVec3.md)& position), const bool global = true)

### Parameters ###
| Name | Description |
| --- | --- |
| **fx** | x component of the force to add |
| **fy** | y component of the force to add |
| **fz** | z component of the force to add |
| **x** | x component of point where the force is applied |
| **y** | y component of point where the force is applied |
| **z** | z component of point where the force is applied |
| **force** | force to add |
| **position** | point where the force is applied |