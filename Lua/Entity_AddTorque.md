# Entity:AddTorque

This method adds physical torque to the entity, measured in Newton metres.

## Syntax

- void **AddTorque**([xVec3](xVec3.md) torque, boolean global = true)
- void **AddTorque**(number x, number y, number z, boolean global = true)

| Parameter | Description |
| - | - |
| torque, (x, y, z) | torque to add |
| global | set to true to indicate a rotation in global space, otherwise the rotation will be in local space |
